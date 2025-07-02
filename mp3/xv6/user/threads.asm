
user/_threads:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <__list_add>:
 * the prev/next entries already!
 */
static inline void __list_add(struct list_head *new_entry,
                              struct list_head *prev,
                              struct list_head *next)
{
       0:	7179                	addi	sp,sp,-48
       2:	f422                	sd	s0,40(sp)
       4:	1800                	addi	s0,sp,48
       6:	fea43423          	sd	a0,-24(s0)
       a:	feb43023          	sd	a1,-32(s0)
       e:	fcc43c23          	sd	a2,-40(s0)
    next->prev = new_entry;
      12:	fd843783          	ld	a5,-40(s0)
      16:	fe843703          	ld	a4,-24(s0)
      1a:	e798                	sd	a4,8(a5)
    new_entry->next = next;
      1c:	fe843783          	ld	a5,-24(s0)
      20:	fd843703          	ld	a4,-40(s0)
      24:	e398                	sd	a4,0(a5)
    new_entry->prev = prev;
      26:	fe843783          	ld	a5,-24(s0)
      2a:	fe043703          	ld	a4,-32(s0)
      2e:	e798                	sd	a4,8(a5)
    prev->next = new_entry;
      30:	fe043783          	ld	a5,-32(s0)
      34:	fe843703          	ld	a4,-24(s0)
      38:	e398                	sd	a4,0(a5)
}
      3a:	0001                	nop
      3c:	7422                	ld	s0,40(sp)
      3e:	6145                	addi	sp,sp,48
      40:	8082                	ret

0000000000000042 <list_add_tail>:
 *
 * Insert a new entry before the specified head.
 * This is useful for implementing queues.
 */
static inline void list_add_tail(struct list_head *new_entry, struct list_head *head)
{
      42:	1101                	addi	sp,sp,-32
      44:	ec06                	sd	ra,24(sp)
      46:	e822                	sd	s0,16(sp)
      48:	1000                	addi	s0,sp,32
      4a:	fea43423          	sd	a0,-24(s0)
      4e:	feb43023          	sd	a1,-32(s0)
    __list_add(new_entry, head->prev, head);
      52:	fe043783          	ld	a5,-32(s0)
      56:	679c                	ld	a5,8(a5)
      58:	fe043603          	ld	a2,-32(s0)
      5c:	85be                	mv	a1,a5
      5e:	fe843503          	ld	a0,-24(s0)
      62:	00000097          	auipc	ra,0x0
      66:	f9e080e7          	jalr	-98(ra) # 0 <__list_add>
}
      6a:	0001                	nop
      6c:	60e2                	ld	ra,24(sp)
      6e:	6442                	ld	s0,16(sp)
      70:	6105                	addi	sp,sp,32
      72:	8082                	ret

0000000000000074 <__list_del>:
 *
 * This is only for internal list manipulation where we know
 * the prev/next entries already!
 */
static inline void __list_del(struct list_head *prev, struct list_head *next)
{
      74:	1101                	addi	sp,sp,-32
      76:	ec22                	sd	s0,24(sp)
      78:	1000                	addi	s0,sp,32
      7a:	fea43423          	sd	a0,-24(s0)
      7e:	feb43023          	sd	a1,-32(s0)
    next->prev = prev;
      82:	fe043783          	ld	a5,-32(s0)
      86:	fe843703          	ld	a4,-24(s0)
      8a:	e798                	sd	a4,8(a5)
    prev->next = next;
      8c:	fe843783          	ld	a5,-24(s0)
      90:	fe043703          	ld	a4,-32(s0)
      94:	e398                	sd	a4,0(a5)
}
      96:	0001                	nop
      98:	6462                	ld	s0,24(sp)
      9a:	6105                	addi	sp,sp,32
      9c:	8082                	ret

000000000000009e <list_del>:
 * @entry: the element to delete from the list.
 * Note: list_empty on entry does not return true after this, the entry is
 * in an undefined state.
 */
static inline void list_del(struct list_head *entry)
{
      9e:	1101                	addi	sp,sp,-32
      a0:	ec06                	sd	ra,24(sp)
      a2:	e822                	sd	s0,16(sp)
      a4:	1000                	addi	s0,sp,32
      a6:	fea43423          	sd	a0,-24(s0)
    __list_del(entry->prev, entry->next);
      aa:	fe843783          	ld	a5,-24(s0)
      ae:	6798                	ld	a4,8(a5)
      b0:	fe843783          	ld	a5,-24(s0)
      b4:	639c                	ld	a5,0(a5)
      b6:	85be                	mv	a1,a5
      b8:	853a                	mv	a0,a4
      ba:	00000097          	auipc	ra,0x0
      be:	fba080e7          	jalr	-70(ra) # 74 <__list_del>
    entry->next = LIST_POISON1;
      c2:	fe843783          	ld	a5,-24(s0)
      c6:	00100737          	lui	a4,0x100
      ca:	10070713          	addi	a4,a4,256 # 100100 <__global_pointer$+0xfda90>
      ce:	e398                	sd	a4,0(a5)
    entry->prev = LIST_POISON2;
      d0:	fe843783          	ld	a5,-24(s0)
      d4:	00200737          	lui	a4,0x200
      d8:	20070713          	addi	a4,a4,512 # 200200 <__global_pointer$+0x1fdb90>
      dc:	e798                	sd	a4,8(a5)
}
      de:	0001                	nop
      e0:	60e2                	ld	ra,24(sp)
      e2:	6442                	ld	s0,16(sp)
      e4:	6105                	addi	sp,sp,32
      e6:	8082                	ret

00000000000000e8 <list_empty>:
/**
 * list_empty - tests whether a list is empty
 * @head: the list to test.
 */
static inline int list_empty(const struct list_head *head)
{
      e8:	1101                	addi	sp,sp,-32
      ea:	ec22                	sd	s0,24(sp)
      ec:	1000                	addi	s0,sp,32
      ee:	fea43423          	sd	a0,-24(s0)
    return head->next == head;
      f2:	fe843783          	ld	a5,-24(s0)
      f6:	639c                	ld	a5,0(a5)
      f8:	fe843703          	ld	a4,-24(s0)
      fc:	40f707b3          	sub	a5,a4,a5
     100:	0017b793          	seqz	a5,a5
     104:	0ff7f793          	andi	a5,a5,255
     108:	2781                	sext.w	a5,a5
}
     10a:	853e                	mv	a0,a5
     10c:	6462                	ld	s0,24(sp)
     10e:	6105                	addi	sp,sp,32
     110:	8082                	ret

0000000000000112 <thread_create>:

void __dispatch(void);
void __schedule(void);

struct thread *thread_create(void (*f)(void *), void *arg, int is_real_time, int processing_time, int period, int n)
{
     112:	715d                	addi	sp,sp,-80
     114:	e486                	sd	ra,72(sp)
     116:	e0a2                	sd	s0,64(sp)
     118:	0880                	addi	s0,sp,80
     11a:	fca43423          	sd	a0,-56(s0)
     11e:	fcb43023          	sd	a1,-64(s0)
     122:	85b2                	mv	a1,a2
     124:	8636                	mv	a2,a3
     126:	86ba                	mv	a3,a4
     128:	873e                	mv	a4,a5
     12a:	87ae                	mv	a5,a1
     12c:	faf42e23          	sw	a5,-68(s0)
     130:	87b2                	mv	a5,a2
     132:	faf42c23          	sw	a5,-72(s0)
     136:	87b6                	mv	a5,a3
     138:	faf42a23          	sw	a5,-76(s0)
     13c:	87ba                	mv	a5,a4
     13e:	faf42823          	sw	a5,-80(s0)
    static int _id = 1;
    struct thread *t = (struct thread *)malloc(sizeof(struct thread));
     142:	08000513          	li	a0,128
     146:	00001097          	auipc	ra,0x1
     14a:	6c0080e7          	jalr	1728(ra) # 1806 <malloc>
     14e:	fea43423          	sd	a0,-24(s0)
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long)malloc(sizeof(unsigned long) * 0x200);
     152:	6505                	lui	a0,0x1
     154:	00001097          	auipc	ra,0x1
     158:	6b2080e7          	jalr	1714(ra) # 1806 <malloc>
     15c:	87aa                	mv	a5,a0
     15e:	fef43023          	sd	a5,-32(s0)
    new_stack_p = new_stack + 0x200 * 8 - 0x2 * 8;
     162:	fe043703          	ld	a4,-32(s0)
     166:	6785                	lui	a5,0x1
     168:	17c1                	addi	a5,a5,-16
     16a:	97ba                	add	a5,a5,a4
     16c:	fcf43c23          	sd	a5,-40(s0)
    t->fp = f;
     170:	fe843783          	ld	a5,-24(s0)
     174:	fc843703          	ld	a4,-56(s0)
     178:	e398                	sd	a4,0(a5)
    t->arg = arg;
     17a:	fe843783          	ld	a5,-24(s0)
     17e:	fc043703          	ld	a4,-64(s0)
     182:	e798                	sd	a4,8(a5)
    t->ID = _id++;
     184:	00002797          	auipc	a5,0x2
     188:	d2478793          	addi	a5,a5,-732 # 1ea8 <_id.1239>
     18c:	439c                	lw	a5,0(a5)
     18e:	0017871b          	addiw	a4,a5,1
     192:	0007069b          	sext.w	a3,a4
     196:	00002717          	auipc	a4,0x2
     19a:	d1270713          	addi	a4,a4,-750 # 1ea8 <_id.1239>
     19e:	c314                	sw	a3,0(a4)
     1a0:	fe843703          	ld	a4,-24(s0)
     1a4:	df5c                	sw	a5,60(a4)
    t->buf_set = 0;
     1a6:	fe843783          	ld	a5,-24(s0)
     1aa:	0207a023          	sw	zero,32(a5)
    t->stack = (void *)new_stack;
     1ae:	fe043703          	ld	a4,-32(s0)
     1b2:	fe843783          	ld	a5,-24(s0)
     1b6:	eb98                	sd	a4,16(a5)
    t->stack_p = (void *)new_stack_p;
     1b8:	fd843703          	ld	a4,-40(s0)
     1bc:	fe843783          	ld	a5,-24(s0)
     1c0:	ef98                	sd	a4,24(a5)

    t->processing_time = processing_time;
     1c2:	fe843783          	ld	a5,-24(s0)
     1c6:	fb842703          	lw	a4,-72(s0)
     1ca:	c3f8                	sw	a4,68(a5)
    t->period = period;
     1cc:	fe843783          	ld	a5,-24(s0)
     1d0:	fb442703          	lw	a4,-76(s0)
     1d4:	c7f8                	sw	a4,76(a5)
    t->deadline = period;
     1d6:	fe843783          	ld	a5,-24(s0)
     1da:	fb442703          	lw	a4,-76(s0)
     1de:	c7b8                	sw	a4,72(a5)
    t->n = n;
     1e0:	fe843783          	ld	a5,-24(s0)
     1e4:	fb042703          	lw	a4,-80(s0)
     1e8:	cbb8                	sw	a4,80(a5)
    t->is_real_time = is_real_time;
     1ea:	fe843783          	ld	a5,-24(s0)
     1ee:	fbc42703          	lw	a4,-68(s0)
     1f2:	c3b8                	sw	a4,64(a5)
    t->remaining_time = processing_time;
     1f4:	fe843783          	ld	a5,-24(s0)
     1f8:	fb842703          	lw	a4,-72(s0)
     1fc:	cbf8                	sw	a4,84(a5)
    t->current_deadline = 0;
     1fe:	fe843783          	ld	a5,-24(s0)
     202:	0407ac23          	sw	zero,88(a5)
    t->priority = 100;
     206:	fe843783          	ld	a5,-24(s0)
     20a:	06400713          	li	a4,100
     20e:	cff8                	sw	a4,92(a5)
    t->arrival_time = 30000;
     210:	fe843783          	ld	a5,-24(s0)
     214:	671d                	lui	a4,0x7
     216:	5307071b          	addiw	a4,a4,1328
     21a:	d3b8                	sw	a4,96(a5)
    
    return t;
     21c:	fe843783          	ld	a5,-24(s0)
}
     220:	853e                	mv	a0,a5
     222:	60a6                	ld	ra,72(sp)
     224:	6406                	ld	s0,64(sp)
     226:	6161                	addi	sp,sp,80
     228:	8082                	ret

000000000000022a <thread_set_priority>:

void thread_set_priority(struct thread *t, int priority)
{
     22a:	1101                	addi	sp,sp,-32
     22c:	ec22                	sd	s0,24(sp)
     22e:	1000                	addi	s0,sp,32
     230:	fea43423          	sd	a0,-24(s0)
     234:	87ae                	mv	a5,a1
     236:	fef42223          	sw	a5,-28(s0)
    t->priority = priority;
     23a:	fe843783          	ld	a5,-24(s0)
     23e:	fe442703          	lw	a4,-28(s0)
     242:	cff8                	sw	a4,92(a5)
}
     244:	0001                	nop
     246:	6462                	ld	s0,24(sp)
     248:	6105                	addi	sp,sp,32
     24a:	8082                	ret

000000000000024c <init_thread_cbs>:
void init_thread_cbs(struct thread *t, int budget, int is_hard_rt)
{
     24c:	1101                	addi	sp,sp,-32
     24e:	ec22                	sd	s0,24(sp)
     250:	1000                	addi	s0,sp,32
     252:	fea43423          	sd	a0,-24(s0)
     256:	87ae                	mv	a5,a1
     258:	8732                	mv	a4,a2
     25a:	fef42223          	sw	a5,-28(s0)
     25e:	87ba                	mv	a5,a4
     260:	fef42023          	sw	a5,-32(s0)
    t->cbs.budget = budget;
     264:	fe843783          	ld	a5,-24(s0)
     268:	fe442703          	lw	a4,-28(s0)
     26c:	d3f8                	sw	a4,100(a5)
    t->cbs.remaining_budget = budget; 
     26e:	fe843783          	ld	a5,-24(s0)
     272:	fe442703          	lw	a4,-28(s0)
     276:	d7b8                	sw	a4,104(a5)
    t->cbs.is_hard_rt = is_hard_rt;
     278:	fe843783          	ld	a5,-24(s0)
     27c:	fe042703          	lw	a4,-32(s0)
     280:	d7f8                	sw	a4,108(a5)
    t->cbs.is_throttled = 0;
     282:	fe843783          	ld	a5,-24(s0)
     286:	0607a823          	sw	zero,112(a5)
    t->cbs.throttled_arrived_time = 0;
     28a:	fe843783          	ld	a5,-24(s0)
     28e:	0607aa23          	sw	zero,116(a5)
    t->cbs.throttle_new_deadline = 0;
     292:	fe843783          	ld	a5,-24(s0)
     296:	0607ac23          	sw	zero,120(a5)
}
     29a:	0001                	nop
     29c:	6462                	ld	s0,24(sp)
     29e:	6105                	addi	sp,sp,32
     2a0:	8082                	ret

00000000000002a2 <thread_add_at>:
void thread_add_at(struct thread *t, int arrival_time)
{
     2a2:	7179                	addi	sp,sp,-48
     2a4:	f406                	sd	ra,40(sp)
     2a6:	f022                	sd	s0,32(sp)
     2a8:	1800                	addi	s0,sp,48
     2aa:	fca43c23          	sd	a0,-40(s0)
     2ae:	87ae                	mv	a5,a1
     2b0:	fcf42a23          	sw	a5,-44(s0)
    struct release_queue_entry *new_entry = (struct release_queue_entry *)malloc(sizeof(struct release_queue_entry));
     2b4:	02000513          	li	a0,32
     2b8:	00001097          	auipc	ra,0x1
     2bc:	54e080e7          	jalr	1358(ra) # 1806 <malloc>
     2c0:	fea43423          	sd	a0,-24(s0)
    new_entry->thrd = t;
     2c4:	fe843783          	ld	a5,-24(s0)
     2c8:	fd843703          	ld	a4,-40(s0)
     2cc:	e398                	sd	a4,0(a5)
    new_entry->release_time = arrival_time;
     2ce:	fe843783          	ld	a5,-24(s0)
     2d2:	fd442703          	lw	a4,-44(s0)
     2d6:	cf98                	sw	a4,24(a5)
    t->arrival_time = arrival_time;
     2d8:	fd843783          	ld	a5,-40(s0)
     2dc:	fd442703          	lw	a4,-44(s0)
     2e0:	d3b8                	sw	a4,96(a5)
    // t->remaining_time = t->processing_time;
    if (t->is_real_time) {
     2e2:	fd843783          	ld	a5,-40(s0)
     2e6:	43bc                	lw	a5,64(a5)
     2e8:	cf81                	beqz	a5,300 <thread_add_at+0x5e>
        t->current_deadline = arrival_time + t->deadline;
     2ea:	fd843783          	ld	a5,-40(s0)
     2ee:	47bc                	lw	a5,72(a5)
     2f0:	fd442703          	lw	a4,-44(s0)
     2f4:	9fb9                	addw	a5,a5,a4
     2f6:	0007871b          	sext.w	a4,a5
     2fa:	fd843783          	ld	a5,-40(s0)
     2fe:	cfb8                	sw	a4,88(a5)
    }
    list_add_tail(&new_entry->thread_list, &release_queue);
     300:	fe843783          	ld	a5,-24(s0)
     304:	07a1                	addi	a5,a5,8
     306:	00002597          	auipc	a1,0x2
     30a:	b7a58593          	addi	a1,a1,-1158 # 1e80 <release_queue>
     30e:	853e                	mv	a0,a5
     310:	00000097          	auipc	ra,0x0
     314:	d32080e7          	jalr	-718(ra) # 42 <list_add_tail>
}
     318:	0001                	nop
     31a:	70a2                	ld	ra,40(sp)
     31c:	7402                	ld	s0,32(sp)
     31e:	6145                	addi	sp,sp,48
     320:	8082                	ret

0000000000000322 <__release>:

