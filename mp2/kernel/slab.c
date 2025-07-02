#include "types.h"
#include "param.h"
#include "memlayout.h"
#include "spinlock.h"
#include "riscv.h"
#include "defs.h"
#include "slab.h"
#include "debug.h"
#define NULL ((void*)0)

void print_kmem_cache(struct kmem_cache *cache, void (*slab_obj_printer)(void *))
{
  // TODO: Implement print_kmem_cache
  int cache_objs = (PGSIZE - sizeof(struct kmem_cache)) / cache->object_size;
  debug("[SLAB] kmem_cache { name: %s, object_size: %u, at: %p, in_cache_obj: %d }\n", cache -> name, cache -> object_size, cache, cache_objs);
  debug("[SLAB]  [ %s slabs ]\n", "cache");
  
  debug("[SLAB]  [ slab %p ] { freelist: %p, nxt: %p }\n", cache, cache -> freelist, NULL);
  char *obj_start = (char *)cache + sizeof(struct kmem_cache);
  for (int i = 0; i < cache_objs; i++) {
    void *entry = obj_start + i * cache -> object_size;

    debug("[SLAB]  [ idx %d ] { addr: %p, as_ptr: %p, as_obj: {", i, entry, *(void **)entry);
    slab_obj_printer(entry);
    debug("} }\n");
  }
  if (cache -> partial.next == NULL){
    debug("[SLAB] print_kmem_cache end\n");
    return;
  }

  debug("[SLAB]  [ %s slabs ]\n", "partial");
  struct list_head *pos = cache -> partial.next;
  // struct slab *s = cache -> partial;
  int obj_count = (PGSIZE - sizeof(struct slab)) / cache->object_size;
  while (pos != NULL) {
    struct slab *s = (struct slab *)pos;
    if (s -> available == obj_count){
      pos = pos -> next;
      continue;
    }
    debug("[SLAB]  [ slab %p ] { freelist: %p, nxt: %p }\n", s, s -> freelist, pos -> next);
    void *base = (void *)s;
    void *obj_start = base + sizeof(struct slab);

    for (int i = 0; i < obj_count; i++) {
        void *entry = obj_start + i * cache -> object_size;
        debug("[SLAB]  [ idx %d ] { addr: %p, as_ptr: %p, as_obj: {", i, entry, *(void **)entry);
        slab_obj_printer(entry);
        debug("} }\n");
    }
    
    pos = pos -> next;
  }
  debug("[SLAB] print_kmem_cache end\n");
}

struct kmem_cache *kmem_cache_create(char *name, uint object_size)
{
  // TODO: Implement kmem_cache_create
  
  struct kmem_cache *cache = kalloc();
  unsigned int max_obj = (PGSIZE - sizeof(struct slab)) / object_size;
  int max_cache_obj = (PGSIZE - sizeof(struct kmem_cache)) / object_size;
  debug("[SLAB] New kmem_cache (name: %s, object size: %u bytes, at: %p, max objects per slab: %u, support in cache obj: %d) is created\n", name, object_size, cache, max_obj, max_cache_obj);
  safestrcpy(cache -> name, name, strlen(name) + 1);
  cache -> object_size = object_size;
  cache -> partial.next = NULL;
  cache -> list_nums = 0;

  cache -> freelist = NULL;

  if (max_cache_obj > 0) {
    cache -> freelist = (void **)((char *)cache + sizeof(struct kmem_cache));
    void *ptr = cache -> freelist;

    for (int i = 0; i < max_cache_obj - 1; i++) {
      *(void **)ptr = (char *)ptr + object_size;
      ptr = *(void **)ptr;
    }
    *(void **)ptr = NULL;  // End of freelist
  }
  return cache;
}

void kmem_cache_destroy(struct kmem_cache *cache)
{
  // TODO: Implement kmem_cache_destroy (will not be tested)
  debug("[SLAB] TODO: kmem_cache_destroy is not yet implemented \n");
}

