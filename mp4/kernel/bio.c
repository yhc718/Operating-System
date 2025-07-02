// Buffer cache.
//
// The buffer cache is a linked list of buf structures holding
// cached copies of disk block contents.  Caching disk blocks
// in memory reduces the number of disk reads and also provides
// a synchronization point for disk blocks used by multiple processes.
//
// Interface:
// * To get a buffer for a particular disk block, call bread.
// * After changing buffer data, call bwrite to write it to disk.
// * When done with the buffer, call brelse.
// * Do not use the buffer after calling brelse.
// * Only one process at a time can use a buffer,
//     so do not keep them longer than necessary.

#include "types.h"
#include "param.h"
#include "spinlock.h"
#include "sleeplock.h"
#include "riscv.h"
#include "defs.h"
#include "fs.h"
#include "buf.h"

// Added: global variable added
extern int force_read_error_pbn;
extern int force_disk_fail_id;

struct
{
    struct spinlock lock;
    struct buf buf[NBUF];

    // Linked list of all buffers, through prev/next.
    // Sorted by how recently the buffer was used.
    // head.next is most recent, head.prev is least.
    struct buf head;
} bcache;

void binit(void)
{
    struct buf *b;

    initlock(&bcache.lock, "bcache");

    // Create linked list of buffers
    bcache.head.prev = &bcache.head;
    bcache.head.next = &bcache.head;
    for (b = bcache.buf; b < bcache.buf + NBUF; b++)
    {
        b->next = bcache.head.next;
        b->prev = &bcache.head;
        initsleeplock(&b->lock, "buffer");
        bcache.head.next->prev = b;
        bcache.head.next = b;
    }
}

// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
struct buf *bget(uint dev, uint blockno)
{
    struct buf *b;

    acquire(&bcache.lock);

    // Is the block already cached?
    for (b = bcache.head.next; b != &bcache.head; b = b->next)
    {
        if (b->dev == dev && b->blockno == blockno)
        {
            b->refcnt++;
            release(&bcache.lock);
            acquiresleep(&b->lock);
            return b;
        }
    }

    // Not cached.
    // Recycle the least recently used (LRU) unused buffer.
    for (b = bcache.head.prev; b != &bcache.head; b = b->prev)
    {
        if (b->refcnt == 0)
        {
            b->dev = dev;
            b->blockno = blockno;
            b->valid = 0;
            b->refcnt = 1;
            release(&bcache.lock);
            acquiresleep(&b->lock);
            return b;
        }
    }
    panic("bget: no buffers");
}

// TODO: RAID 1 simulation
// Return a locked buf with the contents of the indicated block.
struct buf *bread(uint dev, uint blockno)
{
    struct buf *b;
    // Added: Flag used in fallback_test (Don't modify their name!!)
    int is_forced_fail_target = 0;

    int pbn0 = blockno;
    int pbn1 = pbn0 + DISK1_START_BLOCK;
    int fail_disk = force_disk_fail_id;
    int block_fail = (force_read_error_pbn == pbn0);
    
    b = bget(dev, blockno);

    // Force cache miss if simulation error
    is_forced_fail_target = (fail_disk == 0 || block_fail);

    if (!b->valid || is_forced_fail_target)
    {
        if (is_forced_fail_target){
            b->blockno = pbn1;
            virtio_disk_rw(b, 0);
            b->blockno = pbn0;
        }
        else 
            virtio_disk_rw(b, 0);
        b->valid = 1;
    }
    return b;
}

// TODO: RAID 1 simulation
// Write b's contents to disk.  Must be locked.
void bwrite(struct buf *b)
{
    if (!holdingsleep(&b->lock))
        panic("bwrite");

    int pbn0 = b -> blockno;
    int pbn1 = pbn0 + DISK1_START_BLOCK;
    int fail_disk = force_disk_fail_id;
    int block_fail = (force_read_error_pbn == pbn0);
    printf("BW_DIAG: PBN0=%d, PBN1=%d, sim_disk_fail=%d, sim_pbn0_block_fail=%d\n",
           pbn0, pbn1, fail_disk, block_fail);

    if (fail_disk == 0){
        printf("BW_ACTION: SKIP_PBN0 (PBN %d) due to simulated Disk 0 failure.\n", pbn0);
    }
    else if (block_fail){
        printf("BW_ACTION: SKIP_PBN0 (PBN %d) due to simulated PBN0 block failure.\n", pbn0);
    }
    else {
        printf("BW_ACTION: ATTEMPT_PBN0 (PBN %d).\n", pbn0);
        b->blockno = pbn0;
        virtio_disk_rw(b, 1);
    }

    if (fail_disk == 1) {
        printf("BW_ACTION: SKIP_PBN1 (PBN %d) due to simulated Disk 1 failure.\n", pbn1);
    } else {
        printf("BW_ACTION: ATTEMPT_PBN1 (PBN %d).\n", pbn1);
        b->blockno = pbn1;
        virtio_disk_rw(b, 1);
    }

    b -> blockno = pbn0;
}

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void brelse(struct buf *b)
{
    if (!holdingsleep(&b->lock))
        panic("brelse");

    releasesleep(&b->lock);

    acquire(&bcache.lock);
    b->refcnt--;
    if (b->refcnt == 0)
    {
        // no one is waiting for it.
        b->next->prev = b->prev;
        b->prev->next = b->next;
        b->next = bcache.head.next;
        b->prev = &bcache.head;
        bcache.head.next->prev = b;
        bcache.head.next = b;
    }

    release(&bcache.lock);
}

void bpin(struct buf *b)
{
    acquire(&bcache.lock);
    b->refcnt++;
    release(&bcache.lock);
}

void bunpin(struct buf *b)
{
    acquire(&bcache.lock);
    b->refcnt--;
    release(&bcache.lock);
}