void __release()
{
     322:	7139                	addi	sp,sp,-64
     324:	fc06                	sd	ra,56(sp)
     326:	f822                	sd	s0,48(sp)
     328:	0080                	addi	s0,sp,64
    struct release_queue_entry *cur, *nxt;
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
     32a:	00002797          	auipc	a5,0x2
     32e:	b5678793          	addi	a5,a5,-1194 # 1e80 <release_queue>
     332:	639c                	ld	a5,0(a5)
     334:	fcf43c23          	sd	a5,-40(s0)
     338:	fd843783          	ld	a5,-40(s0)
     33c:	17e1                	addi	a5,a5,-8
     33e:	fef43423          	sd	a5,-24(s0)
     342:	fe843783          	ld	a5,-24(s0)
     346:	679c                	ld	a5,8(a5)
     348:	fcf43823          	sd	a5,-48(s0)
     34c:	fd043783          	ld	a5,-48(s0)
     350:	17e1                	addi	a5,a5,-8
     352:	fef43023          	sd	a5,-32(s0)
     356:	a851                	j	3ea <__release+0xc8>
        if (threading_system_time >= cur->release_time) {
     358:	fe843783          	ld	a5,-24(s0)
     35c:	4f98                	lw	a4,24(a5)
     35e:	00002797          	auipc	a5,0x2
     362:	b5a78793          	addi	a5,a5,-1190 # 1eb8 <threading_system_time>
     366:	439c                	lw	a5,0(a5)
     368:	06e7c363          	blt	a5,a4,3ce <__release+0xac>
            cur->thrd->remaining_time = cur->thrd->processing_time;
     36c:	fe843783          	ld	a5,-24(s0)
     370:	6398                	ld	a4,0(a5)
     372:	fe843783          	ld	a5,-24(s0)
     376:	639c                	ld	a5,0(a5)
     378:	4378                	lw	a4,68(a4)
     37a:	cbf8                	sw	a4,84(a5)
            cur->thrd->current_deadline = cur->release_time + cur->thrd->deadline;
     37c:	fe843783          	ld	a5,-24(s0)
     380:	4f94                	lw	a3,24(a5)
     382:	fe843783          	ld	a5,-24(s0)
     386:	639c                	ld	a5,0(a5)
     388:	47b8                	lw	a4,72(a5)
     38a:	fe843783          	ld	a5,-24(s0)
     38e:	639c                	ld	a5,0(a5)
     390:	9f35                	addw	a4,a4,a3
     392:	2701                	sext.w	a4,a4
     394:	cfb8                	sw	a4,88(a5)
            list_add_tail(&cur->thrd->thread_list, &run_queue);
     396:	fe843783          	ld	a5,-24(s0)
     39a:	639c                	ld	a5,0(a5)
     39c:	02878793          	addi	a5,a5,40
     3a0:	00002597          	auipc	a1,0x2
     3a4:	ad058593          	addi	a1,a1,-1328 # 1e70 <run_queue>
     3a8:	853e                	mv	a0,a5
     3aa:	00000097          	auipc	ra,0x0
     3ae:	c98080e7          	jalr	-872(ra) # 42 <list_add_tail>
            list_del(&cur->thread_list);
     3b2:	fe843783          	ld	a5,-24(s0)
     3b6:	07a1                	addi	a5,a5,8
     3b8:	853e                	mv	a0,a5
     3ba:	00000097          	auipc	ra,0x0
     3be:	ce4080e7          	jalr	-796(ra) # 9e <list_del>
            free(cur);
     3c2:	fe843503          	ld	a0,-24(s0)
     3c6:	00001097          	auipc	ra,0x1
     3ca:	29e080e7          	jalr	670(ra) # 1664 <free>
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
     3ce:	fe043783          	ld	a5,-32(s0)
     3d2:	fef43423          	sd	a5,-24(s0)
     3d6:	fe043783          	ld	a5,-32(s0)
     3da:	679c                	ld	a5,8(a5)
     3dc:	fcf43423          	sd	a5,-56(s0)
     3e0:	fc843783          	ld	a5,-56(s0)
     3e4:	17e1                	addi	a5,a5,-8
     3e6:	fef43023          	sd	a5,-32(s0)
     3ea:	fe843783          	ld	a5,-24(s0)
     3ee:	00878713          	addi	a4,a5,8
     3f2:	00002797          	auipc	a5,0x2
     3f6:	a8e78793          	addi	a5,a5,-1394 # 1e80 <release_queue>
     3fa:	f4f71fe3          	bne	a4,a5,358 <__release+0x36>
        }
    }
}
     3fe:	0001                	nop
     400:	0001                	nop
     402:	70e2                	ld	ra,56(sp)
     404:	7442                	ld	s0,48(sp)
     406:	6121                	addi	sp,sp,64
     408:	8082                	ret

000000000000040a <__thread_exit>:

void __thread_exit(struct thread *to_remove)
{
     40a:	1101                	addi	sp,sp,-32
     40c:	ec06                	sd	ra,24(sp)
     40e:	e822                	sd	s0,16(sp)
     410:	1000                	addi	s0,sp,32
     412:	fea43423          	sd	a0,-24(s0)
    current = to_remove->thread_list.prev;
     416:	fe843783          	ld	a5,-24(s0)
     41a:	7b98                	ld	a4,48(a5)
     41c:	00002797          	auipc	a5,0x2
     420:	a9478793          	addi	a5,a5,-1388 # 1eb0 <current>
     424:	e398                	sd	a4,0(a5)
    list_del(&to_remove->thread_list);
     426:	fe843783          	ld	a5,-24(s0)
     42a:	02878793          	addi	a5,a5,40
     42e:	853e                	mv	a0,a5
     430:	00000097          	auipc	ra,0x0
     434:	c6e080e7          	jalr	-914(ra) # 9e <list_del>

    free(to_remove->stack);
     438:	fe843783          	ld	a5,-24(s0)
     43c:	6b9c                	ld	a5,16(a5)
     43e:	853e                	mv	a0,a5
     440:	00001097          	auipc	ra,0x1
     444:	224080e7          	jalr	548(ra) # 1664 <free>
    free(to_remove);
     448:	fe843503          	ld	a0,-24(s0)
     44c:	00001097          	auipc	ra,0x1
     450:	218080e7          	jalr	536(ra) # 1664 <free>

    __schedule();
     454:	00000097          	auipc	ra,0x0
     458:	5ae080e7          	jalr	1454(ra) # a02 <__schedule>
    __dispatch();
     45c:	00000097          	auipc	ra,0x0
     460:	416080e7          	jalr	1046(ra) # 872 <__dispatch>
    thrdresume(main_thrd_id);
     464:	00002797          	auipc	a5,0x2
     468:	a4078793          	addi	a5,a5,-1472 # 1ea4 <main_thrd_id>
     46c:	439c                	lw	a5,0(a5)
     46e:	853e                	mv	a0,a5
     470:	00001097          	auipc	ra,0x1
     474:	d06080e7          	jalr	-762(ra) # 1176 <thrdresume>
}
     478:	0001                	nop
     47a:	60e2                	ld	ra,24(sp)
     47c:	6442                	ld	s0,16(sp)
     47e:	6105                	addi	sp,sp,32
     480:	8082                	ret

0000000000000482 <thread_exit>:

void thread_exit(void)
{
     482:	7179                	addi	sp,sp,-48
     484:	f406                	sd	ra,40(sp)
     486:	f022                	sd	s0,32(sp)
     488:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
     48a:	00002797          	auipc	a5,0x2
     48e:	a2678793          	addi	a5,a5,-1498 # 1eb0 <current>
     492:	6398                	ld	a4,0(a5)
     494:	00002797          	auipc	a5,0x2
     498:	9dc78793          	addi	a5,a5,-1572 # 1e70 <run_queue>
     49c:	02f71063          	bne	a4,a5,4bc <thread_exit+0x3a>
        fprintf(2, "[FATAL] thread_exit is called on a nonexistent thread\n");
     4a0:	00002597          	auipc	a1,0x2
     4a4:	85058593          	addi	a1,a1,-1968 # 1cf0 <schedule_dm+0x248>
     4a8:	4509                	li	a0,2
     4aa:	00001097          	auipc	ra,0x1
     4ae:	112080e7          	jalr	274(ra) # 15bc <fprintf>
        exit(1);
     4b2:	4505                	li	a0,1
     4b4:	00001097          	auipc	ra,0x1
     4b8:	c1a080e7          	jalr	-998(ra) # 10ce <exit>
    }

    struct thread *to_remove = list_entry(current, struct thread, thread_list);
     4bc:	00002797          	auipc	a5,0x2
     4c0:	9f478793          	addi	a5,a5,-1548 # 1eb0 <current>
     4c4:	639c                	ld	a5,0(a5)
     4c6:	fef43423          	sd	a5,-24(s0)
     4ca:	fe843783          	ld	a5,-24(s0)
     4ce:	fd878793          	addi	a5,a5,-40
     4d2:	fef43023          	sd	a5,-32(s0)
    int consume_ticks = cancelthrdstop(to_remove->thrdstop_context_id, 1);
     4d6:	fe043783          	ld	a5,-32(s0)
     4da:	5f9c                	lw	a5,56(a5)
     4dc:	4585                	li	a1,1
     4de:	853e                	mv	a0,a5
     4e0:	00001097          	auipc	ra,0x1
     4e4:	c9e080e7          	jalr	-866(ra) # 117e <cancelthrdstop>
     4e8:	87aa                	mv	a5,a0
     4ea:	fcf42e23          	sw	a5,-36(s0)
    threading_system_time += consume_ticks;
     4ee:	00002797          	auipc	a5,0x2
     4f2:	9ca78793          	addi	a5,a5,-1590 # 1eb8 <threading_system_time>
     4f6:	439c                	lw	a5,0(a5)
     4f8:	fdc42703          	lw	a4,-36(s0)
     4fc:	9fb9                	addw	a5,a5,a4
     4fe:	0007871b          	sext.w	a4,a5
     502:	00002797          	auipc	a5,0x2
     506:	9b678793          	addi	a5,a5,-1610 # 1eb8 <threading_system_time>
     50a:	c398                	sw	a4,0(a5)

    __release();
     50c:	00000097          	auipc	ra,0x0
     510:	e16080e7          	jalr	-490(ra) # 322 <__release>
    __thread_exit(to_remove);
     514:	fe043503          	ld	a0,-32(s0)
     518:	00000097          	auipc	ra,0x0
     51c:	ef2080e7          	jalr	-270(ra) # 40a <__thread_exit>
}
     520:	0001                	nop
     522:	70a2                	ld	ra,40(sp)
     524:	7402                	ld	s0,32(sp)
     526:	6145                	addi	sp,sp,48
     528:	8082                	ret

000000000000052a <__finish_current>:

void __finish_current()
{
     52a:	7179                	addi	sp,sp,-48
     52c:	f406                	sd	ra,40(sp)
     52e:	f022                	sd	s0,32(sp)
     530:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
     532:	00002797          	auipc	a5,0x2
     536:	97e78793          	addi	a5,a5,-1666 # 1eb0 <current>
     53a:	639c                	ld	a5,0(a5)
     53c:	fef43423          	sd	a5,-24(s0)
     540:	fe843783          	ld	a5,-24(s0)
     544:	fd878793          	addi	a5,a5,-40
     548:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
     54c:	fe043783          	ld	a5,-32(s0)
     550:	4bbc                	lw	a5,80(a5)
     552:	37fd                	addiw	a5,a5,-1
     554:	0007871b          	sext.w	a4,a5
     558:	fe043783          	ld	a5,-32(s0)
     55c:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish at %d\n",
     55e:	fe043783          	ld	a5,-32(s0)
     562:	5fd8                	lw	a4,60(a5)
     564:	00002797          	auipc	a5,0x2
     568:	95478793          	addi	a5,a5,-1708 # 1eb8 <threading_system_time>
     56c:	4390                	lw	a2,0(a5)
     56e:	fe043783          	ld	a5,-32(s0)
     572:	4bbc                	lw	a5,80(a5)
     574:	86be                	mv	a3,a5
     576:	85ba                	mv	a1,a4
     578:	00001517          	auipc	a0,0x1
     57c:	7b050513          	addi	a0,a0,1968 # 1d28 <schedule_dm+0x280>
     580:	00001097          	auipc	ra,0x1
     584:	094080e7          	jalr	148(ra) # 1614 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
     588:	fe043783          	ld	a5,-32(s0)
     58c:	4bbc                	lw	a5,80(a5)
     58e:	04f05563          	blez	a5,5d8 <__finish_current+0xae>
        struct list_head *to_remove = current;
     592:	00002797          	auipc	a5,0x2
     596:	91e78793          	addi	a5,a5,-1762 # 1eb0 <current>
     59a:	639c                	ld	a5,0(a5)
     59c:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
     5a0:	00002797          	auipc	a5,0x2
     5a4:	91078793          	addi	a5,a5,-1776 # 1eb0 <current>
     5a8:	639c                	ld	a5,0(a5)
     5aa:	6798                	ld	a4,8(a5)
     5ac:	00002797          	auipc	a5,0x2
     5b0:	90478793          	addi	a5,a5,-1788 # 1eb0 <current>
     5b4:	e398                	sd	a4,0(a5)
        list_del(to_remove);
     5b6:	fd843503          	ld	a0,-40(s0)
     5ba:	00000097          	auipc	ra,0x0
     5be:	ae4080e7          	jalr	-1308(ra) # 9e <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
     5c2:	fe043783          	ld	a5,-32(s0)
     5c6:	4fbc                	lw	a5,88(a5)
     5c8:	85be                	mv	a1,a5
     5ca:	fe043503          	ld	a0,-32(s0)
     5ce:	00000097          	auipc	ra,0x0
     5d2:	cd4080e7          	jalr	-812(ra) # 2a2 <thread_add_at>
    } else {
        __thread_exit(current_thread);
    }
}
     5d6:	a039                	j	5e4 <__finish_current+0xba>
        __thread_exit(current_thread);
     5d8:	fe043503          	ld	a0,-32(s0)
     5dc:	00000097          	auipc	ra,0x0
     5e0:	e2e080e7          	jalr	-466(ra) # 40a <__thread_exit>
}
     5e4:	0001                	nop
     5e6:	70a2                	ld	ra,40(sp)
     5e8:	7402                	ld	s0,32(sp)
     5ea:	6145                	addi	sp,sp,48
     5ec:	8082                	ret

00000000000005ee <__rt_finish_current>:
void __rt_finish_current()
{
     5ee:	7179                	addi	sp,sp,-48
     5f0:	f406                	sd	ra,40(sp)
     5f2:	f022                	sd	s0,32(sp)
     5f4:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
     5f6:	00002797          	auipc	a5,0x2
     5fa:	8ba78793          	addi	a5,a5,-1862 # 1eb0 <current>
     5fe:	639c                	ld	a5,0(a5)
     600:	fef43423          	sd	a5,-24(s0)
     604:	fe843783          	ld	a5,-24(s0)
     608:	fd878793          	addi	a5,a5,-40
     60c:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
     610:	fe043783          	ld	a5,-32(s0)
     614:	4bbc                	lw	a5,80(a5)
     616:	37fd                	addiw	a5,a5,-1
     618:	0007871b          	sext.w	a4,a5
     61c:	fe043783          	ld	a5,-32(s0)
     620:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish one cycle at %d: %d cycles left\n",
     622:	fe043783          	ld	a5,-32(s0)
     626:	5fd8                	lw	a4,60(a5)
     628:	00002797          	auipc	a5,0x2
     62c:	89078793          	addi	a5,a5,-1904 # 1eb8 <threading_system_time>
     630:	4390                	lw	a2,0(a5)
     632:	fe043783          	ld	a5,-32(s0)
     636:	4bbc                	lw	a5,80(a5)
     638:	86be                	mv	a3,a5
     63a:	85ba                	mv	a1,a4
     63c:	00001517          	auipc	a0,0x1
     640:	70450513          	addi	a0,a0,1796 # 1d40 <schedule_dm+0x298>
     644:	00001097          	auipc	ra,0x1
     648:	fd0080e7          	jalr	-48(ra) # 1614 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
     64c:	fe043783          	ld	a5,-32(s0)
     650:	4bbc                	lw	a5,80(a5)
     652:	04f05f63          	blez	a5,6b0 <__rt_finish_current+0xc2>
        struct list_head *to_remove = current;
     656:	00002797          	auipc	a5,0x2
     65a:	85a78793          	addi	a5,a5,-1958 # 1eb0 <current>
     65e:	639c                	ld	a5,0(a5)
     660:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
     664:	00002797          	auipc	a5,0x2
     668:	84c78793          	addi	a5,a5,-1972 # 1eb0 <current>
     66c:	639c                	ld	a5,0(a5)
     66e:	6798                	ld	a4,8(a5)
     670:	00002797          	auipc	a5,0x2
     674:	84078793          	addi	a5,a5,-1984 # 1eb0 <current>
     678:	e398                	sd	a4,0(a5)
        list_del(to_remove);
     67a:	fd843503          	ld	a0,-40(s0)
     67e:	00000097          	auipc	ra,0x0
     682:	a20080e7          	jalr	-1504(ra) # 9e <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
     686:	fe043783          	ld	a5,-32(s0)
     68a:	4fbc                	lw	a5,88(a5)
     68c:	85be                	mv	a1,a5
     68e:	fe043503          	ld	a0,-32(s0)
     692:	00000097          	auipc	ra,0x0
     696:	c10080e7          	jalr	-1008(ra) # 2a2 <thread_add_at>
        if (!current_thread->cbs.is_hard_rt) {
     69a:	fe043783          	ld	a5,-32(s0)
     69e:	57fc                	lw	a5,108(a5)
     6a0:	ef91                	bnez	a5,6bc <__rt_finish_current+0xce>
            current_thread->cbs.remaining_budget = current_thread->cbs.budget;
     6a2:	fe043783          	ld	a5,-32(s0)
     6a6:	53f8                	lw	a4,100(a5)
     6a8:	fe043783          	ld	a5,-32(s0)
     6ac:	d7b8                	sw	a4,104(a5)
        }
    } else {
        __thread_exit(current_thread);
    }
}
     6ae:	a039                	j	6bc <__rt_finish_current+0xce>
        __thread_exit(current_thread);
     6b0:	fe043503          	ld	a0,-32(s0)
     6b4:	00000097          	auipc	ra,0x0
     6b8:	d56080e7          	jalr	-682(ra) # 40a <__thread_exit>
}
     6bc:	0001                	nop
     6be:	70a2                	ld	ra,40(sp)
     6c0:	7402                	ld	s0,32(sp)
     6c2:	6145                	addi	sp,sp,48
     6c4:	8082                	ret

00000000000006c6 <switch_handler>:

void switch_handler(void *arg)
{
     6c6:	7139                	addi	sp,sp,-64
     6c8:	fc06                	sd	ra,56(sp)
     6ca:	f822                	sd	s0,48(sp)
     6cc:	0080                	addi	s0,sp,64
     6ce:	fca43423          	sd	a0,-56(s0)
    uint64 elapsed_time = (uint64)arg;
     6d2:	fc843783          	ld	a5,-56(s0)
     6d6:	fef43423          	sd	a5,-24(s0)
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
     6da:	00001797          	auipc	a5,0x1
     6de:	7d678793          	addi	a5,a5,2006 # 1eb0 <current>
     6e2:	639c                	ld	a5,0(a5)
     6e4:	fef43023          	sd	a5,-32(s0)
     6e8:	fe043783          	ld	a5,-32(s0)
     6ec:	fd878793          	addi	a5,a5,-40
     6f0:	fcf43c23          	sd	a5,-40(s0)

    threading_system_time += elapsed_time;
     6f4:	fe843783          	ld	a5,-24(s0)
     6f8:	0007871b          	sext.w	a4,a5
     6fc:	00001797          	auipc	a5,0x1
     700:	7bc78793          	addi	a5,a5,1980 # 1eb8 <threading_system_time>
     704:	439c                	lw	a5,0(a5)
     706:	2781                	sext.w	a5,a5
     708:	9fb9                	addw	a5,a5,a4
     70a:	2781                	sext.w	a5,a5
     70c:	0007871b          	sext.w	a4,a5
     710:	00001797          	auipc	a5,0x1
     714:	7a878793          	addi	a5,a5,1960 # 1eb8 <threading_system_time>
     718:	c398                	sw	a4,0(a5)
     __release();
     71a:	00000097          	auipc	ra,0x0
     71e:	c08080e7          	jalr	-1016(ra) # 322 <__release>
    current_thread->remaining_time -= elapsed_time;
     722:	fd843783          	ld	a5,-40(s0)
     726:	4bfc                	lw	a5,84(a5)
     728:	0007871b          	sext.w	a4,a5
     72c:	fe843783          	ld	a5,-24(s0)
     730:	2781                	sext.w	a5,a5
     732:	40f707bb          	subw	a5,a4,a5
     736:	2781                	sext.w	a5,a5
     738:	0007871b          	sext.w	a4,a5
     73c:	fd843783          	ld	a5,-40(s0)
     740:	cbf8                	sw	a4,84(a5)
    if (!current_thread->cbs.is_hard_rt) {
     742:	fd843783          	ld	a5,-40(s0)
     746:	57fc                	lw	a5,108(a5)
     748:	e38d                	bnez	a5,76a <switch_handler+0xa4>
        current_thread->cbs.remaining_budget -= elapsed_time;
     74a:	fd843783          	ld	a5,-40(s0)
     74e:	57bc                	lw	a5,104(a5)
     750:	0007871b          	sext.w	a4,a5
     754:	fe843783          	ld	a5,-24(s0)
     758:	2781                	sext.w	a5,a5
     75a:	40f707bb          	subw	a5,a4,a5
     75e:	2781                	sext.w	a5,a5
     760:	0007871b          	sext.w	a4,a5
     764:	fd843783          	ld	a5,-40(s0)
     768:	d7b8                	sw	a4,104(a5)
    }
    if (current_thread->is_real_time)
     76a:	fd843783          	ld	a5,-40(s0)
     76e:	43bc                	lw	a5,64(a5)
     770:	c3ad                	beqz	a5,7d2 <switch_handler+0x10c>
        if (threading_system_time > current_thread->current_deadline || 
     772:	fd843783          	ld	a5,-40(s0)
     776:	4fb8                	lw	a4,88(a5)
     778:	00001797          	auipc	a5,0x1
     77c:	74078793          	addi	a5,a5,1856 # 1eb8 <threading_system_time>
     780:	439c                	lw	a5,0(a5)
     782:	02f74163          	blt	a4,a5,7a4 <switch_handler+0xde>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
     786:	fd843783          	ld	a5,-40(s0)
     78a:	4fb8                	lw	a4,88(a5)
     78c:	00001797          	auipc	a5,0x1
     790:	72c78793          	addi	a5,a5,1836 # 1eb8 <threading_system_time>
     794:	439c                	lw	a5,0(a5)
        if (threading_system_time > current_thread->current_deadline || 
     796:	02f71e63          	bne	a4,a5,7d2 <switch_handler+0x10c>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
     79a:	fd843783          	ld	a5,-40(s0)
     79e:	4bfc                	lw	a5,84(a5)
     7a0:	02f05963          	blez	a5,7d2 <switch_handler+0x10c>
            printf("thread#%d misses a deadline at %d in swicth\n", current_thread->ID, threading_system_time);
     7a4:	fd843783          	ld	a5,-40(s0)
     7a8:	5fd8                	lw	a4,60(a5)
     7aa:	00001797          	auipc	a5,0x1
     7ae:	70e78793          	addi	a5,a5,1806 # 1eb8 <threading_system_time>
     7b2:	439c                	lw	a5,0(a5)
     7b4:	863e                	mv	a2,a5
     7b6:	85ba                	mv	a1,a4
     7b8:	00001517          	auipc	a0,0x1
     7bc:	5c050513          	addi	a0,a0,1472 # 1d78 <schedule_dm+0x2d0>
     7c0:	00001097          	auipc	ra,0x1
     7c4:	e54080e7          	jalr	-428(ra) # 1614 <printf>
            exit(0);
     7c8:	4501                	li	a0,0
     7ca:	00001097          	auipc	ra,0x1
     7ce:	904080e7          	jalr	-1788(ra) # 10ce <exit>
        }

    if (current_thread->remaining_time <= 0) {
     7d2:	fd843783          	ld	a5,-40(s0)
     7d6:	4bfc                	lw	a5,84(a5)
     7d8:	02f04063          	bgtz	a5,7f8 <switch_handler+0x132>
        if (current_thread->is_real_time)
     7dc:	fd843783          	ld	a5,-40(s0)
     7e0:	43bc                	lw	a5,64(a5)
     7e2:	c791                	beqz	a5,7ee <switch_handler+0x128>
            __rt_finish_current();
     7e4:	00000097          	auipc	ra,0x0
     7e8:	e0a080e7          	jalr	-502(ra) # 5ee <__rt_finish_current>
     7ec:	a881                	j	83c <switch_handler+0x176>
        else
            __finish_current();
     7ee:	00000097          	auipc	ra,0x0
     7f2:	d3c080e7          	jalr	-708(ra) # 52a <__finish_current>
     7f6:	a099                	j	83c <switch_handler+0x176>
    } else {
        // move the current thread to the end of the run_queue
        struct list_head *to_remove = current;
     7f8:	00001797          	auipc	a5,0x1
     7fc:	6b878793          	addi	a5,a5,1720 # 1eb0 <current>
     800:	639c                	ld	a5,0(a5)
     802:	fcf43823          	sd	a5,-48(s0)
        current = current->prev;
     806:	00001797          	auipc	a5,0x1
     80a:	6aa78793          	addi	a5,a5,1706 # 1eb0 <current>
     80e:	639c                	ld	a5,0(a5)
     810:	6798                	ld	a4,8(a5)
     812:	00001797          	auipc	a5,0x1
     816:	69e78793          	addi	a5,a5,1694 # 1eb0 <current>
     81a:	e398                	sd	a4,0(a5)
        list_del(to_remove);
     81c:	fd043503          	ld	a0,-48(s0)
     820:	00000097          	auipc	ra,0x0
     824:	87e080e7          	jalr	-1922(ra) # 9e <list_del>
        list_add_tail(to_remove, &run_queue);
     828:	00001597          	auipc	a1,0x1
     82c:	64858593          	addi	a1,a1,1608 # 1e70 <run_queue>
     830:	fd043503          	ld	a0,-48(s0)
     834:	00000097          	auipc	ra,0x0
     838:	80e080e7          	jalr	-2034(ra) # 42 <list_add_tail>
    }

    __release();
     83c:	00000097          	auipc	ra,0x0
     840:	ae6080e7          	jalr	-1306(ra) # 322 <__release>
    __schedule();
     844:	00000097          	auipc	ra,0x0
     848:	1be080e7          	jalr	446(ra) # a02 <__schedule>
    __dispatch();
     84c:	00000097          	auipc	ra,0x0
     850:	026080e7          	jalr	38(ra) # 872 <__dispatch>
    thrdresume(main_thrd_id);
     854:	00001797          	auipc	a5,0x1
     858:	65078793          	addi	a5,a5,1616 # 1ea4 <main_thrd_id>
     85c:	439c                	lw	a5,0(a5)
     85e:	853e                	mv	a0,a5
     860:	00001097          	auipc	ra,0x1
     864:	916080e7          	jalr	-1770(ra) # 1176 <thrdresume>
}
     868:	0001                	nop
     86a:	70e2                	ld	ra,56(sp)
     86c:	7442                	ld	s0,48(sp)
     86e:	6121                	addi	sp,sp,64
     870:	8082                	ret

0000000000000872 <__dispatch>:

void __dispatch()
{
     872:	7179                	addi	sp,sp,-48
     874:	f406                	sd	ra,40(sp)
     876:	f022                	sd	s0,32(sp)
     878:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
     87a:	00001797          	auipc	a5,0x1
     87e:	63678793          	addi	a5,a5,1590 # 1eb0 <current>
     882:	6398                	ld	a4,0(a5)
     884:	00001797          	auipc	a5,0x1
     888:	5ec78793          	addi	a5,a5,1516 # 1e70 <run_queue>
     88c:	16f70663          	beq	a4,a5,9f8 <__dispatch+0x186>
    if (allocated_time < 0) {
        fprintf(2, "[FATAL] allocated_time is negative\n");
        exit(1);
    }

    struct thread *current_thread = list_entry(current, struct thread, thread_list);
     890:	00001797          	auipc	a5,0x1
     894:	62078793          	addi	a5,a5,1568 # 1eb0 <current>
     898:	639c                	ld	a5,0(a5)
     89a:	fef43423          	sd	a5,-24(s0)
     89e:	fe843783          	ld	a5,-24(s0)
     8a2:	fd878793          	addi	a5,a5,-40
     8a6:	fef43023          	sd	a5,-32(s0)
    if (current_thread->is_real_time && allocated_time == 0) {
     8aa:	fe043783          	ld	a5,-32(s0)
     8ae:	43bc                	lw	a5,64(a5)
     8b0:	cf85                	beqz	a5,8e8 <__dispatch+0x76>
     8b2:	00001797          	auipc	a5,0x1
     8b6:	60e78793          	addi	a5,a5,1550 # 1ec0 <allocated_time>
     8ba:	639c                	ld	a5,0(a5)
     8bc:	e795                	bnez	a5,8e8 <__dispatch+0x76>
        printf("thread#%d misses a deadline at %d in dispatch\n", current_thread->ID, current_thread->current_deadline);
     8be:	fe043783          	ld	a5,-32(s0)
     8c2:	5fd8                	lw	a4,60(a5)
     8c4:	fe043783          	ld	a5,-32(s0)
     8c8:	4fbc                	lw	a5,88(a5)
     8ca:	863e                	mv	a2,a5
     8cc:	85ba                	mv	a1,a4
     8ce:	00001517          	auipc	a0,0x1
     8d2:	4da50513          	addi	a0,a0,1242 # 1da8 <schedule_dm+0x300>
     8d6:	00001097          	auipc	ra,0x1
     8da:	d3e080e7          	jalr	-706(ra) # 1614 <printf>
        exit(0);
     8de:	4501                	li	a0,0
     8e0:	00000097          	auipc	ra,0x0
     8e4:	7ee080e7          	jalr	2030(ra) # 10ce <exit>
    }

    printf("dispatch thread#%d at %d: allocated_time=%d\n", current_thread->ID, threading_system_time, allocated_time);
     8e8:	fe043783          	ld	a5,-32(s0)
     8ec:	5fd8                	lw	a4,60(a5)
     8ee:	00001797          	auipc	a5,0x1
     8f2:	5ca78793          	addi	a5,a5,1482 # 1eb8 <threading_system_time>
     8f6:	4390                	lw	a2,0(a5)
     8f8:	00001797          	auipc	a5,0x1
     8fc:	5c878793          	addi	a5,a5,1480 # 1ec0 <allocated_time>
     900:	639c                	ld	a5,0(a5)
     902:	86be                	mv	a3,a5
     904:	85ba                	mv	a1,a4
     906:	00001517          	auipc	a0,0x1
     90a:	4d250513          	addi	a0,a0,1234 # 1dd8 <schedule_dm+0x330>
     90e:	00001097          	auipc	ra,0x1
     912:	d06080e7          	jalr	-762(ra) # 1614 <printf>

    if (current_thread->buf_set) {
     916:	fe043783          	ld	a5,-32(s0)
     91a:	539c                	lw	a5,32(a5)
     91c:	c7a1                	beqz	a5,964 <__dispatch+0xf2>
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
     91e:	00001797          	auipc	a5,0x1
     922:	5a278793          	addi	a5,a5,1442 # 1ec0 <allocated_time>
     926:	639c                	ld	a5,0(a5)
     928:	0007871b          	sext.w	a4,a5
     92c:	fe043783          	ld	a5,-32(s0)
     930:	03878593          	addi	a1,a5,56
     934:	00001797          	auipc	a5,0x1
     938:	58c78793          	addi	a5,a5,1420 # 1ec0 <allocated_time>
     93c:	639c                	ld	a5,0(a5)
     93e:	86be                	mv	a3,a5
     940:	00000617          	auipc	a2,0x0
     944:	d8660613          	addi	a2,a2,-634 # 6c6 <switch_handler>
     948:	853a                	mv	a0,a4
     94a:	00001097          	auipc	ra,0x1
     94e:	824080e7          	jalr	-2012(ra) # 116e <thrdstop>
        thrdresume(current_thread->thrdstop_context_id);
     952:	fe043783          	ld	a5,-32(s0)
     956:	5f9c                	lw	a5,56(a5)
     958:	853e                	mv	a0,a5
     95a:	00001097          	auipc	ra,0x1
     95e:	81c080e7          	jalr	-2020(ra) # 1176 <thrdresume>
     962:	a071                	j	9ee <__dispatch+0x17c>
    } else {
        current_thread->buf_set = 1;
     964:	fe043783          	ld	a5,-32(s0)
     968:	4705                	li	a4,1
     96a:	d398                	sw	a4,32(a5)
        unsigned long new_stack_p = (unsigned long)current_thread->stack_p;
     96c:	fe043783          	ld	a5,-32(s0)
     970:	6f9c                	ld	a5,24(a5)
     972:	fcf43c23          	sd	a5,-40(s0)
        current_thread->thrdstop_context_id = -1;
     976:	fe043783          	ld	a5,-32(s0)
     97a:	577d                	li	a4,-1
     97c:	df98                	sw	a4,56(a5)
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
     97e:	00001797          	auipc	a5,0x1
     982:	54278793          	addi	a5,a5,1346 # 1ec0 <allocated_time>
     986:	639c                	ld	a5,0(a5)
     988:	0007871b          	sext.w	a4,a5
     98c:	fe043783          	ld	a5,-32(s0)
     990:	03878593          	addi	a1,a5,56
     994:	00001797          	auipc	a5,0x1
     998:	52c78793          	addi	a5,a5,1324 # 1ec0 <allocated_time>
     99c:	639c                	ld	a5,0(a5)
     99e:	86be                	mv	a3,a5
     9a0:	00000617          	auipc	a2,0x0
     9a4:	d2660613          	addi	a2,a2,-730 # 6c6 <switch_handler>
     9a8:	853a                	mv	a0,a4
     9aa:	00000097          	auipc	ra,0x0
     9ae:	7c4080e7          	jalr	1988(ra) # 116e <thrdstop>
        if (current_thread->thrdstop_context_id < 0) {
     9b2:	fe043783          	ld	a5,-32(s0)
     9b6:	5f9c                	lw	a5,56(a5)
     9b8:	0207d063          	bgez	a5,9d8 <__dispatch+0x166>
            fprintf(2, "[ERROR] number of threads may exceed MAX_THRD_NUM\n");
     9bc:	00001597          	auipc	a1,0x1
     9c0:	44c58593          	addi	a1,a1,1100 # 1e08 <schedule_dm+0x360>
     9c4:	4509                	li	a0,2
     9c6:	00001097          	auipc	ra,0x1
     9ca:	bf6080e7          	jalr	-1034(ra) # 15bc <fprintf>
            exit(1);
     9ce:	4505                	li	a0,1
     9d0:	00000097          	auipc	ra,0x0
     9d4:	6fe080e7          	jalr	1790(ra) # 10ce <exit>
        }

        // set sp to stack pointer of current thread.
        asm volatile("mv sp, %0"
     9d8:	fd843783          	ld	a5,-40(s0)
     9dc:	813e                	mv	sp,a5
                     :
                     : "r"(new_stack_p));
        current_thread->fp(current_thread->arg);
     9de:	fe043783          	ld	a5,-32(s0)
     9e2:	6398                	ld	a4,0(a5)
     9e4:	fe043783          	ld	a5,-32(s0)
     9e8:	679c                	ld	a5,8(a5)
     9ea:	853e                	mv	a0,a5
     9ec:	9702                	jalr	a4
    }
    thread_exit();
     9ee:	00000097          	auipc	ra,0x0
     9f2:	a94080e7          	jalr	-1388(ra) # 482 <thread_exit>
     9f6:	a011                	j	9fa <__dispatch+0x188>
        return;
     9f8:	0001                	nop
}
     9fa:	70a2                	ld	ra,40(sp)
     9fc:	7402                	ld	s0,32(sp)
     9fe:	6145                	addi	sp,sp,48
     a00:	8082                	ret

0000000000000a02 <__schedule>:

void __schedule()
{
     a02:	711d                	addi	sp,sp,-96
     a04:	ec86                	sd	ra,88(sp)
     a06:	e8a2                	sd	s0,80(sp)
     a08:	1080                	addi	s0,sp,96
    struct threads_sched_args args = {
     a0a:	00001797          	auipc	a5,0x1
     a0e:	4ae78793          	addi	a5,a5,1198 # 1eb8 <threading_system_time>
     a12:	439c                	lw	a5,0(a5)
     a14:	fcf42c23          	sw	a5,-40(s0)
     a18:	4789                	li	a5,2
     a1a:	fcf42e23          	sw	a5,-36(s0)
     a1e:	00001797          	auipc	a5,0x1
     a22:	45278793          	addi	a5,a5,1106 # 1e70 <run_queue>
     a26:	fef43023          	sd	a5,-32(s0)
     a2a:	00001797          	auipc	a5,0x1
     a2e:	45678793          	addi	a5,a5,1110 # 1e80 <release_queue>
     a32:	fef43423          	sd	a5,-24(s0)
#ifdef THREAD_SCHEDULER_EDF_CBS
    r = schedule_edf_cbs(args);
#endif

#ifdef THREAD_SCHEDULER_DM
    r = schedule_dm(args);
     a36:	fd843783          	ld	a5,-40(s0)
     a3a:	faf43023          	sd	a5,-96(s0)
     a3e:	fe043783          	ld	a5,-32(s0)
     a42:	faf43423          	sd	a5,-88(s0)
     a46:	fe843783          	ld	a5,-24(s0)
     a4a:	faf43823          	sd	a5,-80(s0)
     a4e:	fa040793          	addi	a5,s0,-96
     a52:	853e                	mv	a0,a5
     a54:	00001097          	auipc	ra,0x1
     a58:	054080e7          	jalr	84(ra) # 1aa8 <schedule_dm>
     a5c:	872a                	mv	a4,a0
     a5e:	87ae                	mv	a5,a1
     a60:	fce43423          	sd	a4,-56(s0)
     a64:	fcf43823          	sd	a5,-48(s0)
//     r = schedule_edf_cbs(args);
// #else
//     r = schedule_default(args);
// #endif

    current = r.scheduled_thread_list_member;
     a68:	fc843703          	ld	a4,-56(s0)
     a6c:	00001797          	auipc	a5,0x1
     a70:	44478793          	addi	a5,a5,1092 # 1eb0 <current>
     a74:	e398                	sd	a4,0(a5)
    allocated_time = r.allocated_time;
     a76:	fd042783          	lw	a5,-48(s0)
     a7a:	873e                	mv	a4,a5
     a7c:	00001797          	auipc	a5,0x1
     a80:	44478793          	addi	a5,a5,1092 # 1ec0 <allocated_time>
     a84:	e398                	sd	a4,0(a5)
}
     a86:	0001                	nop
     a88:	60e6                	ld	ra,88(sp)
     a8a:	6446                	ld	s0,80(sp)
     a8c:	6125                	addi	sp,sp,96
     a8e:	8082                	ret

0000000000000a90 <back_to_main_handler>:

void back_to_main_handler(void *arg)
{
     a90:	1101                	addi	sp,sp,-32
     a92:	ec06                	sd	ra,24(sp)
     a94:	e822                	sd	s0,16(sp)
     a96:	1000                	addi	s0,sp,32
     a98:	fea43423          	sd	a0,-24(s0)
    sleeping = 0;
     a9c:	00001797          	auipc	a5,0x1
     aa0:	42078793          	addi	a5,a5,1056 # 1ebc <sleeping>
     aa4:	0007a023          	sw	zero,0(a5)
    threading_system_time += (uint64)arg;
     aa8:	fe843783          	ld	a5,-24(s0)
     aac:	0007871b          	sext.w	a4,a5
     ab0:	00001797          	auipc	a5,0x1
     ab4:	40878793          	addi	a5,a5,1032 # 1eb8 <threading_system_time>
     ab8:	439c                	lw	a5,0(a5)
     aba:	2781                	sext.w	a5,a5
     abc:	9fb9                	addw	a5,a5,a4
     abe:	2781                	sext.w	a5,a5
     ac0:	0007871b          	sext.w	a4,a5
     ac4:	00001797          	auipc	a5,0x1
     ac8:	3f478793          	addi	a5,a5,1012 # 1eb8 <threading_system_time>
     acc:	c398                	sw	a4,0(a5)
    thrdresume(main_thrd_id);
     ace:	00001797          	auipc	a5,0x1
     ad2:	3d678793          	addi	a5,a5,982 # 1ea4 <main_thrd_id>
     ad6:	439c                	lw	a5,0(a5)
     ad8:	853e                	mv	a0,a5
     ada:	00000097          	auipc	ra,0x0
     ade:	69c080e7          	jalr	1692(ra) # 1176 <thrdresume>
}
     ae2:	0001                	nop
     ae4:	60e2                	ld	ra,24(sp)
     ae6:	6442                	ld	s0,16(sp)
     ae8:	6105                	addi	sp,sp,32
     aea:	8082                	ret

0000000000000aec <thread_start_threading>:

void thread_start_threading()
{
     aec:	1141                	addi	sp,sp,-16
     aee:	e406                	sd	ra,8(sp)
     af0:	e022                	sd	s0,0(sp)
     af2:	0800                	addi	s0,sp,16
    threading_system_time = 0;
     af4:	00001797          	auipc	a5,0x1
     af8:	3c478793          	addi	a5,a5,964 # 1eb8 <threading_system_time>
     afc:	0007a023          	sw	zero,0(a5)
    current = &run_queue;
     b00:	00001797          	auipc	a5,0x1
     b04:	3b078793          	addi	a5,a5,944 # 1eb0 <current>
     b08:	00001717          	auipc	a4,0x1
     b0c:	36870713          	addi	a4,a4,872 # 1e70 <run_queue>
     b10:	e398                	sd	a4,0(a5)

    // call thrdstop just for obtain an ID
    thrdstop(1000, &main_thrd_id, back_to_main_handler, (void *)0);
     b12:	4681                	li	a3,0
     b14:	00000617          	auipc	a2,0x0
     b18:	f7c60613          	addi	a2,a2,-132 # a90 <back_to_main_handler>
     b1c:	00001597          	auipc	a1,0x1
     b20:	38858593          	addi	a1,a1,904 # 1ea4 <main_thrd_id>
     b24:	3e800513          	li	a0,1000
     b28:	00000097          	auipc	ra,0x0
     b2c:	646080e7          	jalr	1606(ra) # 116e <thrdstop>
    cancelthrdstop(main_thrd_id, 0);
     b30:	00001797          	auipc	a5,0x1
     b34:	37478793          	addi	a5,a5,884 # 1ea4 <main_thrd_id>
     b38:	439c                	lw	a5,0(a5)
     b3a:	4581                	li	a1,0
     b3c:	853e                	mv	a0,a5
     b3e:	00000097          	auipc	ra,0x0
     b42:	640080e7          	jalr	1600(ra) # 117e <cancelthrdstop>

    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
     b46:	a0c9                	j	c08 <thread_start_threading+0x11c>
        __release();
     b48:	fffff097          	auipc	ra,0xfffff
     b4c:	7da080e7          	jalr	2010(ra) # 322 <__release>
        __schedule();
     b50:	00000097          	auipc	ra,0x0
     b54:	eb2080e7          	jalr	-334(ra) # a02 <__schedule>
        cancelthrdstop(main_thrd_id, 0);
     b58:	00001797          	auipc	a5,0x1
     b5c:	34c78793          	addi	a5,a5,844 # 1ea4 <main_thrd_id>
     b60:	439c                	lw	a5,0(a5)
     b62:	4581                	li	a1,0
     b64:	853e                	mv	a0,a5
     b66:	00000097          	auipc	ra,0x0
     b6a:	618080e7          	jalr	1560(ra) # 117e <cancelthrdstop>
        __dispatch();
     b6e:	00000097          	auipc	ra,0x0
     b72:	d04080e7          	jalr	-764(ra) # 872 <__dispatch>

        if (list_empty(&run_queue) && list_empty(&release_queue)) {
     b76:	00001517          	auipc	a0,0x1
     b7a:	2fa50513          	addi	a0,a0,762 # 1e70 <run_queue>
     b7e:	fffff097          	auipc	ra,0xfffff
     b82:	56a080e7          	jalr	1386(ra) # e8 <list_empty>
     b86:	87aa                	mv	a5,a0
     b88:	cb99                	beqz	a5,b9e <thread_start_threading+0xb2>
     b8a:	00001517          	auipc	a0,0x1
     b8e:	2f650513          	addi	a0,a0,758 # 1e80 <release_queue>
     b92:	fffff097          	auipc	ra,0xfffff
     b96:	556080e7          	jalr	1366(ra) # e8 <list_empty>
     b9a:	87aa                	mv	a5,a0
     b9c:	ebd9                	bnez	a5,c32 <thread_start_threading+0x146>
            break;
        }

        // no thread in run_queue, release_queue not empty
        printf("run_queue is empty, sleep for %d ticks\n", allocated_time);
     b9e:	00001797          	auipc	a5,0x1
     ba2:	32278793          	addi	a5,a5,802 # 1ec0 <allocated_time>
     ba6:	639c                	ld	a5,0(a5)
     ba8:	85be                	mv	a1,a5
     baa:	00001517          	auipc	a0,0x1
     bae:	29650513          	addi	a0,a0,662 # 1e40 <schedule_dm+0x398>
     bb2:	00001097          	auipc	ra,0x1
     bb6:	a62080e7          	jalr	-1438(ra) # 1614 <printf>
        sleeping = 1;
     bba:	00001797          	auipc	a5,0x1
     bbe:	30278793          	addi	a5,a5,770 # 1ebc <sleeping>
     bc2:	4705                	li	a4,1
     bc4:	c398                	sw	a4,0(a5)
        thrdstop(allocated_time, &main_thrd_id, back_to_main_handler, (void *)allocated_time);
     bc6:	00001797          	auipc	a5,0x1
     bca:	2fa78793          	addi	a5,a5,762 # 1ec0 <allocated_time>
     bce:	639c                	ld	a5,0(a5)
     bd0:	0007871b          	sext.w	a4,a5
     bd4:	00001797          	auipc	a5,0x1
     bd8:	2ec78793          	addi	a5,a5,748 # 1ec0 <allocated_time>
     bdc:	639c                	ld	a5,0(a5)
     bde:	86be                	mv	a3,a5
     be0:	00000617          	auipc	a2,0x0
     be4:	eb060613          	addi	a2,a2,-336 # a90 <back_to_main_handler>
     be8:	00001597          	auipc	a1,0x1
     bec:	2bc58593          	addi	a1,a1,700 # 1ea4 <main_thrd_id>
     bf0:	853a                	mv	a0,a4
     bf2:	00000097          	auipc	ra,0x0
     bf6:	57c080e7          	jalr	1404(ra) # 116e <thrdstop>
        while (sleeping) {
     bfa:	0001                	nop
     bfc:	00001797          	auipc	a5,0x1
     c00:	2c078793          	addi	a5,a5,704 # 1ebc <sleeping>
     c04:	439c                	lw	a5,0(a5)
     c06:	fbfd                	bnez	a5,bfc <thread_start_threading+0x110>
    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
     c08:	00001517          	auipc	a0,0x1
     c0c:	26850513          	addi	a0,a0,616 # 1e70 <run_queue>
     c10:	fffff097          	auipc	ra,0xfffff
     c14:	4d8080e7          	jalr	1240(ra) # e8 <list_empty>
     c18:	87aa                	mv	a5,a0
     c1a:	d79d                	beqz	a5,b48 <thread_start_threading+0x5c>
     c1c:	00001517          	auipc	a0,0x1
     c20:	26450513          	addi	a0,a0,612 # 1e80 <release_queue>
     c24:	fffff097          	auipc	ra,0xfffff
     c28:	4c4080e7          	jalr	1220(ra) # e8 <list_empty>
     c2c:	87aa                	mv	a5,a0
     c2e:	df89                	beqz	a5,b48 <thread_start_threading+0x5c>
            // zzz...
        }
    }
}
     c30:	a011                	j	c34 <thread_start_threading+0x148>
            break;
     c32:	0001                	nop
}
     c34:	0001                	nop
     c36:	60a2                	ld	ra,8(sp)
     c38:	6402                	ld	s0,0(sp)
     c3a:	0141                	addi	sp,sp,16
     c3c:	8082                	ret