void *kmem_cache_alloc(struct kmem_cache *cache)
{
  // TODO: Implement kmem_cache_alloc
  acquire(&cache -> lock);
  debug("[SLAB] Alloc request on cache %s\n", cache -> name);
  struct object *obj = NULL;

  if (cache->freelist != NULL) {
    void *obj = cache->freelist;
    cache->freelist = *(void **)obj;
    debug("[SLAB] Object %p in slab %p (%s) is allocated and initialized\n", obj, cache, cache -> name);
    release(&cache->lock);
    return obj;
  }
  else if (cache -> partial.next != NULL){
    struct slab *slab = (struct slab *)(cache -> partial.next);
    obj = slab -> freelist;
    slab -> freelist = obj -> next_free_obj;
    if (slab -> freelist != NULL)
      slab -> freelist -> prev_slab = obj -> prev_slab;
    debug("[SLAB] Object %p in slab %p (%s) is allocated and initialized\n", obj, slab, cache -> name);
    slab -> available -= 1;
    if (slab -> freelist == NULL){
      cache -> partial.next = slab -> list.next;
      if (cache -> partial.next != NULL)
        ((struct slab *)(cache -> partial.next)) -> freelist -> prev_slab = NULL;
      cache -> list_nums -= 1;
    }
    release(&cache -> lock);
    return obj;
    // allocate free_obj
  }
  else {
    struct slab *new_slab = (struct slab *)kalloc();
    debug("[SLAB] A new slab %p (%s) is allocated\n", new_slab, cache -> name);
    new_slab -> list.next = NULL;
    new_slab -> freelist = (struct object *) ((char *)new_slab + sizeof(struct slab));
    unsigned int max_obj = (PGSIZE - sizeof(struct slab)) / cache -> object_size;
    struct object *temp = new_slab -> freelist;
    for (int i = 0; i < max_obj - 1; i++){
      temp -> next_free_obj = (struct object *) ((char *)temp + (cache -> object_size));
      temp -> prev_slab = NULL;
      temp = temp -> next_free_obj;
    }
    temp -> next_free_obj = NULL;
    temp -> prev_slab = NULL;

    new_slab -> available = max_obj - 1;
    if (max_obj > 1){
      cache -> partial.next = &new_slab -> list;
      cache -> list_nums += 1;
    }
    obj = new_slab -> freelist;
    debug("[SLAB] Object %p in slab %p (%s) is allocated and initialized\n", obj, new_slab, cache -> name);
    new_slab -> freelist = obj -> next_free_obj;


    release(&cache -> lock);
    return obj;
  }
  // acquire(&cache->lock); // acquire the lock before modification
  // ... (modify kmem_cache)
  // release(&cache->lock); // release the lock before return
  return 0;
}

void kmem_cache_free(struct kmem_cache *cache, void *obj)
{
  // TODO: Implement kmem_cache_free
  acquire(&cache -> lock);
  if (((uint64)obj & ~(PGSIZE - 1)) == ((uint64)cache & ~(PGSIZE - 1))) {
    *(void **)obj = cache->freelist;
    cache -> freelist = (void **)obj;
    debug("[SLAB] Free %p in slab %p (%s)\n", obj, cache, cache->name);
    debug("[SLAB] End of free\n");
    release(&cache->lock);
    return;
  }

  struct slab *s = (void *)((uint64)obj & ~(PGSIZE - 1));
  struct object *obj_ptr = (struct object *)obj;
  debug("[SLAB] Free %p in slab %p (%s)\n", obj, s, cache -> name);

  obj_ptr -> next_free_obj = s -> freelist;
  obj_ptr -> prev_slab = NULL;
  if (s -> freelist != NULL){
    obj_ptr -> prev_slab = s -> freelist -> prev_slab;
    s -> freelist -> prev_slab = NULL;
  }
  s -> freelist = obj_ptr;

  s -> available += 1;
  unsigned int max_obj = (PGSIZE - sizeof(struct slab)) / cache -> object_size;
  if (s -> available == 1){ // From full to partial or full to free
    s -> list.next = cache -> partial.next;
    if (cache -> partial.next != NULL)
      ((struct slab *)(cache -> partial.next)) -> freelist -> prev_slab = s;
    cache -> partial.next = &s -> list;
    cache -> list_nums += 1;
  }
  if (s -> available == max_obj){ // From partial to free or full to free
    if (cache -> list_nums > MP2_MIN_AVAIL_SLAB){
      /*
      struct list_head *prev = NULL;
      struct list_head *curr = cache -> partial.next;

      while (curr != NULL) {
        struct slab *curr_slab = (struct slab *)curr;
        if (curr_slab == s) {
          if (prev != NULL)
            prev -> next = curr -> next;
          else
            cache -> partial.next = curr -> next; // s is the first node
          break;
        }
        prev = curr;
        curr = curr -> next;
      }
      */
      if (s -> freelist -> prev_slab != NULL){
        s -> freelist -> prev_slab -> list.next = s -> list.next;
        if (s -> list.next != NULL)
          ((struct slab *)(s -> list.next)) -> freelist -> prev_slab = s -> freelist -> prev_slab;
      }
      else {
        cache -> partial.next = s -> list.next;
        if (cache -> partial.next != NULL)
          ((struct slab *)(cache -> partial.next)) -> freelist -> prev_slab = NULL;
      }
      debug("[SLAB] slab %p (%s) is freed due to save memory\n", s, cache -> name);
      cache -> list_nums -= 1;
      kfree(s);
    }
  }

  debug("[SLAB] End of free\n");
  release(&cache -> lock);

  

  // acquire(&cache->lock); // acquire the lock before modification
  // ... (modify kmem_cache)
  // release(&cache->lock); // release the lock before return
}