0000000000000c3e <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
     c3e:	7179                	addi	sp,sp,-48
     c40:	f422                	sd	s0,40(sp)
     c42:	1800                	addi	s0,sp,48
     c44:	fca43c23          	sd	a0,-40(s0)
     c48:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
     c4c:	fd843783          	ld	a5,-40(s0)
     c50:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
     c54:	0001                	nop
     c56:	fd043703          	ld	a4,-48(s0)
     c5a:	00170793          	addi	a5,a4,1
     c5e:	fcf43823          	sd	a5,-48(s0)
     c62:	fd843783          	ld	a5,-40(s0)
     c66:	00178693          	addi	a3,a5,1
     c6a:	fcd43c23          	sd	a3,-40(s0)
     c6e:	00074703          	lbu	a4,0(a4)
     c72:	00e78023          	sb	a4,0(a5)
     c76:	0007c783          	lbu	a5,0(a5)
     c7a:	fff1                	bnez	a5,c56 <strcpy+0x18>
    ;
  return os;
     c7c:	fe843783          	ld	a5,-24(s0)
}
     c80:	853e                	mv	a0,a5
     c82:	7422                	ld	s0,40(sp)
     c84:	6145                	addi	sp,sp,48
     c86:	8082                	ret

0000000000000c88 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     c88:	1101                	addi	sp,sp,-32
     c8a:	ec22                	sd	s0,24(sp)
     c8c:	1000                	addi	s0,sp,32
     c8e:	fea43423          	sd	a0,-24(s0)
     c92:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     c96:	a819                	j	cac <strcmp+0x24>
    p++, q++;
     c98:	fe843783          	ld	a5,-24(s0)
     c9c:	0785                	addi	a5,a5,1
     c9e:	fef43423          	sd	a5,-24(s0)
     ca2:	fe043783          	ld	a5,-32(s0)
     ca6:	0785                	addi	a5,a5,1
     ca8:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     cac:	fe843783          	ld	a5,-24(s0)
     cb0:	0007c783          	lbu	a5,0(a5)
     cb4:	cb99                	beqz	a5,cca <strcmp+0x42>
     cb6:	fe843783          	ld	a5,-24(s0)
     cba:	0007c703          	lbu	a4,0(a5)
     cbe:	fe043783          	ld	a5,-32(s0)
     cc2:	0007c783          	lbu	a5,0(a5)
     cc6:	fcf709e3          	beq	a4,a5,c98 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     cca:	fe843783          	ld	a5,-24(s0)
     cce:	0007c783          	lbu	a5,0(a5)
     cd2:	0007871b          	sext.w	a4,a5
     cd6:	fe043783          	ld	a5,-32(s0)
     cda:	0007c783          	lbu	a5,0(a5)
     cde:	2781                	sext.w	a5,a5
     ce0:	40f707bb          	subw	a5,a4,a5
     ce4:	2781                	sext.w	a5,a5
}
     ce6:	853e                	mv	a0,a5
     ce8:	6462                	ld	s0,24(sp)
     cea:	6105                	addi	sp,sp,32
     cec:	8082                	ret

0000000000000cee <strlen>:

uint
strlen(const char *s)
{
     cee:	7179                	addi	sp,sp,-48
     cf0:	f422                	sd	s0,40(sp)
     cf2:	1800                	addi	s0,sp,48
     cf4:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     cf8:	fe042623          	sw	zero,-20(s0)
     cfc:	a031                	j	d08 <strlen+0x1a>
     cfe:	fec42783          	lw	a5,-20(s0)
     d02:	2785                	addiw	a5,a5,1
     d04:	fef42623          	sw	a5,-20(s0)
     d08:	fec42783          	lw	a5,-20(s0)
     d0c:	fd843703          	ld	a4,-40(s0)
     d10:	97ba                	add	a5,a5,a4
     d12:	0007c783          	lbu	a5,0(a5)
     d16:	f7e5                	bnez	a5,cfe <strlen+0x10>
    ;
  return n;
     d18:	fec42783          	lw	a5,-20(s0)
}
     d1c:	853e                	mv	a0,a5
     d1e:	7422                	ld	s0,40(sp)
     d20:	6145                	addi	sp,sp,48
     d22:	8082                	ret

0000000000000d24 <memset>:

void*
memset(void *dst, int c, uint n)
{
     d24:	7179                	addi	sp,sp,-48
     d26:	f422                	sd	s0,40(sp)
     d28:	1800                	addi	s0,sp,48
     d2a:	fca43c23          	sd	a0,-40(s0)
     d2e:	87ae                	mv	a5,a1
     d30:	8732                	mv	a4,a2
     d32:	fcf42a23          	sw	a5,-44(s0)
     d36:	87ba                	mv	a5,a4
     d38:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     d3c:	fd843783          	ld	a5,-40(s0)
     d40:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     d44:	fe042623          	sw	zero,-20(s0)
     d48:	a00d                	j	d6a <memset+0x46>
    cdst[i] = c;
     d4a:	fec42783          	lw	a5,-20(s0)
     d4e:	fe043703          	ld	a4,-32(s0)
     d52:	97ba                	add	a5,a5,a4
     d54:	fd442703          	lw	a4,-44(s0)
     d58:	0ff77713          	andi	a4,a4,255
     d5c:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     d60:	fec42783          	lw	a5,-20(s0)
     d64:	2785                	addiw	a5,a5,1
     d66:	fef42623          	sw	a5,-20(s0)
     d6a:	fec42703          	lw	a4,-20(s0)
     d6e:	fd042783          	lw	a5,-48(s0)
     d72:	2781                	sext.w	a5,a5
     d74:	fcf76be3          	bltu	a4,a5,d4a <memset+0x26>
  }
  return dst;
     d78:	fd843783          	ld	a5,-40(s0)
}
     d7c:	853e                	mv	a0,a5
     d7e:	7422                	ld	s0,40(sp)
     d80:	6145                	addi	sp,sp,48
     d82:	8082                	ret

0000000000000d84 <strchr>:

char*
strchr(const char *s, char c)
{
     d84:	1101                	addi	sp,sp,-32
     d86:	ec22                	sd	s0,24(sp)
     d88:	1000                	addi	s0,sp,32
     d8a:	fea43423          	sd	a0,-24(s0)
     d8e:	87ae                	mv	a5,a1
     d90:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     d94:	a01d                	j	dba <strchr+0x36>
    if(*s == c)
     d96:	fe843783          	ld	a5,-24(s0)
     d9a:	0007c703          	lbu	a4,0(a5)
     d9e:	fe744783          	lbu	a5,-25(s0)
     da2:	0ff7f793          	andi	a5,a5,255
     da6:	00e79563          	bne	a5,a4,db0 <strchr+0x2c>
      return (char*)s;
     daa:	fe843783          	ld	a5,-24(s0)
     dae:	a821                	j	dc6 <strchr+0x42>
  for(; *s; s++)
     db0:	fe843783          	ld	a5,-24(s0)
     db4:	0785                	addi	a5,a5,1
     db6:	fef43423          	sd	a5,-24(s0)
     dba:	fe843783          	ld	a5,-24(s0)
     dbe:	0007c783          	lbu	a5,0(a5)
     dc2:	fbf1                	bnez	a5,d96 <strchr+0x12>
  return 0;
     dc4:	4781                	li	a5,0
}
     dc6:	853e                	mv	a0,a5
     dc8:	6462                	ld	s0,24(sp)
     dca:	6105                	addi	sp,sp,32
     dcc:	8082                	ret

0000000000000dce <gets>:

char*
gets(char *buf, int max)
{
     dce:	7179                	addi	sp,sp,-48
     dd0:	f406                	sd	ra,40(sp)
     dd2:	f022                	sd	s0,32(sp)
     dd4:	1800                	addi	s0,sp,48
     dd6:	fca43c23          	sd	a0,-40(s0)
     dda:	87ae                	mv	a5,a1
     ddc:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     de0:	fe042623          	sw	zero,-20(s0)
     de4:	a8a1                	j	e3c <gets+0x6e>
    cc = read(0, &c, 1);
     de6:	fe740793          	addi	a5,s0,-25
     dea:	4605                	li	a2,1
     dec:	85be                	mv	a1,a5
     dee:	4501                	li	a0,0
     df0:	00000097          	auipc	ra,0x0
     df4:	2f6080e7          	jalr	758(ra) # 10e6 <read>
     df8:	87aa                	mv	a5,a0
     dfa:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     dfe:	fe842783          	lw	a5,-24(s0)
     e02:	2781                	sext.w	a5,a5
     e04:	04f05763          	blez	a5,e52 <gets+0x84>
      break;
    buf[i++] = c;
     e08:	fec42783          	lw	a5,-20(s0)
     e0c:	0017871b          	addiw	a4,a5,1
     e10:	fee42623          	sw	a4,-20(s0)
     e14:	873e                	mv	a4,a5
     e16:	fd843783          	ld	a5,-40(s0)
     e1a:	97ba                	add	a5,a5,a4
     e1c:	fe744703          	lbu	a4,-25(s0)
     e20:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     e24:	fe744783          	lbu	a5,-25(s0)
     e28:	873e                	mv	a4,a5
     e2a:	47a9                	li	a5,10
     e2c:	02f70463          	beq	a4,a5,e54 <gets+0x86>
     e30:	fe744783          	lbu	a5,-25(s0)
     e34:	873e                	mv	a4,a5
     e36:	47b5                	li	a5,13
     e38:	00f70e63          	beq	a4,a5,e54 <gets+0x86>
  for(i=0; i+1 < max; ){
     e3c:	fec42783          	lw	a5,-20(s0)
     e40:	2785                	addiw	a5,a5,1
     e42:	0007871b          	sext.w	a4,a5
     e46:	fd442783          	lw	a5,-44(s0)
     e4a:	2781                	sext.w	a5,a5
     e4c:	f8f74de3          	blt	a4,a5,de6 <gets+0x18>
     e50:	a011                	j	e54 <gets+0x86>
      break;
     e52:	0001                	nop
      break;
  }
  buf[i] = '\0';
     e54:	fec42783          	lw	a5,-20(s0)
     e58:	fd843703          	ld	a4,-40(s0)
     e5c:	97ba                	add	a5,a5,a4
     e5e:	00078023          	sb	zero,0(a5)
  return buf;
     e62:	fd843783          	ld	a5,-40(s0)
}
     e66:	853e                	mv	a0,a5
     e68:	70a2                	ld	ra,40(sp)
     e6a:	7402                	ld	s0,32(sp)
     e6c:	6145                	addi	sp,sp,48
     e6e:	8082                	ret

0000000000000e70 <stat>:

int
stat(const char *n, struct stat *st)
{
     e70:	7179                	addi	sp,sp,-48
     e72:	f406                	sd	ra,40(sp)
     e74:	f022                	sd	s0,32(sp)
     e76:	1800                	addi	s0,sp,48
     e78:	fca43c23          	sd	a0,-40(s0)
     e7c:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     e80:	4581                	li	a1,0
     e82:	fd843503          	ld	a0,-40(s0)
     e86:	00000097          	auipc	ra,0x0
     e8a:	288080e7          	jalr	648(ra) # 110e <open>
     e8e:	87aa                	mv	a5,a0
     e90:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     e94:	fec42783          	lw	a5,-20(s0)
     e98:	2781                	sext.w	a5,a5
     e9a:	0007d463          	bgez	a5,ea2 <stat+0x32>
    return -1;
     e9e:	57fd                	li	a5,-1
     ea0:	a035                	j	ecc <stat+0x5c>
  r = fstat(fd, st);
     ea2:	fec42783          	lw	a5,-20(s0)
     ea6:	fd043583          	ld	a1,-48(s0)
     eaa:	853e                	mv	a0,a5
     eac:	00000097          	auipc	ra,0x0
     eb0:	27a080e7          	jalr	634(ra) # 1126 <fstat>
     eb4:	87aa                	mv	a5,a0
     eb6:	fef42423          	sw	a5,-24(s0)
  close(fd);
     eba:	fec42783          	lw	a5,-20(s0)
     ebe:	853e                	mv	a0,a5
     ec0:	00000097          	auipc	ra,0x0
     ec4:	236080e7          	jalr	566(ra) # 10f6 <close>
  return r;
     ec8:	fe842783          	lw	a5,-24(s0)
}
     ecc:	853e                	mv	a0,a5
     ece:	70a2                	ld	ra,40(sp)
     ed0:	7402                	ld	s0,32(sp)
     ed2:	6145                	addi	sp,sp,48
     ed4:	8082                	ret

0000000000000ed6 <atoi>:

int
atoi(const char *s)
{
     ed6:	7179                	addi	sp,sp,-48
     ed8:	f422                	sd	s0,40(sp)
     eda:	1800                	addi	s0,sp,48
     edc:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     ee0:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     ee4:	a815                	j	f18 <atoi+0x42>
    n = n*10 + *s++ - '0';
     ee6:	fec42703          	lw	a4,-20(s0)
     eea:	87ba                	mv	a5,a4
     eec:	0027979b          	slliw	a5,a5,0x2
     ef0:	9fb9                	addw	a5,a5,a4
     ef2:	0017979b          	slliw	a5,a5,0x1
     ef6:	0007871b          	sext.w	a4,a5
     efa:	fd843783          	ld	a5,-40(s0)
     efe:	00178693          	addi	a3,a5,1
     f02:	fcd43c23          	sd	a3,-40(s0)
     f06:	0007c783          	lbu	a5,0(a5)
     f0a:	2781                	sext.w	a5,a5
     f0c:	9fb9                	addw	a5,a5,a4
     f0e:	2781                	sext.w	a5,a5
     f10:	fd07879b          	addiw	a5,a5,-48
     f14:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     f18:	fd843783          	ld	a5,-40(s0)
     f1c:	0007c783          	lbu	a5,0(a5)
     f20:	873e                	mv	a4,a5
     f22:	02f00793          	li	a5,47
     f26:	00e7fb63          	bgeu	a5,a4,f3c <atoi+0x66>
     f2a:	fd843783          	ld	a5,-40(s0)
     f2e:	0007c783          	lbu	a5,0(a5)
     f32:	873e                	mv	a4,a5
     f34:	03900793          	li	a5,57
     f38:	fae7f7e3          	bgeu	a5,a4,ee6 <atoi+0x10>
  return n;
     f3c:	fec42783          	lw	a5,-20(s0)
}
     f40:	853e                	mv	a0,a5
     f42:	7422                	ld	s0,40(sp)
     f44:	6145                	addi	sp,sp,48
     f46:	8082                	ret

0000000000000f48 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     f48:	7139                	addi	sp,sp,-64
     f4a:	fc22                	sd	s0,56(sp)
     f4c:	0080                	addi	s0,sp,64
     f4e:	fca43c23          	sd	a0,-40(s0)
     f52:	fcb43823          	sd	a1,-48(s0)
     f56:	87b2                	mv	a5,a2
     f58:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     f5c:	fd843783          	ld	a5,-40(s0)
     f60:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     f64:	fd043783          	ld	a5,-48(s0)
     f68:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     f6c:	fe043703          	ld	a4,-32(s0)
     f70:	fe843783          	ld	a5,-24(s0)
     f74:	02e7fc63          	bgeu	a5,a4,fac <memmove+0x64>
    while(n-- > 0)
     f78:	a00d                	j	f9a <memmove+0x52>
      *dst++ = *src++;
     f7a:	fe043703          	ld	a4,-32(s0)
     f7e:	00170793          	addi	a5,a4,1
     f82:	fef43023          	sd	a5,-32(s0)
     f86:	fe843783          	ld	a5,-24(s0)
     f8a:	00178693          	addi	a3,a5,1
     f8e:	fed43423          	sd	a3,-24(s0)
     f92:	00074703          	lbu	a4,0(a4)
     f96:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     f9a:	fcc42783          	lw	a5,-52(s0)
     f9e:	fff7871b          	addiw	a4,a5,-1
     fa2:	fce42623          	sw	a4,-52(s0)
     fa6:	fcf04ae3          	bgtz	a5,f7a <memmove+0x32>
     faa:	a891                	j	ffe <memmove+0xb6>
  } else {
    dst += n;
     fac:	fcc42783          	lw	a5,-52(s0)
     fb0:	fe843703          	ld	a4,-24(s0)
     fb4:	97ba                	add	a5,a5,a4
     fb6:	fef43423          	sd	a5,-24(s0)
    src += n;
     fba:	fcc42783          	lw	a5,-52(s0)
     fbe:	fe043703          	ld	a4,-32(s0)
     fc2:	97ba                	add	a5,a5,a4
     fc4:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     fc8:	a01d                	j	fee <memmove+0xa6>
      *--dst = *--src;
     fca:	fe043783          	ld	a5,-32(s0)
     fce:	17fd                	addi	a5,a5,-1
     fd0:	fef43023          	sd	a5,-32(s0)
     fd4:	fe843783          	ld	a5,-24(s0)
     fd8:	17fd                	addi	a5,a5,-1
     fda:	fef43423          	sd	a5,-24(s0)
     fde:	fe043783          	ld	a5,-32(s0)
     fe2:	0007c703          	lbu	a4,0(a5)
     fe6:	fe843783          	ld	a5,-24(s0)
     fea:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     fee:	fcc42783          	lw	a5,-52(s0)
     ff2:	fff7871b          	addiw	a4,a5,-1
     ff6:	fce42623          	sw	a4,-52(s0)
     ffa:	fcf048e3          	bgtz	a5,fca <memmove+0x82>
  }
  return vdst;
     ffe:	fd843783          	ld	a5,-40(s0)
}
    1002:	853e                	mv	a0,a5
    1004:	7462                	ld	s0,56(sp)
    1006:	6121                	addi	sp,sp,64
    1008:	8082                	ret

000000000000100a <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
    100a:	7139                	addi	sp,sp,-64
    100c:	fc22                	sd	s0,56(sp)
    100e:	0080                	addi	s0,sp,64
    1010:	fca43c23          	sd	a0,-40(s0)
    1014:	fcb43823          	sd	a1,-48(s0)
    1018:	87b2                	mv	a5,a2
    101a:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
    101e:	fd843783          	ld	a5,-40(s0)
    1022:	fef43423          	sd	a5,-24(s0)
    1026:	fd043783          	ld	a5,-48(s0)
    102a:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
    102e:	a0a1                	j	1076 <memcmp+0x6c>
    if (*p1 != *p2) {
    1030:	fe843783          	ld	a5,-24(s0)
    1034:	0007c703          	lbu	a4,0(a5)
    1038:	fe043783          	ld	a5,-32(s0)
    103c:	0007c783          	lbu	a5,0(a5)
    1040:	02f70163          	beq	a4,a5,1062 <memcmp+0x58>
      return *p1 - *p2;
    1044:	fe843783          	ld	a5,-24(s0)
    1048:	0007c783          	lbu	a5,0(a5)
    104c:	0007871b          	sext.w	a4,a5
    1050:	fe043783          	ld	a5,-32(s0)
    1054:	0007c783          	lbu	a5,0(a5)
    1058:	2781                	sext.w	a5,a5
    105a:	40f707bb          	subw	a5,a4,a5
    105e:	2781                	sext.w	a5,a5
    1060:	a01d                	j	1086 <memcmp+0x7c>
    }
    p1++;
    1062:	fe843783          	ld	a5,-24(s0)
    1066:	0785                	addi	a5,a5,1
    1068:	fef43423          	sd	a5,-24(s0)
    p2++;
    106c:	fe043783          	ld	a5,-32(s0)
    1070:	0785                	addi	a5,a5,1
    1072:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
    1076:	fcc42783          	lw	a5,-52(s0)
    107a:	fff7871b          	addiw	a4,a5,-1
    107e:	fce42623          	sw	a4,-52(s0)
    1082:	f7dd                	bnez	a5,1030 <memcmp+0x26>
  }
  return 0;
    1084:	4781                	li	a5,0
}
    1086:	853e                	mv	a0,a5
    1088:	7462                	ld	s0,56(sp)
    108a:	6121                	addi	sp,sp,64
    108c:	8082                	ret

000000000000108e <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
    108e:	7179                	addi	sp,sp,-48
    1090:	f406                	sd	ra,40(sp)
    1092:	f022                	sd	s0,32(sp)
    1094:	1800                	addi	s0,sp,48
    1096:	fea43423          	sd	a0,-24(s0)
    109a:	feb43023          	sd	a1,-32(s0)
    109e:	87b2                	mv	a5,a2
    10a0:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
    10a4:	fdc42783          	lw	a5,-36(s0)
    10a8:	863e                	mv	a2,a5
    10aa:	fe043583          	ld	a1,-32(s0)
    10ae:	fe843503          	ld	a0,-24(s0)
    10b2:	00000097          	auipc	ra,0x0
    10b6:	e96080e7          	jalr	-362(ra) # f48 <memmove>
    10ba:	87aa                	mv	a5,a0
}
    10bc:	853e                	mv	a0,a5
    10be:	70a2                	ld	ra,40(sp)
    10c0:	7402                	ld	s0,32(sp)
    10c2:	6145                	addi	sp,sp,48
    10c4:	8082                	ret

00000000000010c6 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
    10c6:	4885                	li	a7,1
 ecall
    10c8:	00000073          	ecall
 ret
    10cc:	8082                	ret

00000000000010ce <exit>:
.global exit
exit:
 li a7, SYS_exit
    10ce:	4889                	li	a7,2
 ecall
    10d0:	00000073          	ecall
 ret
    10d4:	8082                	ret

00000000000010d6 <wait>:
.global wait
wait:
 li a7, SYS_wait
    10d6:	488d                	li	a7,3
 ecall
    10d8:	00000073          	ecall
 ret
    10dc:	8082                	ret

00000000000010de <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
    10de:	4891                	li	a7,4
 ecall
    10e0:	00000073          	ecall
 ret
    10e4:	8082                	ret

00000000000010e6 <read>:
.global read
read:
 li a7, SYS_read
    10e6:	4895                	li	a7,5
 ecall
    10e8:	00000073          	ecall
 ret
    10ec:	8082                	ret

00000000000010ee <write>:
.global write
write:
 li a7, SYS_write
    10ee:	48c1                	li	a7,16
 ecall
    10f0:	00000073          	ecall
 ret
    10f4:	8082                	ret

00000000000010f6 <close>:
.global close
close:
 li a7, SYS_close
    10f6:	48d5                	li	a7,21
 ecall
    10f8:	00000073          	ecall
 ret
    10fc:	8082                	ret

00000000000010fe <kill>:
.global kill
kill:
 li a7, SYS_kill
    10fe:	4899                	li	a7,6
 ecall
    1100:	00000073          	ecall
 ret
    1104:	8082                	ret

0000000000001106 <exec>:
.global exec
exec:
 li a7, SYS_exec
    1106:	489d                	li	a7,7
 ecall
    1108:	00000073          	ecall
 ret
    110c:	8082                	ret

000000000000110e <open>:
.global open
open:
 li a7, SYS_open
    110e:	48bd                	li	a7,15
 ecall
    1110:	00000073          	ecall
 ret
    1114:	8082                	ret

0000000000001116 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
    1116:	48c5                	li	a7,17
 ecall
    1118:	00000073          	ecall
 ret
    111c:	8082                	ret

000000000000111e <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
    111e:	48c9                	li	a7,18
 ecall
    1120:	00000073          	ecall
 ret
    1124:	8082                	ret

0000000000001126 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
    1126:	48a1                	li	a7,8
 ecall
    1128:	00000073          	ecall
 ret
    112c:	8082                	ret

000000000000112e <link>:
.global link
link:
 li a7, SYS_link
    112e:	48cd                	li	a7,19
 ecall
    1130:	00000073          	ecall
 ret
    1134:	8082                	ret

0000000000001136 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
    1136:	48d1                	li	a7,20
 ecall
    1138:	00000073          	ecall
 ret
    113c:	8082                	ret

000000000000113e <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
    113e:	48a5                	li	a7,9
 ecall
    1140:	00000073          	ecall
 ret
    1144:	8082                	ret

0000000000001146 <dup>:
.global dup
dup:
 li a7, SYS_dup
    1146:	48a9                	li	a7,10
 ecall
    1148:	00000073          	ecall
 ret
    114c:	8082                	ret

000000000000114e <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
    114e:	48ad                	li	a7,11
 ecall
    1150:	00000073          	ecall
 ret
    1154:	8082                	ret

0000000000001156 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
    1156:	48b1                	li	a7,12
 ecall
    1158:	00000073          	ecall
 ret
    115c:	8082                	ret

000000000000115e <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
    115e:	48b5                	li	a7,13
 ecall
    1160:	00000073          	ecall
 ret
    1164:	8082                	ret

0000000000001166 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
    1166:	48b9                	li	a7,14
 ecall
    1168:	00000073          	ecall
 ret
    116c:	8082                	ret

000000000000116e <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
    116e:	48d9                	li	a7,22
 ecall
    1170:	00000073          	ecall
 ret
    1174:	8082                	ret

0000000000001176 <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
    1176:	48dd                	li	a7,23
 ecall
    1178:	00000073          	ecall
 ret
    117c:	8082                	ret

000000000000117e <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
    117e:	48e1                	li	a7,24
 ecall
    1180:	00000073          	ecall
 ret
    1184:	8082                	ret

0000000000001186 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
    1186:	1101                	addi	sp,sp,-32
    1188:	ec06                	sd	ra,24(sp)
    118a:	e822                	sd	s0,16(sp)
    118c:	1000                	addi	s0,sp,32
    118e:	87aa                	mv	a5,a0
    1190:	872e                	mv	a4,a1
    1192:	fef42623          	sw	a5,-20(s0)
    1196:	87ba                	mv	a5,a4
    1198:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
    119c:	feb40713          	addi	a4,s0,-21
    11a0:	fec42783          	lw	a5,-20(s0)
    11a4:	4605                	li	a2,1
    11a6:	85ba                	mv	a1,a4
    11a8:	853e                	mv	a0,a5
    11aa:	00000097          	auipc	ra,0x0
    11ae:	f44080e7          	jalr	-188(ra) # 10ee <write>
}
    11b2:	0001                	nop
    11b4:	60e2                	ld	ra,24(sp)
    11b6:	6442                	ld	s0,16(sp)
    11b8:	6105                	addi	sp,sp,32
    11ba:	8082                	ret

00000000000011bc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    11bc:	7139                	addi	sp,sp,-64
    11be:	fc06                	sd	ra,56(sp)
    11c0:	f822                	sd	s0,48(sp)
    11c2:	0080                	addi	s0,sp,64
    11c4:	87aa                	mv	a5,a0
    11c6:	8736                	mv	a4,a3
    11c8:	fcf42623          	sw	a5,-52(s0)
    11cc:	87ae                	mv	a5,a1
    11ce:	fcf42423          	sw	a5,-56(s0)
    11d2:	87b2                	mv	a5,a2
    11d4:	fcf42223          	sw	a5,-60(s0)
    11d8:	87ba                	mv	a5,a4
    11da:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    11de:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
    11e2:	fc042783          	lw	a5,-64(s0)
    11e6:	2781                	sext.w	a5,a5
    11e8:	c38d                	beqz	a5,120a <printint+0x4e>
    11ea:	fc842783          	lw	a5,-56(s0)
    11ee:	2781                	sext.w	a5,a5
    11f0:	0007dd63          	bgez	a5,120a <printint+0x4e>
    neg = 1;
    11f4:	4785                	li	a5,1
    11f6:	fef42423          	sw	a5,-24(s0)
    x = -xx;
    11fa:	fc842783          	lw	a5,-56(s0)
    11fe:	40f007bb          	negw	a5,a5
    1202:	2781                	sext.w	a5,a5
    1204:	fef42223          	sw	a5,-28(s0)
    1208:	a029                	j	1212 <printint+0x56>
  } else {
    x = xx;
    120a:	fc842783          	lw	a5,-56(s0)
    120e:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
    1212:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
    1216:	fc442783          	lw	a5,-60(s0)
    121a:	fe442703          	lw	a4,-28(s0)
    121e:	02f777bb          	remuw	a5,a4,a5
    1222:	0007861b          	sext.w	a2,a5
    1226:	fec42783          	lw	a5,-20(s0)
    122a:	0017871b          	addiw	a4,a5,1
    122e:	fee42623          	sw	a4,-20(s0)
    1232:	00001697          	auipc	a3,0x1
    1236:	c5e68693          	addi	a3,a3,-930 # 1e90 <digits>
    123a:	02061713          	slli	a4,a2,0x20
    123e:	9301                	srli	a4,a4,0x20
    1240:	9736                	add	a4,a4,a3
    1242:	00074703          	lbu	a4,0(a4)
    1246:	ff040693          	addi	a3,s0,-16
    124a:	97b6                	add	a5,a5,a3
    124c:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
    1250:	fc442783          	lw	a5,-60(s0)
    1254:	fe442703          	lw	a4,-28(s0)
    1258:	02f757bb          	divuw	a5,a4,a5
    125c:	fef42223          	sw	a5,-28(s0)
    1260:	fe442783          	lw	a5,-28(s0)
    1264:	2781                	sext.w	a5,a5
    1266:	fbc5                	bnez	a5,1216 <printint+0x5a>
  if(neg)
    1268:	fe842783          	lw	a5,-24(s0)
    126c:	2781                	sext.w	a5,a5
    126e:	cf95                	beqz	a5,12aa <printint+0xee>
    buf[i++] = '-';
    1270:	fec42783          	lw	a5,-20(s0)
    1274:	0017871b          	addiw	a4,a5,1
    1278:	fee42623          	sw	a4,-20(s0)
    127c:	ff040713          	addi	a4,s0,-16
    1280:	97ba                	add	a5,a5,a4
    1282:	02d00713          	li	a4,45
    1286:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
    128a:	a005                	j	12aa <printint+0xee>
    putc(fd, buf[i]);
    128c:	fec42783          	lw	a5,-20(s0)
    1290:	ff040713          	addi	a4,s0,-16
    1294:	97ba                	add	a5,a5,a4
    1296:	fe07c703          	lbu	a4,-32(a5)
    129a:	fcc42783          	lw	a5,-52(s0)
    129e:	85ba                	mv	a1,a4
    12a0:	853e                	mv	a0,a5
    12a2:	00000097          	auipc	ra,0x0
    12a6:	ee4080e7          	jalr	-284(ra) # 1186 <putc>
  while(--i >= 0)
    12aa:	fec42783          	lw	a5,-20(s0)
    12ae:	37fd                	addiw	a5,a5,-1
    12b0:	fef42623          	sw	a5,-20(s0)
    12b4:	fec42783          	lw	a5,-20(s0)
    12b8:	2781                	sext.w	a5,a5
    12ba:	fc07d9e3          	bgez	a5,128c <printint+0xd0>
}
    12be:	0001                	nop
    12c0:	0001                	nop
    12c2:	70e2                	ld	ra,56(sp)
    12c4:	7442                	ld	s0,48(sp)
    12c6:	6121                	addi	sp,sp,64
    12c8:	8082                	ret

00000000000012ca <printptr>:

static void
printptr(int fd, uint64 x) {
    12ca:	7179                	addi	sp,sp,-48
    12cc:	f406                	sd	ra,40(sp)
    12ce:	f022                	sd	s0,32(sp)
    12d0:	1800                	addi	s0,sp,48
    12d2:	87aa                	mv	a5,a0
    12d4:	fcb43823          	sd	a1,-48(s0)
    12d8:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
    12dc:	fdc42783          	lw	a5,-36(s0)
    12e0:	03000593          	li	a1,48
    12e4:	853e                	mv	a0,a5
    12e6:	00000097          	auipc	ra,0x0
    12ea:	ea0080e7          	jalr	-352(ra) # 1186 <putc>
  putc(fd, 'x');
    12ee:	fdc42783          	lw	a5,-36(s0)
    12f2:	07800593          	li	a1,120
    12f6:	853e                	mv	a0,a5
    12f8:	00000097          	auipc	ra,0x0
    12fc:	e8e080e7          	jalr	-370(ra) # 1186 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    1300:	fe042623          	sw	zero,-20(s0)
    1304:	a82d                	j	133e <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
    1306:	fd043783          	ld	a5,-48(s0)
    130a:	93f1                	srli	a5,a5,0x3c
    130c:	00001717          	auipc	a4,0x1
    1310:	b8470713          	addi	a4,a4,-1148 # 1e90 <digits>
    1314:	97ba                	add	a5,a5,a4
    1316:	0007c703          	lbu	a4,0(a5)
    131a:	fdc42783          	lw	a5,-36(s0)
    131e:	85ba                	mv	a1,a4
    1320:	853e                	mv	a0,a5
    1322:	00000097          	auipc	ra,0x0
    1326:	e64080e7          	jalr	-412(ra) # 1186 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    132a:	fec42783          	lw	a5,-20(s0)
    132e:	2785                	addiw	a5,a5,1
    1330:	fef42623          	sw	a5,-20(s0)
    1334:	fd043783          	ld	a5,-48(s0)
    1338:	0792                	slli	a5,a5,0x4
    133a:	fcf43823          	sd	a5,-48(s0)
    133e:	fec42783          	lw	a5,-20(s0)
    1342:	873e                	mv	a4,a5
    1344:	47bd                	li	a5,15
    1346:	fce7f0e3          	bgeu	a5,a4,1306 <printptr+0x3c>
}
    134a:	0001                	nop
    134c:	0001                	nop
    134e:	70a2                	ld	ra,40(sp)
    1350:	7402                	ld	s0,32(sp)
    1352:	6145                	addi	sp,sp,48
    1354:	8082                	ret

0000000000001356 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
    1356:	715d                	addi	sp,sp,-80
    1358:	e486                	sd	ra,72(sp)
    135a:	e0a2                	sd	s0,64(sp)
    135c:	0880                	addi	s0,sp,80
    135e:	87aa                	mv	a5,a0
    1360:	fcb43023          	sd	a1,-64(s0)
    1364:	fac43c23          	sd	a2,-72(s0)
    1368:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
    136c:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
    1370:	fe042223          	sw	zero,-28(s0)
    1374:	a42d                	j	159e <vprintf+0x248>
    c = fmt[i] & 0xff;
    1376:	fe442783          	lw	a5,-28(s0)
    137a:	fc043703          	ld	a4,-64(s0)
    137e:	97ba                	add	a5,a5,a4
    1380:	0007c783          	lbu	a5,0(a5)
    1384:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
    1388:	fe042783          	lw	a5,-32(s0)
    138c:	2781                	sext.w	a5,a5
    138e:	eb9d                	bnez	a5,13c4 <vprintf+0x6e>
      if(c == '%'){
    1390:	fdc42783          	lw	a5,-36(s0)
    1394:	0007871b          	sext.w	a4,a5
    1398:	02500793          	li	a5,37
    139c:	00f71763          	bne	a4,a5,13aa <vprintf+0x54>
        state = '%';
    13a0:	02500793          	li	a5,37
    13a4:	fef42023          	sw	a5,-32(s0)
    13a8:	a2f5                	j	1594 <vprintf+0x23e>
      } else {
        putc(fd, c);
    13aa:	fdc42783          	lw	a5,-36(s0)
    13ae:	0ff7f713          	andi	a4,a5,255
    13b2:	fcc42783          	lw	a5,-52(s0)
    13b6:	85ba                	mv	a1,a4
    13b8:	853e                	mv	a0,a5
    13ba:	00000097          	auipc	ra,0x0
    13be:	dcc080e7          	jalr	-564(ra) # 1186 <putc>
    13c2:	aac9                	j	1594 <vprintf+0x23e>
      }
    } else if(state == '%'){
    13c4:	fe042783          	lw	a5,-32(s0)
    13c8:	0007871b          	sext.w	a4,a5
    13cc:	02500793          	li	a5,37
    13d0:	1cf71263          	bne	a4,a5,1594 <vprintf+0x23e>
      if(c == 'd'){
    13d4:	fdc42783          	lw	a5,-36(s0)
    13d8:	0007871b          	sext.w	a4,a5
    13dc:	06400793          	li	a5,100
    13e0:	02f71463          	bne	a4,a5,1408 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
    13e4:	fb843783          	ld	a5,-72(s0)
    13e8:	00878713          	addi	a4,a5,8
    13ec:	fae43c23          	sd	a4,-72(s0)
    13f0:	4398                	lw	a4,0(a5)
    13f2:	fcc42783          	lw	a5,-52(s0)
    13f6:	4685                	li	a3,1
    13f8:	4629                	li	a2,10
    13fa:	85ba                	mv	a1,a4
    13fc:	853e                	mv	a0,a5
    13fe:	00000097          	auipc	ra,0x0
    1402:	dbe080e7          	jalr	-578(ra) # 11bc <printint>
    1406:	a269                	j	1590 <vprintf+0x23a>
      } else if(c == 'l') {
    1408:	fdc42783          	lw	a5,-36(s0)
    140c:	0007871b          	sext.w	a4,a5
    1410:	06c00793          	li	a5,108
    1414:	02f71663          	bne	a4,a5,1440 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
    1418:	fb843783          	ld	a5,-72(s0)
    141c:	00878713          	addi	a4,a5,8
    1420:	fae43c23          	sd	a4,-72(s0)
    1424:	639c                	ld	a5,0(a5)
    1426:	0007871b          	sext.w	a4,a5
    142a:	fcc42783          	lw	a5,-52(s0)
    142e:	4681                	li	a3,0
    1430:	4629                	li	a2,10
    1432:	85ba                	mv	a1,a4
    1434:	853e                	mv	a0,a5
    1436:	00000097          	auipc	ra,0x0
    143a:	d86080e7          	jalr	-634(ra) # 11bc <printint>
    143e:	aa89                	j	1590 <vprintf+0x23a>
      } else if(c == 'x') {
    1440:	fdc42783          	lw	a5,-36(s0)
    1444:	0007871b          	sext.w	a4,a5
    1448:	07800793          	li	a5,120
    144c:	02f71463          	bne	a4,a5,1474 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
    1450:	fb843783          	ld	a5,-72(s0)
    1454:	00878713          	addi	a4,a5,8
    1458:	fae43c23          	sd	a4,-72(s0)
    145c:	4398                	lw	a4,0(a5)
    145e:	fcc42783          	lw	a5,-52(s0)
    1462:	4681                	li	a3,0
    1464:	4641                	li	a2,16
    1466:	85ba                	mv	a1,a4
    1468:	853e                	mv	a0,a5
    146a:	00000097          	auipc	ra,0x0
    146e:	d52080e7          	jalr	-686(ra) # 11bc <printint>
    1472:	aa39                	j	1590 <vprintf+0x23a>
      } else if(c == 'p') {
    1474:	fdc42783          	lw	a5,-36(s0)
    1478:	0007871b          	sext.w	a4,a5
    147c:	07000793          	li	a5,112
    1480:	02f71263          	bne	a4,a5,14a4 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
    1484:	fb843783          	ld	a5,-72(s0)
    1488:	00878713          	addi	a4,a5,8
    148c:	fae43c23          	sd	a4,-72(s0)
    1490:	6398                	ld	a4,0(a5)
    1492:	fcc42783          	lw	a5,-52(s0)
    1496:	85ba                	mv	a1,a4
    1498:	853e                	mv	a0,a5
    149a:	00000097          	auipc	ra,0x0
    149e:	e30080e7          	jalr	-464(ra) # 12ca <printptr>
    14a2:	a0fd                	j	1590 <vprintf+0x23a>
      } else if(c == 's'){
    14a4:	fdc42783          	lw	a5,-36(s0)
    14a8:	0007871b          	sext.w	a4,a5
    14ac:	07300793          	li	a5,115
    14b0:	04f71c63          	bne	a4,a5,1508 <vprintf+0x1b2>
        s = va_arg(ap, char*);
    14b4:	fb843783          	ld	a5,-72(s0)
    14b8:	00878713          	addi	a4,a5,8
    14bc:	fae43c23          	sd	a4,-72(s0)
    14c0:	639c                	ld	a5,0(a5)
    14c2:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
    14c6:	fe843783          	ld	a5,-24(s0)
    14ca:	eb8d                	bnez	a5,14fc <vprintf+0x1a6>
          s = "(null)";
    14cc:	00001797          	auipc	a5,0x1
    14d0:	99c78793          	addi	a5,a5,-1636 # 1e68 <schedule_dm+0x3c0>
    14d4:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
    14d8:	a015                	j	14fc <vprintf+0x1a6>
          putc(fd, *s);
    14da:	fe843783          	ld	a5,-24(s0)
    14de:	0007c703          	lbu	a4,0(a5)
    14e2:	fcc42783          	lw	a5,-52(s0)
    14e6:	85ba                	mv	a1,a4
    14e8:	853e                	mv	a0,a5
    14ea:	00000097          	auipc	ra,0x0
    14ee:	c9c080e7          	jalr	-868(ra) # 1186 <putc>
          s++;
    14f2:	fe843783          	ld	a5,-24(s0)
    14f6:	0785                	addi	a5,a5,1
    14f8:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
    14fc:	fe843783          	ld	a5,-24(s0)
    1500:	0007c783          	lbu	a5,0(a5)
    1504:	fbf9                	bnez	a5,14da <vprintf+0x184>
    1506:	a069                	j	1590 <vprintf+0x23a>
        }
      } else if(c == 'c'){
    1508:	fdc42783          	lw	a5,-36(s0)
    150c:	0007871b          	sext.w	a4,a5
    1510:	06300793          	li	a5,99
    1514:	02f71463          	bne	a4,a5,153c <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
    1518:	fb843783          	ld	a5,-72(s0)
    151c:	00878713          	addi	a4,a5,8
    1520:	fae43c23          	sd	a4,-72(s0)
    1524:	439c                	lw	a5,0(a5)
    1526:	0ff7f713          	andi	a4,a5,255
    152a:	fcc42783          	lw	a5,-52(s0)
    152e:	85ba                	mv	a1,a4
    1530:	853e                	mv	a0,a5
    1532:	00000097          	auipc	ra,0x0
    1536:	c54080e7          	jalr	-940(ra) # 1186 <putc>
    153a:	a899                	j	1590 <vprintf+0x23a>
      } else if(c == '%'){
    153c:	fdc42783          	lw	a5,-36(s0)
    1540:	0007871b          	sext.w	a4,a5
    1544:	02500793          	li	a5,37
    1548:	00f71f63          	bne	a4,a5,1566 <vprintf+0x210>
        putc(fd, c);
    154c:	fdc42783          	lw	a5,-36(s0)
    1550:	0ff7f713          	andi	a4,a5,255
    1554:	fcc42783          	lw	a5,-52(s0)
    1558:	85ba                	mv	a1,a4
    155a:	853e                	mv	a0,a5
    155c:	00000097          	auipc	ra,0x0
    1560:	c2a080e7          	jalr	-982(ra) # 1186 <putc>
    1564:	a035                	j	1590 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1566:	fcc42783          	lw	a5,-52(s0)
    156a:	02500593          	li	a1,37
    156e:	853e                	mv	a0,a5
    1570:	00000097          	auipc	ra,0x0
    1574:	c16080e7          	jalr	-1002(ra) # 1186 <putc>
        putc(fd, c);
    1578:	fdc42783          	lw	a5,-36(s0)
    157c:	0ff7f713          	andi	a4,a5,255
    1580:	fcc42783          	lw	a5,-52(s0)
    1584:	85ba                	mv	a1,a4
    1586:	853e                	mv	a0,a5
    1588:	00000097          	auipc	ra,0x0
    158c:	bfe080e7          	jalr	-1026(ra) # 1186 <putc>
      }
      state = 0;
    1590:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
    1594:	fe442783          	lw	a5,-28(s0)
    1598:	2785                	addiw	a5,a5,1
    159a:	fef42223          	sw	a5,-28(s0)
    159e:	fe442783          	lw	a5,-28(s0)
    15a2:	fc043703          	ld	a4,-64(s0)
    15a6:	97ba                	add	a5,a5,a4
    15a8:	0007c783          	lbu	a5,0(a5)
    15ac:	dc0795e3          	bnez	a5,1376 <vprintf+0x20>
    }
  }
}
    15b0:	0001                	nop
    15b2:	0001                	nop
    15b4:	60a6                	ld	ra,72(sp)
    15b6:	6406                	ld	s0,64(sp)
    15b8:	6161                	addi	sp,sp,80
    15ba:	8082                	ret

00000000000015bc <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
    15bc:	7159                	addi	sp,sp,-112
    15be:	fc06                	sd	ra,56(sp)
    15c0:	f822                	sd	s0,48(sp)
    15c2:	0080                	addi	s0,sp,64
    15c4:	fcb43823          	sd	a1,-48(s0)
    15c8:	e010                	sd	a2,0(s0)
    15ca:	e414                	sd	a3,8(s0)
    15cc:	e818                	sd	a4,16(s0)
    15ce:	ec1c                	sd	a5,24(s0)
    15d0:	03043023          	sd	a6,32(s0)
    15d4:	03143423          	sd	a7,40(s0)
    15d8:	87aa                	mv	a5,a0
    15da:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
    15de:	03040793          	addi	a5,s0,48
    15e2:	fcf43423          	sd	a5,-56(s0)
    15e6:	fc843783          	ld	a5,-56(s0)
    15ea:	fd078793          	addi	a5,a5,-48
    15ee:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
    15f2:	fe843703          	ld	a4,-24(s0)
    15f6:	fdc42783          	lw	a5,-36(s0)
    15fa:	863a                	mv	a2,a4
    15fc:	fd043583          	ld	a1,-48(s0)
    1600:	853e                	mv	a0,a5
    1602:	00000097          	auipc	ra,0x0
    1606:	d54080e7          	jalr	-684(ra) # 1356 <vprintf>
}
    160a:	0001                	nop
    160c:	70e2                	ld	ra,56(sp)
    160e:	7442                	ld	s0,48(sp)
    1610:	6165                	addi	sp,sp,112
    1612:	8082                	ret

0000000000001614 <printf>:

void
printf(const char *fmt, ...)
{
    1614:	7159                	addi	sp,sp,-112
    1616:	f406                	sd	ra,40(sp)
    1618:	f022                	sd	s0,32(sp)
    161a:	1800                	addi	s0,sp,48
    161c:	fca43c23          	sd	a0,-40(s0)
    1620:	e40c                	sd	a1,8(s0)
    1622:	e810                	sd	a2,16(s0)
    1624:	ec14                	sd	a3,24(s0)
    1626:	f018                	sd	a4,32(s0)
    1628:	f41c                	sd	a5,40(s0)
    162a:	03043823          	sd	a6,48(s0)
    162e:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
    1632:	04040793          	addi	a5,s0,64
    1636:	fcf43823          	sd	a5,-48(s0)
    163a:	fd043783          	ld	a5,-48(s0)
    163e:	fc878793          	addi	a5,a5,-56
    1642:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
    1646:	fe843783          	ld	a5,-24(s0)
    164a:	863e                	mv	a2,a5
    164c:	fd843583          	ld	a1,-40(s0)
    1650:	4505                	li	a0,1
    1652:	00000097          	auipc	ra,0x0
    1656:	d04080e7          	jalr	-764(ra) # 1356 <vprintf>
}
    165a:	0001                	nop
    165c:	70a2                	ld	ra,40(sp)
    165e:	7402                	ld	s0,32(sp)
    1660:	6165                	addi	sp,sp,112
    1662:	8082                	ret

0000000000001664 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1664:	7179                	addi	sp,sp,-48
    1666:	f422                	sd	s0,40(sp)
    1668:	1800                	addi	s0,sp,48
    166a:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
    166e:	fd843783          	ld	a5,-40(s0)
    1672:	17c1                	addi	a5,a5,-16
    1674:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1678:	00001797          	auipc	a5,0x1
    167c:	86078793          	addi	a5,a5,-1952 # 1ed8 <freep>
    1680:	639c                	ld	a5,0(a5)
    1682:	fef43423          	sd	a5,-24(s0)
    1686:	a815                	j	16ba <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1688:	fe843783          	ld	a5,-24(s0)
    168c:	639c                	ld	a5,0(a5)
    168e:	fe843703          	ld	a4,-24(s0)
    1692:	00f76f63          	bltu	a4,a5,16b0 <free+0x4c>
    1696:	fe043703          	ld	a4,-32(s0)
    169a:	fe843783          	ld	a5,-24(s0)
    169e:	02e7eb63          	bltu	a5,a4,16d4 <free+0x70>
    16a2:	fe843783          	ld	a5,-24(s0)
    16a6:	639c                	ld	a5,0(a5)
    16a8:	fe043703          	ld	a4,-32(s0)
    16ac:	02f76463          	bltu	a4,a5,16d4 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16b0:	fe843783          	ld	a5,-24(s0)
    16b4:	639c                	ld	a5,0(a5)
    16b6:	fef43423          	sd	a5,-24(s0)
    16ba:	fe043703          	ld	a4,-32(s0)
    16be:	fe843783          	ld	a5,-24(s0)
    16c2:	fce7f3e3          	bgeu	a5,a4,1688 <free+0x24>
    16c6:	fe843783          	ld	a5,-24(s0)
    16ca:	639c                	ld	a5,0(a5)
    16cc:	fe043703          	ld	a4,-32(s0)
    16d0:	faf77ce3          	bgeu	a4,a5,1688 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
    16d4:	fe043783          	ld	a5,-32(s0)
    16d8:	479c                	lw	a5,8(a5)
    16da:	1782                	slli	a5,a5,0x20
    16dc:	9381                	srli	a5,a5,0x20
    16de:	0792                	slli	a5,a5,0x4
    16e0:	fe043703          	ld	a4,-32(s0)
    16e4:	973e                	add	a4,a4,a5
    16e6:	fe843783          	ld	a5,-24(s0)
    16ea:	639c                	ld	a5,0(a5)
    16ec:	02f71763          	bne	a4,a5,171a <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
    16f0:	fe043783          	ld	a5,-32(s0)
    16f4:	4798                	lw	a4,8(a5)
    16f6:	fe843783          	ld	a5,-24(s0)
    16fa:	639c                	ld	a5,0(a5)
    16fc:	479c                	lw	a5,8(a5)
    16fe:	9fb9                	addw	a5,a5,a4
    1700:	0007871b          	sext.w	a4,a5
    1704:	fe043783          	ld	a5,-32(s0)
    1708:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
    170a:	fe843783          	ld	a5,-24(s0)
    170e:	639c                	ld	a5,0(a5)
    1710:	6398                	ld	a4,0(a5)
    1712:	fe043783          	ld	a5,-32(s0)
    1716:	e398                	sd	a4,0(a5)
    1718:	a039                	j	1726 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
    171a:	fe843783          	ld	a5,-24(s0)
    171e:	6398                	ld	a4,0(a5)
    1720:	fe043783          	ld	a5,-32(s0)
    1724:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
    1726:	fe843783          	ld	a5,-24(s0)
    172a:	479c                	lw	a5,8(a5)
    172c:	1782                	slli	a5,a5,0x20
    172e:	9381                	srli	a5,a5,0x20
    1730:	0792                	slli	a5,a5,0x4
    1732:	fe843703          	ld	a4,-24(s0)
    1736:	97ba                	add	a5,a5,a4
    1738:	fe043703          	ld	a4,-32(s0)
    173c:	02f71563          	bne	a4,a5,1766 <free+0x102>
    p->s.size += bp->s.size;
    1740:	fe843783          	ld	a5,-24(s0)
    1744:	4798                	lw	a4,8(a5)
    1746:	fe043783          	ld	a5,-32(s0)
    174a:	479c                	lw	a5,8(a5)
    174c:	9fb9                	addw	a5,a5,a4
    174e:	0007871b          	sext.w	a4,a5
    1752:	fe843783          	ld	a5,-24(s0)
    1756:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
    1758:	fe043783          	ld	a5,-32(s0)
    175c:	6398                	ld	a4,0(a5)
    175e:	fe843783          	ld	a5,-24(s0)
    1762:	e398                	sd	a4,0(a5)
    1764:	a031                	j	1770 <free+0x10c>
  } else
    p->s.ptr = bp;
    1766:	fe843783          	ld	a5,-24(s0)
    176a:	fe043703          	ld	a4,-32(s0)
    176e:	e398                	sd	a4,0(a5)
  freep = p;
    1770:	00000797          	auipc	a5,0x0
    1774:	76878793          	addi	a5,a5,1896 # 1ed8 <freep>
    1778:	fe843703          	ld	a4,-24(s0)
    177c:	e398                	sd	a4,0(a5)
}
    177e:	0001                	nop
    1780:	7422                	ld	s0,40(sp)
    1782:	6145                	addi	sp,sp,48
    1784:	8082                	ret

0000000000001786 <morecore>:

static Header*
morecore(uint nu)
{
    1786:	7179                	addi	sp,sp,-48
    1788:	f406                	sd	ra,40(sp)
    178a:	f022                	sd	s0,32(sp)
    178c:	1800                	addi	s0,sp,48
    178e:	87aa                	mv	a5,a0
    1790:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
    1794:	fdc42783          	lw	a5,-36(s0)
    1798:	0007871b          	sext.w	a4,a5
    179c:	6785                	lui	a5,0x1
    179e:	00f77563          	bgeu	a4,a5,17a8 <morecore+0x22>
    nu = 4096;
    17a2:	6785                	lui	a5,0x1
    17a4:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
    17a8:	fdc42783          	lw	a5,-36(s0)
    17ac:	0047979b          	slliw	a5,a5,0x4
    17b0:	2781                	sext.w	a5,a5
    17b2:	2781                	sext.w	a5,a5
    17b4:	853e                	mv	a0,a5
    17b6:	00000097          	auipc	ra,0x0
    17ba:	9a0080e7          	jalr	-1632(ra) # 1156 <sbrk>
    17be:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
    17c2:	fe843703          	ld	a4,-24(s0)
    17c6:	57fd                	li	a5,-1
    17c8:	00f71463          	bne	a4,a5,17d0 <morecore+0x4a>
    return 0;
    17cc:	4781                	li	a5,0
    17ce:	a03d                	j	17fc <morecore+0x76>
  hp = (Header*)p;
    17d0:	fe843783          	ld	a5,-24(s0)
    17d4:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
    17d8:	fe043783          	ld	a5,-32(s0)
    17dc:	fdc42703          	lw	a4,-36(s0)
    17e0:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
    17e2:	fe043783          	ld	a5,-32(s0)
    17e6:	07c1                	addi	a5,a5,16
    17e8:	853e                	mv	a0,a5
    17ea:	00000097          	auipc	ra,0x0
    17ee:	e7a080e7          	jalr	-390(ra) # 1664 <free>
  return freep;
    17f2:	00000797          	auipc	a5,0x0
    17f6:	6e678793          	addi	a5,a5,1766 # 1ed8 <freep>
    17fa:	639c                	ld	a5,0(a5)
}
    17fc:	853e                	mv	a0,a5
    17fe:	70a2                	ld	ra,40(sp)
    1800:	7402                	ld	s0,32(sp)
    1802:	6145                	addi	sp,sp,48
    1804:	8082                	ret

0000000000001806 <malloc>:

void*
malloc(uint nbytes)
{
    1806:	7139                	addi	sp,sp,-64
    1808:	fc06                	sd	ra,56(sp)
    180a:	f822                	sd	s0,48(sp)
    180c:	0080                	addi	s0,sp,64
    180e:	87aa                	mv	a5,a0
    1810:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1814:	fcc46783          	lwu	a5,-52(s0)
    1818:	07bd                	addi	a5,a5,15
    181a:	8391                	srli	a5,a5,0x4
    181c:	2781                	sext.w	a5,a5
    181e:	2785                	addiw	a5,a5,1
    1820:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
    1824:	00000797          	auipc	a5,0x0
    1828:	6b478793          	addi	a5,a5,1716 # 1ed8 <freep>
    182c:	639c                	ld	a5,0(a5)
    182e:	fef43023          	sd	a5,-32(s0)
    1832:	fe043783          	ld	a5,-32(s0)
    1836:	ef95                	bnez	a5,1872 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
    1838:	00000797          	auipc	a5,0x0
    183c:	69078793          	addi	a5,a5,1680 # 1ec8 <base>
    1840:	fef43023          	sd	a5,-32(s0)
    1844:	00000797          	auipc	a5,0x0
    1848:	69478793          	addi	a5,a5,1684 # 1ed8 <freep>
    184c:	fe043703          	ld	a4,-32(s0)
    1850:	e398                	sd	a4,0(a5)
    1852:	00000797          	auipc	a5,0x0
    1856:	68678793          	addi	a5,a5,1670 # 1ed8 <freep>
    185a:	6398                	ld	a4,0(a5)
    185c:	00000797          	auipc	a5,0x0
    1860:	66c78793          	addi	a5,a5,1644 # 1ec8 <base>
    1864:	e398                	sd	a4,0(a5)
    base.s.size = 0;
    1866:	00000797          	auipc	a5,0x0
    186a:	66278793          	addi	a5,a5,1634 # 1ec8 <base>
    186e:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1872:	fe043783          	ld	a5,-32(s0)
    1876:	639c                	ld	a5,0(a5)
    1878:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    187c:	fe843783          	ld	a5,-24(s0)
    1880:	4798                	lw	a4,8(a5)
    1882:	fdc42783          	lw	a5,-36(s0)
    1886:	2781                	sext.w	a5,a5
    1888:	06f76863          	bltu	a4,a5,18f8 <malloc+0xf2>
      if(p->s.size == nunits)
    188c:	fe843783          	ld	a5,-24(s0)
    1890:	4798                	lw	a4,8(a5)
    1892:	fdc42783          	lw	a5,-36(s0)
    1896:	2781                	sext.w	a5,a5
    1898:	00e79963          	bne	a5,a4,18aa <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
    189c:	fe843783          	ld	a5,-24(s0)
    18a0:	6398                	ld	a4,0(a5)
    18a2:	fe043783          	ld	a5,-32(s0)
    18a6:	e398                	sd	a4,0(a5)
    18a8:	a82d                	j	18e2 <malloc+0xdc>
      else {
        p->s.size -= nunits;
    18aa:	fe843783          	ld	a5,-24(s0)
    18ae:	4798                	lw	a4,8(a5)
    18b0:	fdc42783          	lw	a5,-36(s0)
    18b4:	40f707bb          	subw	a5,a4,a5
    18b8:	0007871b          	sext.w	a4,a5
    18bc:	fe843783          	ld	a5,-24(s0)
    18c0:	c798                	sw	a4,8(a5)
        p += p->s.size;
    18c2:	fe843783          	ld	a5,-24(s0)
    18c6:	479c                	lw	a5,8(a5)
    18c8:	1782                	slli	a5,a5,0x20
    18ca:	9381                	srli	a5,a5,0x20
    18cc:	0792                	slli	a5,a5,0x4
    18ce:	fe843703          	ld	a4,-24(s0)
    18d2:	97ba                	add	a5,a5,a4
    18d4:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
    18d8:	fe843783          	ld	a5,-24(s0)
    18dc:	fdc42703          	lw	a4,-36(s0)
    18e0:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
    18e2:	00000797          	auipc	a5,0x0
    18e6:	5f678793          	addi	a5,a5,1526 # 1ed8 <freep>
    18ea:	fe043703          	ld	a4,-32(s0)
    18ee:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
    18f0:	fe843783          	ld	a5,-24(s0)
    18f4:	07c1                	addi	a5,a5,16
    18f6:	a091                	j	193a <malloc+0x134>
    }
    if(p == freep)
    18f8:	00000797          	auipc	a5,0x0
    18fc:	5e078793          	addi	a5,a5,1504 # 1ed8 <freep>
    1900:	639c                	ld	a5,0(a5)
    1902:	fe843703          	ld	a4,-24(s0)
    1906:	02f71063          	bne	a4,a5,1926 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
    190a:	fdc42783          	lw	a5,-36(s0)
    190e:	853e                	mv	a0,a5
    1910:	00000097          	auipc	ra,0x0
    1914:	e76080e7          	jalr	-394(ra) # 1786 <morecore>
    1918:	fea43423          	sd	a0,-24(s0)
    191c:	fe843783          	ld	a5,-24(s0)
    1920:	e399                	bnez	a5,1926 <malloc+0x120>
        return 0;
    1922:	4781                	li	a5,0
    1924:	a819                	j	193a <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1926:	fe843783          	ld	a5,-24(s0)
    192a:	fef43023          	sd	a5,-32(s0)
    192e:	fe843783          	ld	a5,-24(s0)
    1932:	639c                	ld	a5,0(a5)
    1934:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    1938:	b791                	j	187c <malloc+0x76>
  }
}
    193a:	853e                	mv	a0,a5
    193c:	70e2                	ld	ra,56(sp)
    193e:	7442                	ld	s0,48(sp)
    1940:	6121                	addi	sp,sp,64
    1942:	8082                	ret

0000000000001944 <setjmp>:
    1944:	e100                	sd	s0,0(a0)
    1946:	e504                	sd	s1,8(a0)
    1948:	01253823          	sd	s2,16(a0)
    194c:	01353c23          	sd	s3,24(a0)
    1950:	03453023          	sd	s4,32(a0)
    1954:	03553423          	sd	s5,40(a0)
    1958:	03653823          	sd	s6,48(a0)
    195c:	03753c23          	sd	s7,56(a0)
    1960:	05853023          	sd	s8,64(a0)
    1964:	05953423          	sd	s9,72(a0)
    1968:	05a53823          	sd	s10,80(a0)
    196c:	05b53c23          	sd	s11,88(a0)
    1970:	06153023          	sd	ra,96(a0)
    1974:	06253423          	sd	sp,104(a0)
    1978:	4501                	li	a0,0
    197a:	8082                	ret

000000000000197c <longjmp>:
    197c:	6100                	ld	s0,0(a0)
    197e:	6504                	ld	s1,8(a0)
    1980:	01053903          	ld	s2,16(a0)
    1984:	01853983          	ld	s3,24(a0)
    1988:	02053a03          	ld	s4,32(a0)
    198c:	02853a83          	ld	s5,40(a0)
    1990:	03053b03          	ld	s6,48(a0)
    1994:	03853b83          	ld	s7,56(a0)
    1998:	04053c03          	ld	s8,64(a0)
    199c:	04853c83          	ld	s9,72(a0)
    19a0:	05053d03          	ld	s10,80(a0)
    19a4:	05853d83          	ld	s11,88(a0)
    19a8:	06053083          	ld	ra,96(a0)
    19ac:	06853103          	ld	sp,104(a0)
    19b0:	c199                	beqz	a1,19b6 <longjmp_1>
    19b2:	852e                	mv	a0,a1
    19b4:	8082                	ret

00000000000019b6 <longjmp_1>:
    19b6:	4505                	li	a0,1
    19b8:	8082                	ret

00000000000019ba <__check_deadline_miss>:

/* MP3 Part 2 - Real-Time Scheduling*/

#if defined(THREAD_SCHEDULER_EDF_CBS) || defined(THREAD_SCHEDULER_DM)
static struct thread *__check_deadline_miss(struct list_head *run_queue, int current_time)
{
    19ba:	7139                	addi	sp,sp,-64
    19bc:	fc22                	sd	s0,56(sp)
    19be:	0080                	addi	s0,sp,64
    19c0:	fca43423          	sd	a0,-56(s0)
    19c4:	87ae                	mv	a5,a1
    19c6:	fcf42223          	sw	a5,-60(s0)
    struct thread *th = NULL;
    19ca:	fe043423          	sd	zero,-24(s0)
    struct thread *thread_missing_deadline = NULL;
    19ce:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    19d2:	fc843783          	ld	a5,-56(s0)
    19d6:	639c                	ld	a5,0(a5)
    19d8:	fcf43c23          	sd	a5,-40(s0)
    19dc:	fd843783          	ld	a5,-40(s0)
    19e0:	fd878793          	addi	a5,a5,-40
    19e4:	fef43423          	sd	a5,-24(s0)
    19e8:	a881                	j	1a38 <__check_deadline_miss+0x7e>
        if (th->current_deadline <= current_time) {
    19ea:	fe843783          	ld	a5,-24(s0)
    19ee:	4fb8                	lw	a4,88(a5)
    19f0:	fc442783          	lw	a5,-60(s0)
    19f4:	2781                	sext.w	a5,a5
    19f6:	02e7c663          	blt	a5,a4,1a22 <__check_deadline_miss+0x68>
            if (thread_missing_deadline == NULL)
    19fa:	fe043783          	ld	a5,-32(s0)
    19fe:	e791                	bnez	a5,1a0a <__check_deadline_miss+0x50>
                thread_missing_deadline = th;
    1a00:	fe843783          	ld	a5,-24(s0)
    1a04:	fef43023          	sd	a5,-32(s0)
    1a08:	a829                	j	1a22 <__check_deadline_miss+0x68>
            else if (th->ID < thread_missing_deadline->ID)
    1a0a:	fe843783          	ld	a5,-24(s0)
    1a0e:	5fd8                	lw	a4,60(a5)
    1a10:	fe043783          	ld	a5,-32(s0)
    1a14:	5fdc                	lw	a5,60(a5)
    1a16:	00f75663          	bge	a4,a5,1a22 <__check_deadline_miss+0x68>
                thread_missing_deadline = th;
    1a1a:	fe843783          	ld	a5,-24(s0)
    1a1e:	fef43023          	sd	a5,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    1a22:	fe843783          	ld	a5,-24(s0)
    1a26:	779c                	ld	a5,40(a5)
    1a28:	fcf43823          	sd	a5,-48(s0)
    1a2c:	fd043783          	ld	a5,-48(s0)
    1a30:	fd878793          	addi	a5,a5,-40
    1a34:	fef43423          	sd	a5,-24(s0)
    1a38:	fe843783          	ld	a5,-24(s0)
    1a3c:	02878793          	addi	a5,a5,40
    1a40:	fc843703          	ld	a4,-56(s0)
    1a44:	faf713e3          	bne	a4,a5,19ea <__check_deadline_miss+0x30>
        }
    }
    return thread_missing_deadline;
    1a48:	fe043783          	ld	a5,-32(s0)
}
    1a4c:	853e                	mv	a0,a5
    1a4e:	7462                	ld	s0,56(sp)
    1a50:	6121                	addi	sp,sp,64
    1a52:	8082                	ret

0000000000001a54 <__dm_thread_cmp>:
#endif

#ifdef THREAD_SCHEDULER_DM
/* Deadline-Monotonic Scheduling */
static int __dm_thread_cmp(struct thread *a, struct thread *b)
{
    1a54:	1101                	addi	sp,sp,-32
    1a56:	ec22                	sd	s0,24(sp)
    1a58:	1000                	addi	s0,sp,32
    1a5a:	fea43423          	sd	a0,-24(s0)
    1a5e:	feb43023          	sd	a1,-32(s0)
    //To DO
    if (a -> deadline < b -> deadline)
    1a62:	fe843783          	ld	a5,-24(s0)
    1a66:	47b8                	lw	a4,72(a5)
    1a68:	fe043783          	ld	a5,-32(s0)
    1a6c:	47bc                	lw	a5,72(a5)
    1a6e:	00f75463          	bge	a4,a5,1a76 <__dm_thread_cmp+0x22>
        return 1;
    1a72:	4785                	li	a5,1
    1a74:	a035                	j	1aa0 <__dm_thread_cmp+0x4c>
    else if (a -> deadline > b -> deadline)
    1a76:	fe843783          	ld	a5,-24(s0)
    1a7a:	47b8                	lw	a4,72(a5)
    1a7c:	fe043783          	ld	a5,-32(s0)
    1a80:	47bc                	lw	a5,72(a5)
    1a82:	00e7d463          	bge	a5,a4,1a8a <__dm_thread_cmp+0x36>
        return 0;
    1a86:	4781                	li	a5,0
    1a88:	a821                	j	1aa0 <__dm_thread_cmp+0x4c>
    else if (a -> ID < b -> ID)
    1a8a:	fe843783          	ld	a5,-24(s0)
    1a8e:	5fd8                	lw	a4,60(a5)
    1a90:	fe043783          	ld	a5,-32(s0)
    1a94:	5fdc                	lw	a5,60(a5)
    1a96:	00f75463          	bge	a4,a5,1a9e <__dm_thread_cmp+0x4a>
        return 1;
    1a9a:	4785                	li	a5,1
    1a9c:	a011                	j	1aa0 <__dm_thread_cmp+0x4c>
    else 
        return 0;
    1a9e:	4781                	li	a5,0
}
    1aa0:	853e                	mv	a0,a5
    1aa2:	6462                	ld	s0,24(sp)
    1aa4:	6105                	addi	sp,sp,32
    1aa6:	8082                	ret

0000000000001aa8 <schedule_dm>:

struct threads_sched_result schedule_dm(struct threads_sched_args args)
{
    1aa8:	7171                	addi	sp,sp,-176
    1aaa:	f506                	sd	ra,168(sp)
    1aac:	f122                	sd	s0,160(sp)
    1aae:	ed26                	sd	s1,152(sp)
    1ab0:	e94a                	sd	s2,144(sp)
    1ab2:	e54e                	sd	s3,136(sp)
    1ab4:	1900                	addi	s0,sp,176
    1ab6:	84aa                	mv	s1,a0
    struct threads_sched_result r;

    // first check if there is any thread has missed its current deadline
    // TO DO
    struct thread *thread_dm = __check_deadline_miss(args.run_queue, args.current_time);
    1ab8:	649c                	ld	a5,8(s1)
    1aba:	4098                	lw	a4,0(s1)
    1abc:	85ba                	mv	a1,a4
    1abe:	853e                	mv	a0,a5
    1ac0:	00000097          	auipc	ra,0x0
    1ac4:	efa080e7          	jalr	-262(ra) # 19ba <__check_deadline_miss>
    1ac8:	fca43423          	sd	a0,-56(s0)
    if (thread_dm != NULL){
    1acc:	fc843783          	ld	a5,-56(s0)
    1ad0:	c395                	beqz	a5,1af4 <schedule_dm+0x4c>
        r.scheduled_thread_list_member = &thread_dm -> thread_list;
    1ad2:	fc843783          	ld	a5,-56(s0)
    1ad6:	02878793          	addi	a5,a5,40
    1ada:	f4f43823          	sd	a5,-176(s0)
        r.allocated_time = 0;
    1ade:	f4042c23          	sw	zero,-168(s0)
        return r;
    1ae2:	f5043783          	ld	a5,-176(s0)
    1ae6:	f6f43023          	sd	a5,-160(s0)
    1aea:	f5843783          	ld	a5,-168(s0)
    1aee:	f6f43423          	sd	a5,-152(s0)
    1af2:	aad9                	j	1cc8 <schedule_dm+0x220>
    }

    // handle the case where run queue is empty
    // TO DO
    struct thread *th = NULL;
    1af4:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list){
    1af8:	649c                	ld	a5,8(s1)
    1afa:	639c                	ld	a5,0(a5)
    1afc:	faf43423          	sd	a5,-88(s0)
    1b00:	fa843783          	ld	a5,-88(s0)
    1b04:	fd878793          	addi	a5,a5,-40
    1b08:	fcf43023          	sd	a5,-64(s0)
    1b0c:	a0a9                	j	1b56 <schedule_dm+0xae>
        if (thread_dm == NULL)
    1b0e:	fc843783          	ld	a5,-56(s0)
    1b12:	e791                	bnez	a5,1b1e <schedule_dm+0x76>
            thread_dm = th;
    1b14:	fc043783          	ld	a5,-64(s0)
    1b18:	fcf43423          	sd	a5,-56(s0)
    1b1c:	a015                	j	1b40 <schedule_dm+0x98>
        else if (__dm_thread_cmp(th, thread_dm) == 1)
    1b1e:	fc843583          	ld	a1,-56(s0)
    1b22:	fc043503          	ld	a0,-64(s0)
    1b26:	00000097          	auipc	ra,0x0
    1b2a:	f2e080e7          	jalr	-210(ra) # 1a54 <__dm_thread_cmp>
    1b2e:	87aa                	mv	a5,a0
    1b30:	873e                	mv	a4,a5
    1b32:	4785                	li	a5,1
    1b34:	00f71663          	bne	a4,a5,1b40 <schedule_dm+0x98>
            thread_dm = th;
    1b38:	fc043783          	ld	a5,-64(s0)
    1b3c:	fcf43423          	sd	a5,-56(s0)
    list_for_each_entry(th, args.run_queue, thread_list){
    1b40:	fc043783          	ld	a5,-64(s0)
    1b44:	779c                	ld	a5,40(a5)
    1b46:	f6f43823          	sd	a5,-144(s0)
    1b4a:	f7043783          	ld	a5,-144(s0)
    1b4e:	fd878793          	addi	a5,a5,-40
    1b52:	fcf43023          	sd	a5,-64(s0)
    1b56:	fc043783          	ld	a5,-64(s0)
    1b5a:	02878713          	addi	a4,a5,40
    1b5e:	649c                	ld	a5,8(s1)
    1b60:	faf717e3          	bne	a4,a5,1b0e <schedule_dm+0x66>
    }
    struct release_queue_entry *entry = NULL;
    1b64:	fa043c23          	sd	zero,-72(s0)
    if (thread_dm != NULL){
    1b68:	fc843783          	ld	a5,-56(s0)
    1b6c:	cfd5                	beqz	a5,1c28 <schedule_dm+0x180>
        int next_stop = thread_dm -> current_deadline - args.current_time;
    1b6e:	fc843783          	ld	a5,-56(s0)
    1b72:	4fb8                	lw	a4,88(a5)
    1b74:	409c                	lw	a5,0(s1)
    1b76:	40f707bb          	subw	a5,a4,a5
    1b7a:	faf42a23          	sw	a5,-76(s0)
        list_for_each_entry(entry, args.release_queue, thread_list){
    1b7e:	689c                	ld	a5,16(s1)
    1b80:	639c                	ld	a5,0(a5)
    1b82:	f8f43423          	sd	a5,-120(s0)
    1b86:	f8843783          	ld	a5,-120(s0)
    1b8a:	17e1                	addi	a5,a5,-8
    1b8c:	faf43c23          	sd	a5,-72(s0)
    1b90:	a8b1                	j	1bec <schedule_dm+0x144>
            if (__dm_thread_cmp(entry -> thrd, thread_dm) == 1){
    1b92:	fb843783          	ld	a5,-72(s0)
    1b96:	639c                	ld	a5,0(a5)
    1b98:	fc843583          	ld	a1,-56(s0)
    1b9c:	853e                	mv	a0,a5
    1b9e:	00000097          	auipc	ra,0x0
    1ba2:	eb6080e7          	jalr	-330(ra) # 1a54 <__dm_thread_cmp>
    1ba6:	87aa                	mv	a5,a0
    1ba8:	873e                	mv	a4,a5
    1baa:	4785                	li	a5,1
    1bac:	02f71663          	bne	a4,a5,1bd8 <schedule_dm+0x130>
                int next_th = entry -> release_time - args.current_time;
    1bb0:	fb843783          	ld	a5,-72(s0)
    1bb4:	4f98                	lw	a4,24(a5)
    1bb6:	409c                	lw	a5,0(s1)
    1bb8:	40f707bb          	subw	a5,a4,a5
    1bbc:	f8f42223          	sw	a5,-124(s0)
                if (next_th < next_stop)
    1bc0:	f8442703          	lw	a4,-124(s0)
    1bc4:	fb442783          	lw	a5,-76(s0)
    1bc8:	2701                	sext.w	a4,a4
    1bca:	2781                	sext.w	a5,a5
    1bcc:	00f75663          	bge	a4,a5,1bd8 <schedule_dm+0x130>
                    next_stop = next_th;
    1bd0:	f8442783          	lw	a5,-124(s0)
    1bd4:	faf42a23          	sw	a5,-76(s0)
        list_for_each_entry(entry, args.release_queue, thread_list){
    1bd8:	fb843783          	ld	a5,-72(s0)
    1bdc:	679c                	ld	a5,8(a5)
    1bde:	f6f43c23          	sd	a5,-136(s0)
    1be2:	f7843783          	ld	a5,-136(s0)
    1be6:	17e1                	addi	a5,a5,-8
    1be8:	faf43c23          	sd	a5,-72(s0)
    1bec:	fb843783          	ld	a5,-72(s0)
    1bf0:	00878713          	addi	a4,a5,8
    1bf4:	689c                	ld	a5,16(s1)
    1bf6:	f8f71ee3          	bne	a4,a5,1b92 <schedule_dm+0xea>
            }
        }
        r.scheduled_thread_list_member = &thread_dm -> thread_list;
    1bfa:	fc843783          	ld	a5,-56(s0)
    1bfe:	02878793          	addi	a5,a5,40
    1c02:	f4f43823          	sd	a5,-176(s0)
        r.allocated_time = thread_dm -> remaining_time < next_stop? thread_dm -> remaining_time:next_stop;
    1c06:	fc843783          	ld	a5,-56(s0)
    1c0a:	4bfc                	lw	a5,84(a5)
    1c0c:	863e                	mv	a2,a5
    1c0e:	fb442783          	lw	a5,-76(s0)
    1c12:	0007869b          	sext.w	a3,a5
    1c16:	0006071b          	sext.w	a4,a2
    1c1a:	00d75363          	bge	a4,a3,1c20 <schedule_dm+0x178>
    1c1e:	87b2                	mv	a5,a2
    1c20:	2781                	sext.w	a5,a5
    1c22:	f4f42c23          	sw	a5,-168(s0)
    1c26:	a849                	j	1cb8 <schedule_dm+0x210>
    }
    else {
        int next_stop = INT_MAX;
    1c28:	800007b7          	lui	a5,0x80000
    1c2c:	fff7c793          	not	a5,a5
    1c30:	faf42823          	sw	a5,-80(s0)
        r.scheduled_thread_list_member = args.run_queue;
    1c34:	649c                	ld	a5,8(s1)
    1c36:	f4f43823          	sd	a5,-176(s0)
        list_for_each_entry(entry, args.release_queue, thread_list){
    1c3a:	689c                	ld	a5,16(s1)
    1c3c:	639c                	ld	a5,0(a5)
    1c3e:	faf43023          	sd	a5,-96(s0)
    1c42:	fa043783          	ld	a5,-96(s0)
    1c46:	17e1                	addi	a5,a5,-8
    1c48:	faf43c23          	sd	a5,-72(s0)
    1c4c:	a83d                	j	1c8a <schedule_dm+0x1e2>
            int next_th = entry -> release_time - args.current_time;
    1c4e:	fb843783          	ld	a5,-72(s0)
    1c52:	4f98                	lw	a4,24(a5)
    1c54:	409c                	lw	a5,0(s1)
    1c56:	40f707bb          	subw	a5,a4,a5
    1c5a:	f8f42e23          	sw	a5,-100(s0)
            if (next_th < next_stop)
    1c5e:	f9c42703          	lw	a4,-100(s0)
    1c62:	fb042783          	lw	a5,-80(s0)
    1c66:	2701                	sext.w	a4,a4
    1c68:	2781                	sext.w	a5,a5
    1c6a:	00f75663          	bge	a4,a5,1c76 <schedule_dm+0x1ce>
                next_stop = next_th;
    1c6e:	f9c42783          	lw	a5,-100(s0)
    1c72:	faf42823          	sw	a5,-80(s0)
        list_for_each_entry(entry, args.release_queue, thread_list){
    1c76:	fb843783          	ld	a5,-72(s0)
    1c7a:	679c                	ld	a5,8(a5)
    1c7c:	f8f43823          	sd	a5,-112(s0)
    1c80:	f9043783          	ld	a5,-112(s0)
    1c84:	17e1                	addi	a5,a5,-8
    1c86:	faf43c23          	sd	a5,-72(s0)
    1c8a:	fb843783          	ld	a5,-72(s0)
    1c8e:	00878713          	addi	a4,a5,8 # ffffffff80000008 <__global_pointer$+0xffffffff7fffd998>
    1c92:	689c                	ld	a5,16(s1)
    1c94:	faf71de3          	bne	a4,a5,1c4e <schedule_dm+0x1a6>
        }
        
        r.allocated_time = (next_stop == INT_MAX)?1:next_stop;
    1c98:	fb042783          	lw	a5,-80(s0)
    1c9c:	0007871b          	sext.w	a4,a5
    1ca0:	800007b7          	lui	a5,0x80000
    1ca4:	fff7c793          	not	a5,a5
    1ca8:	00f70563          	beq	a4,a5,1cb2 <schedule_dm+0x20a>
    1cac:	fb042783          	lw	a5,-80(s0)
    1cb0:	a011                	j	1cb4 <schedule_dm+0x20c>
    1cb2:	4785                	li	a5,1
    1cb4:	f4f42c23          	sw	a5,-168(s0)
    }
    return r;
    1cb8:	f5043783          	ld	a5,-176(s0)
    1cbc:	f6f43023          	sd	a5,-160(s0)
    1cc0:	f5843783          	ld	a5,-168(s0)
    1cc4:	f6f43423          	sd	a5,-152(s0)
    1cc8:	4701                	li	a4,0
    1cca:	f6043703          	ld	a4,-160(s0)
    1cce:	4781                	li	a5,0
    1cd0:	f6843783          	ld	a5,-152(s0)
    1cd4:	893a                	mv	s2,a4
    1cd6:	89be                	mv	s3,a5
    1cd8:	874a                	mv	a4,s2
    1cda:	87ce                	mv	a5,s3
}
    1cdc:	853a                	mv	a0,a4
    1cde:	85be                	mv	a1,a5
    1ce0:	70aa                	ld	ra,168(sp)
    1ce2:	740a                	ld	s0,160(sp)
    1ce4:	64ea                	ld	s1,152(sp)
    1ce6:	694a                	ld	s2,144(sp)
    1ce8:	69aa                	ld	s3,136(sp)
    1cea:	614d                	addi	sp,sp,176
    1cec:	8082                	ret
