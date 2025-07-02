
user/_thtest:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <f>:
    } while (0)

static char buf[5]; // MAX 9999

void f(void *arg)
{
       0:	7179                	addi	sp,sp,-48
       2:	f406                	sd	ra,40(sp)
       4:	f022                	sd	s0,32(sp)
       6:	1800                	addi	s0,sp,48
       8:	fca43c23          	sd	a0,-40(s0)
    int id = (int)(uint64)arg;
       c:	fd843783          	ld	a5,-40(s0)
      10:	fef42623          	sw	a5,-20(s0)
    printf("thread #%d is running\n", id);
      14:	fec42783          	lw	a5,-20(s0)
      18:	85be                	mv	a1,a5
      1a:	00003517          	auipc	a0,0x3
      1e:	95650513          	addi	a0,a0,-1706 # 2970 <schedule_dm+0x246>
      22:	00001097          	auipc	ra,0x1
      26:	636080e7          	jalr	1590(ra) # 1658 <printf>
    while (1) {}
      2a:	a001                	j	2a <f+0x2a>

000000000000002c <hrrn_setup>:
}

void hrrn_setup(int tnum)
{
      2c:	7139                	addi	sp,sp,-64
      2e:	fc06                	sd	ra,56(sp)
      30:	f822                	sd	s0,48(sp)
      32:	0080                	addi	s0,sp,64
      34:	87aa                	mv	a5,a0
      36:	fcf42623          	sw	a5,-52(s0)
    int burst_time, arrival_time;
    struct thread *t;

    for (int i = 0; i < tnum; ++i) {
      3a:	fe042623          	sw	zero,-20(s0)
      3e:	aaa5                	j	1b6 <hrrn_setup+0x18a>
        printf("\nThe %d thread\n", i+1);
      40:	fec42783          	lw	a5,-20(s0)
      44:	2785                	addiw	a5,a5,1
      46:	2781                	sext.w	a5,a5
      48:	85be                	mv	a1,a5
      4a:	00003517          	auipc	a0,0x3
      4e:	93e50513          	addi	a0,a0,-1730 # 2988 <schedule_dm+0x25e>
      52:	00001097          	auipc	ra,0x1
      56:	606080e7          	jalr	1542(ra) # 1658 <printf>
        printf("burst time [1-64]: ");
      5a:	00003517          	auipc	a0,0x3
      5e:	93e50513          	addi	a0,a0,-1730 # 2998 <schedule_dm+0x26e>
      62:	00001097          	auipc	ra,0x1
      66:	5f6080e7          	jalr	1526(ra) # 1658 <printf>
        gets(buf, 5);
      6a:	4595                	li	a1,5
      6c:	00003517          	auipc	a0,0x3
      70:	db450513          	addi	a0,a0,-588 # 2e20 <buf>
      74:	00001097          	auipc	ra,0x1
      78:	d9e080e7          	jalr	-610(ra) # e12 <gets>
        burst_time = atoi(buf);
      7c:	00003517          	auipc	a0,0x3
      80:	da450513          	addi	a0,a0,-604 # 2e20 <buf>
      84:	00001097          	auipc	ra,0x1
      88:	e96080e7          	jalr	-362(ra) # f1a <atoi>
      8c:	87aa                	mv	a5,a0
      8e:	fef42423          	sw	a5,-24(s0)
        printf("\n");
      92:	00003517          	auipc	a0,0x3
      96:	91e50513          	addi	a0,a0,-1762 # 29b0 <schedule_dm+0x286>
      9a:	00001097          	auipc	ra,0x1
      9e:	5be080e7          	jalr	1470(ra) # 1658 <printf>
        if (burst_time <= 0 || burst_time > 64)
      a2:	fe842783          	lw	a5,-24(s0)
      a6:	2781                	sext.w	a5,a5
      a8:	00f05a63          	blez	a5,bc <hrrn_setup+0x90>
      ac:	fe842783          	lw	a5,-24(s0)
      b0:	0007871b          	sext.w	a4,a5
      b4:	04000793          	li	a5,64
      b8:	02e7d763          	bge	a5,a4,e6 <hrrn_setup+0xba>
            ERROR_EXIT(wrong burst time);
      bc:	00003517          	auipc	a0,0x3
      c0:	8fc50513          	addi	a0,a0,-1796 # 29b8 <schedule_dm+0x28e>
      c4:	00001097          	auipc	ra,0x1
      c8:	594080e7          	jalr	1428(ra) # 1658 <printf>
      cc:	00003517          	auipc	a0,0x3
      d0:	8e450513          	addi	a0,a0,-1820 # 29b0 <schedule_dm+0x286>
      d4:	00001097          	auipc	ra,0x1
      d8:	584080e7          	jalr	1412(ra) # 1658 <printf>
      dc:	4505                	li	a0,1
      de:	00001097          	auipc	ra,0x1
      e2:	034080e7          	jalr	52(ra) # 1112 <exit>

        printf("arrival time [0-100]: ");
      e6:	00003517          	auipc	a0,0x3
      ea:	8ea50513          	addi	a0,a0,-1814 # 29d0 <schedule_dm+0x2a6>
      ee:	00001097          	auipc	ra,0x1
      f2:	56a080e7          	jalr	1386(ra) # 1658 <printf>
        gets(buf, 5);
      f6:	4595                	li	a1,5
      f8:	00003517          	auipc	a0,0x3
      fc:	d2850513          	addi	a0,a0,-728 # 2e20 <buf>
     100:	00001097          	auipc	ra,0x1
     104:	d12080e7          	jalr	-750(ra) # e12 <gets>
        arrival_time = atoi(buf);
     108:	00003517          	auipc	a0,0x3
     10c:	d1850513          	addi	a0,a0,-744 # 2e20 <buf>
     110:	00001097          	auipc	ra,0x1
     114:	e0a080e7          	jalr	-502(ra) # f1a <atoi>
     118:	87aa                	mv	a5,a0
     11a:	fef42223          	sw	a5,-28(s0)
        printf("\n");
     11e:	00003517          	auipc	a0,0x3
     122:	89250513          	addi	a0,a0,-1902 # 29b0 <schedule_dm+0x286>
     126:	00001097          	auipc	ra,0x1
     12a:	532080e7          	jalr	1330(ra) # 1658 <printf>
        if (arrival_time < 0 || arrival_time > 100)
     12e:	fe442783          	lw	a5,-28(s0)
     132:	2781                	sext.w	a5,a5
     134:	0007ca63          	bltz	a5,148 <hrrn_setup+0x11c>
     138:	fe442783          	lw	a5,-28(s0)
     13c:	0007871b          	sext.w	a4,a5
     140:	06400793          	li	a5,100
     144:	02e7d763          	bge	a5,a4,172 <hrrn_setup+0x146>
            ERROR_EXIT(wrong arrival time);
     148:	00003517          	auipc	a0,0x3
     14c:	8a050513          	addi	a0,a0,-1888 # 29e8 <schedule_dm+0x2be>
     150:	00001097          	auipc	ra,0x1
     154:	508080e7          	jalr	1288(ra) # 1658 <printf>
     158:	00003517          	auipc	a0,0x3
     15c:	85850513          	addi	a0,a0,-1960 # 29b0 <schedule_dm+0x286>
     160:	00001097          	auipc	ra,0x1
     164:	4f8080e7          	jalr	1272(ra) # 1658 <printf>
     168:	4505                	li	a0,1
     16a:	00001097          	auipc	ra,0x1
     16e:	fa8080e7          	jalr	-88(ra) # 1112 <exit>

        t = thread_create(f, (void *)((uint64) (i+1)), 0, burst_time, -1, 1);
     172:	fec42783          	lw	a5,-20(s0)
     176:	2785                	addiw	a5,a5,1
     178:	2781                	sext.w	a5,a5
     17a:	85be                	mv	a1,a5
     17c:	fe842683          	lw	a3,-24(s0)
     180:	4785                	li	a5,1
     182:	577d                	li	a4,-1
     184:	4601                	li	a2,0
     186:	00000517          	auipc	a0,0x0
     18a:	e7a50513          	addi	a0,a0,-390 # 0 <f>
     18e:	00002097          	auipc	ra,0x2
     192:	982080e7          	jalr	-1662(ra) # 1b10 <thread_create>
     196:	fca43c23          	sd	a0,-40(s0)
        thread_add_at(t, arrival_time);
     19a:	fe442783          	lw	a5,-28(s0)
     19e:	85be                	mv	a1,a5
     1a0:	fd843503          	ld	a0,-40(s0)
     1a4:	00002097          	auipc	ra,0x2
     1a8:	afc080e7          	jalr	-1284(ra) # 1ca0 <thread_add_at>
    for (int i = 0; i < tnum; ++i) {
     1ac:	fec42783          	lw	a5,-20(s0)
     1b0:	2785                	addiw	a5,a5,1
     1b2:	fef42623          	sw	a5,-20(s0)
     1b6:	fec42703          	lw	a4,-20(s0)
     1ba:	fcc42783          	lw	a5,-52(s0)
     1be:	2701                	sext.w	a4,a4
     1c0:	2781                	sext.w	a5,a5
     1c2:	e6f74fe3          	blt	a4,a5,40 <hrrn_setup+0x14>
    }
}
     1c6:	0001                	nop
     1c8:	0001                	nop
     1ca:	70e2                	ld	ra,56(sp)
     1cc:	7442                	ld	s0,48(sp)
     1ce:	6121                	addi	sp,sp,64
     1d0:	8082                	ret

00000000000001d2 <prr_setup>:

void prr_setup(int tnum)
{
     1d2:	7139                	addi	sp,sp,-64
     1d4:	fc06                	sd	ra,56(sp)
     1d6:	f822                	sd	s0,48(sp)
     1d8:	0080                	addi	s0,sp,64
     1da:	87aa                	mv	a5,a0
     1dc:	fcf42623          	sw	a5,-52(s0)
    int burst_time, priority;
    struct thread *t;

    for (int i = 0; i < tnum; ++i) {
     1e0:	fe042623          	sw	zero,-20(s0)
     1e4:	a251                	j	368 <prr_setup+0x196>
        printf("\nThe %d thread\n", i+1);
     1e6:	fec42783          	lw	a5,-20(s0)
     1ea:	2785                	addiw	a5,a5,1
     1ec:	2781                	sext.w	a5,a5
     1ee:	85be                	mv	a1,a5
     1f0:	00002517          	auipc	a0,0x2
     1f4:	79850513          	addi	a0,a0,1944 # 2988 <schedule_dm+0x25e>
     1f8:	00001097          	auipc	ra,0x1
     1fc:	460080e7          	jalr	1120(ra) # 1658 <printf>
        printf("burst time [1-64]: ");
     200:	00002517          	auipc	a0,0x2
     204:	79850513          	addi	a0,a0,1944 # 2998 <schedule_dm+0x26e>
     208:	00001097          	auipc	ra,0x1
     20c:	450080e7          	jalr	1104(ra) # 1658 <printf>
        gets(buf, 5);
     210:	4595                	li	a1,5
     212:	00003517          	auipc	a0,0x3
     216:	c0e50513          	addi	a0,a0,-1010 # 2e20 <buf>
     21a:	00001097          	auipc	ra,0x1
     21e:	bf8080e7          	jalr	-1032(ra) # e12 <gets>
        burst_time = atoi(buf);
     222:	00003517          	auipc	a0,0x3
     226:	bfe50513          	addi	a0,a0,-1026 # 2e20 <buf>
     22a:	00001097          	auipc	ra,0x1
     22e:	cf0080e7          	jalr	-784(ra) # f1a <atoi>
     232:	87aa                	mv	a5,a0
     234:	fef42423          	sw	a5,-24(s0)
        printf("\n");
     238:	00002517          	auipc	a0,0x2
     23c:	77850513          	addi	a0,a0,1912 # 29b0 <schedule_dm+0x286>
     240:	00001097          	auipc	ra,0x1
     244:	418080e7          	jalr	1048(ra) # 1658 <printf>
        if (burst_time <= 0 || burst_time > 64)
     248:	fe842783          	lw	a5,-24(s0)
     24c:	2781                	sext.w	a5,a5
     24e:	00f05a63          	blez	a5,262 <prr_setup+0x90>
     252:	fe842783          	lw	a5,-24(s0)
     256:	0007871b          	sext.w	a4,a5
     25a:	04000793          	li	a5,64
     25e:	02e7d763          	bge	a5,a4,28c <prr_setup+0xba>
            ERROR_EXIT(wrong burst time);
     262:	00002517          	auipc	a0,0x2
     266:	75650513          	addi	a0,a0,1878 # 29b8 <schedule_dm+0x28e>
     26a:	00001097          	auipc	ra,0x1
     26e:	3ee080e7          	jalr	1006(ra) # 1658 <printf>
     272:	00002517          	auipc	a0,0x2
     276:	73e50513          	addi	a0,a0,1854 # 29b0 <schedule_dm+0x286>
     27a:	00001097          	auipc	ra,0x1
     27e:	3de080e7          	jalr	990(ra) # 1658 <printf>
     282:	4505                	li	a0,1
     284:	00001097          	auipc	ra,0x1
     288:	e8e080e7          	jalr	-370(ra) # 1112 <exit>

        printf("priority [0-4]: ");
     28c:	00002517          	auipc	a0,0x2
     290:	77450513          	addi	a0,a0,1908 # 2a00 <schedule_dm+0x2d6>
     294:	00001097          	auipc	ra,0x1
     298:	3c4080e7          	jalr	964(ra) # 1658 <printf>
        gets(buf, 5);
     29c:	4595                	li	a1,5
     29e:	00003517          	auipc	a0,0x3
     2a2:	b8250513          	addi	a0,a0,-1150 # 2e20 <buf>
     2a6:	00001097          	auipc	ra,0x1
     2aa:	b6c080e7          	jalr	-1172(ra) # e12 <gets>
        priority = atoi(buf);
     2ae:	00003517          	auipc	a0,0x3
     2b2:	b7250513          	addi	a0,a0,-1166 # 2e20 <buf>
     2b6:	00001097          	auipc	ra,0x1
     2ba:	c64080e7          	jalr	-924(ra) # f1a <atoi>
     2be:	87aa                	mv	a5,a0
     2c0:	fef42223          	sw	a5,-28(s0)
        printf("\n");
     2c4:	00002517          	auipc	a0,0x2
     2c8:	6ec50513          	addi	a0,a0,1772 # 29b0 <schedule_dm+0x286>
     2cc:	00001097          	auipc	ra,0x1
     2d0:	38c080e7          	jalr	908(ra) # 1658 <printf>
        if (priority < 0 || priority > 4)
     2d4:	fe442783          	lw	a5,-28(s0)
     2d8:	2781                	sext.w	a5,a5
     2da:	0007c963          	bltz	a5,2ec <prr_setup+0x11a>
     2de:	fe442783          	lw	a5,-28(s0)
     2e2:	0007871b          	sext.w	a4,a5
     2e6:	4791                	li	a5,4
     2e8:	02e7d763          	bge	a5,a4,316 <prr_setup+0x144>
            ERROR_EXIT(wrong priority value);
     2ec:	00002517          	auipc	a0,0x2
     2f0:	72c50513          	addi	a0,a0,1836 # 2a18 <schedule_dm+0x2ee>
     2f4:	00001097          	auipc	ra,0x1
     2f8:	364080e7          	jalr	868(ra) # 1658 <printf>
     2fc:	00002517          	auipc	a0,0x2
     300:	6b450513          	addi	a0,a0,1716 # 29b0 <schedule_dm+0x286>
     304:	00001097          	auipc	ra,0x1
     308:	354080e7          	jalr	852(ra) # 1658 <printf>
     30c:	4505                	li	a0,1
     30e:	00001097          	auipc	ra,0x1
     312:	e04080e7          	jalr	-508(ra) # 1112 <exit>

        t = thread_create(f, (void *)((uint64) (i+1)), 0, burst_time, -1, 1);
     316:	fec42783          	lw	a5,-20(s0)
     31a:	2785                	addiw	a5,a5,1
     31c:	2781                	sext.w	a5,a5
     31e:	85be                	mv	a1,a5
     320:	fe842683          	lw	a3,-24(s0)
     324:	4785                	li	a5,1
     326:	577d                	li	a4,-1
     328:	4601                	li	a2,0
     32a:	00000517          	auipc	a0,0x0
     32e:	cd650513          	addi	a0,a0,-810 # 0 <f>
     332:	00001097          	auipc	ra,0x1
     336:	7de080e7          	jalr	2014(ra) # 1b10 <thread_create>
     33a:	fca43c23          	sd	a0,-40(s0)
        thread_set_priority(t, priority);
     33e:	fe442783          	lw	a5,-28(s0)
     342:	85be                	mv	a1,a5
     344:	fd843503          	ld	a0,-40(s0)
     348:	00002097          	auipc	ra,0x2
     34c:	8e0080e7          	jalr	-1824(ra) # 1c28 <thread_set_priority>
        thread_add_at(t, 0);
     350:	4581                	li	a1,0
     352:	fd843503          	ld	a0,-40(s0)
     356:	00002097          	auipc	ra,0x2
     35a:	94a080e7          	jalr	-1718(ra) # 1ca0 <thread_add_at>
    for (int i = 0; i < tnum; ++i) {
     35e:	fec42783          	lw	a5,-20(s0)
     362:	2785                	addiw	a5,a5,1
     364:	fef42623          	sw	a5,-20(s0)
     368:	fec42703          	lw	a4,-20(s0)
     36c:	fcc42783          	lw	a5,-52(s0)
     370:	2701                	sext.w	a4,a4
     372:	2781                	sext.w	a5,a5
     374:	e6f749e3          	blt	a4,a5,1e6 <prr_setup+0x14>
    }
}
     378:	0001                	nop
     37a:	0001                	nop
     37c:	70e2                	ld	ra,56(sp)
     37e:	7442                	ld	s0,48(sp)
     380:	6121                	addi	sp,sp,64
     382:	8082                	ret

0000000000000384 <dm_setup>:

void dm_setup(int tnum)
{
     384:	7139                	addi	sp,sp,-64
     386:	fc06                	sd	ra,56(sp)
     388:	f822                	sd	s0,48(sp)
     38a:	0080                	addi	s0,sp,64
     38c:	87aa                	mv	a5,a0
     38e:	fcf42623          	sw	a5,-52(s0)
    int burst_time, period, repeat_times, arrival_time;
    struct thread *t;

    for (int i = 0; i < tnum; ++i) {
     392:	fe042623          	sw	zero,-20(s0)
     396:	a479                	j	624 <dm_setup+0x2a0>
        printf("\nThe %d thread\n", i+1);
     398:	fec42783          	lw	a5,-20(s0)
     39c:	2785                	addiw	a5,a5,1
     39e:	2781                	sext.w	a5,a5
     3a0:	85be                	mv	a1,a5
     3a2:	00002517          	auipc	a0,0x2
     3a6:	5e650513          	addi	a0,a0,1510 # 2988 <schedule_dm+0x25e>
     3aa:	00001097          	auipc	ra,0x1
     3ae:	2ae080e7          	jalr	686(ra) # 1658 <printf>
        printf("period [1-100]: ");
     3b2:	00002517          	auipc	a0,0x2
     3b6:	67e50513          	addi	a0,a0,1662 # 2a30 <schedule_dm+0x306>
     3ba:	00001097          	auipc	ra,0x1
     3be:	29e080e7          	jalr	670(ra) # 1658 <printf>
        gets(buf, 5);
     3c2:	4595                	li	a1,5
     3c4:	00003517          	auipc	a0,0x3
     3c8:	a5c50513          	addi	a0,a0,-1444 # 2e20 <buf>
     3cc:	00001097          	auipc	ra,0x1
     3d0:	a46080e7          	jalr	-1466(ra) # e12 <gets>
        period = atoi(buf);
     3d4:	00003517          	auipc	a0,0x3
     3d8:	a4c50513          	addi	a0,a0,-1460 # 2e20 <buf>
     3dc:	00001097          	auipc	ra,0x1
     3e0:	b3e080e7          	jalr	-1218(ra) # f1a <atoi>
     3e4:	87aa                	mv	a5,a0
     3e6:	fef42423          	sw	a5,-24(s0)
        printf("\n");
     3ea:	00002517          	auipc	a0,0x2
     3ee:	5c650513          	addi	a0,a0,1478 # 29b0 <schedule_dm+0x286>
     3f2:	00001097          	auipc	ra,0x1
     3f6:	266080e7          	jalr	614(ra) # 1658 <printf>
        if (prr_setup <= 0 || period > 100)
     3fa:	fe842783          	lw	a5,-24(s0)
     3fe:	0007871b          	sext.w	a4,a5
     402:	06400793          	li	a5,100
     406:	02e7d763          	bge	a5,a4,434 <dm_setup+0xb0>
            ERROR_EXIT(wrong period);
     40a:	00002517          	auipc	a0,0x2
     40e:	63e50513          	addi	a0,a0,1598 # 2a48 <schedule_dm+0x31e>
     412:	00001097          	auipc	ra,0x1
     416:	246080e7          	jalr	582(ra) # 1658 <printf>
     41a:	00002517          	auipc	a0,0x2
     41e:	59650513          	addi	a0,a0,1430 # 29b0 <schedule_dm+0x286>
     422:	00001097          	auipc	ra,0x1
     426:	236080e7          	jalr	566(ra) # 1658 <printf>
     42a:	4505                	li	a0,1
     42c:	00001097          	auipc	ra,0x1
     430:	ce6080e7          	jalr	-794(ra) # 1112 <exit>

        printf("burst time [1-%d]: ", period);
     434:	fe842783          	lw	a5,-24(s0)
     438:	85be                	mv	a1,a5
     43a:	00002517          	auipc	a0,0x2
     43e:	61e50513          	addi	a0,a0,1566 # 2a58 <schedule_dm+0x32e>
     442:	00001097          	auipc	ra,0x1
     446:	216080e7          	jalr	534(ra) # 1658 <printf>
        gets(buf, 5);
     44a:	4595                	li	a1,5
     44c:	00003517          	auipc	a0,0x3
     450:	9d450513          	addi	a0,a0,-1580 # 2e20 <buf>
     454:	00001097          	auipc	ra,0x1
     458:	9be080e7          	jalr	-1602(ra) # e12 <gets>
        burst_time = atoi(buf);
     45c:	00003517          	auipc	a0,0x3
     460:	9c450513          	addi	a0,a0,-1596 # 2e20 <buf>
     464:	00001097          	auipc	ra,0x1
     468:	ab6080e7          	jalr	-1354(ra) # f1a <atoi>
     46c:	87aa                	mv	a5,a0
     46e:	fef42223          	sw	a5,-28(s0)
        printf("\n");
     472:	00002517          	auipc	a0,0x2
     476:	53e50513          	addi	a0,a0,1342 # 29b0 <schedule_dm+0x286>
     47a:	00001097          	auipc	ra,0x1
     47e:	1de080e7          	jalr	478(ra) # 1658 <printf>
        if (burst_time <= 0 || burst_time > period)
     482:	fe442783          	lw	a5,-28(s0)
     486:	2781                	sext.w	a5,a5
     488:	00f05a63          	blez	a5,49c <dm_setup+0x118>
     48c:	fe442703          	lw	a4,-28(s0)
     490:	fe842783          	lw	a5,-24(s0)
     494:	2701                	sext.w	a4,a4
     496:	2781                	sext.w	a5,a5
     498:	02e7d763          	bge	a5,a4,4c6 <dm_setup+0x142>
            ERROR_EXIT(wrong burst time);
     49c:	00002517          	auipc	a0,0x2
     4a0:	51c50513          	addi	a0,a0,1308 # 29b8 <schedule_dm+0x28e>
     4a4:	00001097          	auipc	ra,0x1
     4a8:	1b4080e7          	jalr	436(ra) # 1658 <printf>
     4ac:	00002517          	auipc	a0,0x2
     4b0:	50450513          	addi	a0,a0,1284 # 29b0 <schedule_dm+0x286>
     4b4:	00001097          	auipc	ra,0x1
     4b8:	1a4080e7          	jalr	420(ra) # 1658 <printf>
     4bc:	4505                	li	a0,1
     4be:	00001097          	auipc	ra,0x1
     4c2:	c54080e7          	jalr	-940(ra) # 1112 <exit>

        printf("n [1-10]: ");
     4c6:	00002517          	auipc	a0,0x2
     4ca:	5aa50513          	addi	a0,a0,1450 # 2a70 <schedule_dm+0x346>
     4ce:	00001097          	auipc	ra,0x1
     4d2:	18a080e7          	jalr	394(ra) # 1658 <printf>
        gets(buf, 5);
     4d6:	4595                	li	a1,5
     4d8:	00003517          	auipc	a0,0x3
     4dc:	94850513          	addi	a0,a0,-1720 # 2e20 <buf>
     4e0:	00001097          	auipc	ra,0x1
     4e4:	932080e7          	jalr	-1742(ra) # e12 <gets>
        repeat_times = atoi(buf);
     4e8:	00003517          	auipc	a0,0x3
     4ec:	93850513          	addi	a0,a0,-1736 # 2e20 <buf>
     4f0:	00001097          	auipc	ra,0x1
     4f4:	a2a080e7          	jalr	-1494(ra) # f1a <atoi>
     4f8:	87aa                	mv	a5,a0
     4fa:	fef42023          	sw	a5,-32(s0)
        printf("\n");
     4fe:	00002517          	auipc	a0,0x2
     502:	4b250513          	addi	a0,a0,1202 # 29b0 <schedule_dm+0x286>
     506:	00001097          	auipc	ra,0x1
     50a:	152080e7          	jalr	338(ra) # 1658 <printf>
        if (repeat_times <= 0 || repeat_times > 10)
     50e:	fe042783          	lw	a5,-32(s0)
     512:	2781                	sext.w	a5,a5
     514:	00f05963          	blez	a5,526 <dm_setup+0x1a2>
     518:	fe042783          	lw	a5,-32(s0)
     51c:	0007871b          	sext.w	a4,a5
     520:	47a9                	li	a5,10
     522:	02e7d763          	bge	a5,a4,550 <dm_setup+0x1cc>
            ERROR_EXIT(wrong n);
     526:	00002517          	auipc	a0,0x2
     52a:	55a50513          	addi	a0,a0,1370 # 2a80 <schedule_dm+0x356>
     52e:	00001097          	auipc	ra,0x1
     532:	12a080e7          	jalr	298(ra) # 1658 <printf>
     536:	00002517          	auipc	a0,0x2
     53a:	47a50513          	addi	a0,a0,1146 # 29b0 <schedule_dm+0x286>
     53e:	00001097          	auipc	ra,0x1
     542:	11a080e7          	jalr	282(ra) # 1658 <printf>
     546:	4505                	li	a0,1
     548:	00001097          	auipc	ra,0x1
     54c:	bca080e7          	jalr	-1078(ra) # 1112 <exit>
        
        printf("arrival time [0-100]: ");
     550:	00002517          	auipc	a0,0x2
     554:	48050513          	addi	a0,a0,1152 # 29d0 <schedule_dm+0x2a6>
     558:	00001097          	auipc	ra,0x1
     55c:	100080e7          	jalr	256(ra) # 1658 <printf>
        gets(buf, 5);
     560:	4595                	li	a1,5
     562:	00003517          	auipc	a0,0x3
     566:	8be50513          	addi	a0,a0,-1858 # 2e20 <buf>
     56a:	00001097          	auipc	ra,0x1
     56e:	8a8080e7          	jalr	-1880(ra) # e12 <gets>
        arrival_time = atoi(buf);
     572:	00003517          	auipc	a0,0x3
     576:	8ae50513          	addi	a0,a0,-1874 # 2e20 <buf>
     57a:	00001097          	auipc	ra,0x1
     57e:	9a0080e7          	jalr	-1632(ra) # f1a <atoi>
     582:	87aa                	mv	a5,a0
     584:	fcf42e23          	sw	a5,-36(s0)
        printf("\n");
     588:	00002517          	auipc	a0,0x2
     58c:	42850513          	addi	a0,a0,1064 # 29b0 <schedule_dm+0x286>
     590:	00001097          	auipc	ra,0x1
     594:	0c8080e7          	jalr	200(ra) # 1658 <printf>
        if (arrival_time < 0 || arrival_time > 100)
     598:	fdc42783          	lw	a5,-36(s0)
     59c:	2781                	sext.w	a5,a5
     59e:	0007ca63          	bltz	a5,5b2 <dm_setup+0x22e>
     5a2:	fdc42783          	lw	a5,-36(s0)
     5a6:	0007871b          	sext.w	a4,a5
     5aa:	06400793          	li	a5,100
     5ae:	02e7d763          	bge	a5,a4,5dc <dm_setup+0x258>
            ERROR_EXIT(wrong arrival time);
     5b2:	00002517          	auipc	a0,0x2
     5b6:	43650513          	addi	a0,a0,1078 # 29e8 <schedule_dm+0x2be>
     5ba:	00001097          	auipc	ra,0x1
     5be:	09e080e7          	jalr	158(ra) # 1658 <printf>
     5c2:	00002517          	auipc	a0,0x2
     5c6:	3ee50513          	addi	a0,a0,1006 # 29b0 <schedule_dm+0x286>
     5ca:	00001097          	auipc	ra,0x1
     5ce:	08e080e7          	jalr	142(ra) # 1658 <printf>
     5d2:	4505                	li	a0,1
     5d4:	00001097          	auipc	ra,0x1
     5d8:	b3e080e7          	jalr	-1218(ra) # 1112 <exit>

        t = thread_create(f, (void *)((uint64) (i+1)), 1, burst_time, period, repeat_times);
     5dc:	fec42783          	lw	a5,-20(s0)
     5e0:	2785                	addiw	a5,a5,1
     5e2:	2781                	sext.w	a5,a5
     5e4:	85be                	mv	a1,a5
     5e6:	fe042783          	lw	a5,-32(s0)
     5ea:	fe842703          	lw	a4,-24(s0)
     5ee:	fe442683          	lw	a3,-28(s0)
     5f2:	4605                	li	a2,1
     5f4:	00000517          	auipc	a0,0x0
     5f8:	a0c50513          	addi	a0,a0,-1524 # 0 <f>
     5fc:	00001097          	auipc	ra,0x1
     600:	514080e7          	jalr	1300(ra) # 1b10 <thread_create>
     604:	fca43823          	sd	a0,-48(s0)
        thread_add_at(t, arrival_time);
     608:	fdc42783          	lw	a5,-36(s0)
     60c:	85be                	mv	a1,a5
     60e:	fd043503          	ld	a0,-48(s0)
     612:	00001097          	auipc	ra,0x1
     616:	68e080e7          	jalr	1678(ra) # 1ca0 <thread_add_at>
    for (int i = 0; i < tnum; ++i) {
     61a:	fec42783          	lw	a5,-20(s0)
     61e:	2785                	addiw	a5,a5,1
     620:	fef42623          	sw	a5,-20(s0)
     624:	fec42703          	lw	a4,-20(s0)
     628:	fcc42783          	lw	a5,-52(s0)
     62c:	2701                	sext.w	a4,a4
     62e:	2781                	sext.w	a5,a5
     630:	d6f744e3          	blt	a4,a5,398 <dm_setup+0x14>
    }
}
     634:	0001                	nop
     636:	0001                	nop
     638:	70e2                	ld	ra,56(sp)
     63a:	7442                	ld	s0,48(sp)
     63c:	6121                	addi	sp,sp,64
     63e:	8082                	ret

0000000000000640 <edf_cbs_setup>:

void edf_cbs_setup(int tnum)
{
     640:	715d                	addi	sp,sp,-80
     642:	e486                	sd	ra,72(sp)
     644:	e0a2                	sd	s0,64(sp)
     646:	0880                	addi	s0,sp,80
     648:	87aa                	mv	a5,a0
     64a:	faf42e23          	sw	a5,-68(s0)
    int burst_time, period, repeat_times, arrival_time;
    int budget, is_hard, turn_soft = 0;
     64e:	fe042623          	sw	zero,-20(s0)
    struct thread *t;
    if (tnum > 5) {
     652:	fbc42783          	lw	a5,-68(s0)
     656:	0007871b          	sext.w	a4,a5
     65a:	4795                	li	a5,5
     65c:	02e7d563          	bge	a5,a4,686 <edf_cbs_setup+0x46>
        printf("According to spec, the thread num is at most 5\n");
     660:	00002517          	auipc	a0,0x2
     664:	42850513          	addi	a0,a0,1064 # 2a88 <schedule_dm+0x35e>
     668:	00001097          	auipc	ra,0x1
     66c:	ff0080e7          	jalr	-16(ra) # 1658 <printf>
        printf("Now, the thread num is %d\n", tnum);
     670:	fbc42783          	lw	a5,-68(s0)
     674:	85be                	mv	a1,a5
     676:	00002517          	auipc	a0,0x2
     67a:	44250513          	addi	a0,a0,1090 # 2ab8 <schedule_dm+0x38e>
     67e:	00001097          	auipc	ra,0x1
     682:	fda080e7          	jalr	-38(ra) # 1658 <printf>
    }
    for (int i = 0; i < tnum; ++i) {
     686:	fe042423          	sw	zero,-24(s0)
     68a:	aeed                	j	a84 <edf_cbs_setup+0x444>
        printf("\nThe %d thread\n", i+1);
     68c:	fe842783          	lw	a5,-24(s0)
     690:	2785                	addiw	a5,a5,1
     692:	2781                	sext.w	a5,a5
     694:	85be                	mv	a1,a5
     696:	00002517          	auipc	a0,0x2
     69a:	2f250513          	addi	a0,a0,754 # 2988 <schedule_dm+0x25e>
     69e:	00001097          	auipc	ra,0x1
     6a2:	fba080e7          	jalr	-70(ra) # 1658 <printf>
        if (turn_soft) {
     6a6:	fec42783          	lw	a5,-20(s0)
     6aa:	2781                	sext.w	a5,a5
     6ac:	cb89                	beqz	a5,6be <edf_cbs_setup+0x7e>
            printf("According to spec, this thread shoud be soft rt\n");
     6ae:	00002517          	auipc	a0,0x2
     6b2:	42a50513          	addi	a0,a0,1066 # 2ad8 <schedule_dm+0x3ae>
     6b6:	00001097          	auipc	ra,0x1
     6ba:	fa2080e7          	jalr	-94(ra) # 1658 <printf>
        }
        printf("hard real time [0/1]: ");
     6be:	00002517          	auipc	a0,0x2
     6c2:	45250513          	addi	a0,a0,1106 # 2b10 <schedule_dm+0x3e6>
     6c6:	00001097          	auipc	ra,0x1
     6ca:	f92080e7          	jalr	-110(ra) # 1658 <printf>
        gets(buf, 5);
     6ce:	4595                	li	a1,5
     6d0:	00002517          	auipc	a0,0x2
     6d4:	75050513          	addi	a0,a0,1872 # 2e20 <buf>
     6d8:	00000097          	auipc	ra,0x0
     6dc:	73a080e7          	jalr	1850(ra) # e12 <gets>
        is_hard = atoi(buf);
     6e0:	00002517          	auipc	a0,0x2
     6e4:	74050513          	addi	a0,a0,1856 # 2e20 <buf>
     6e8:	00001097          	auipc	ra,0x1
     6ec:	832080e7          	jalr	-1998(ra) # f1a <atoi>
     6f0:	87aa                	mv	a5,a0
     6f2:	fef42223          	sw	a5,-28(s0)
        printf("\n");
     6f6:	00002517          	auipc	a0,0x2
     6fa:	2ba50513          	addi	a0,a0,698 # 29b0 <schedule_dm+0x286>
     6fe:	00001097          	auipc	ra,0x1
     702:	f5a080e7          	jalr	-166(ra) # 1658 <printf>
        if (is_hard != 0 && is_hard != 1)
     706:	fe442783          	lw	a5,-28(s0)
     70a:	2781                	sext.w	a5,a5
     70c:	cf8d                	beqz	a5,746 <edf_cbs_setup+0x106>
     70e:	fe442783          	lw	a5,-28(s0)
     712:	0007871b          	sext.w	a4,a5
     716:	4785                	li	a5,1
     718:	02f70763          	beq	a4,a5,746 <edf_cbs_setup+0x106>
            ERROR_EXIT(wrong RT type);
     71c:	00002517          	auipc	a0,0x2
     720:	40c50513          	addi	a0,a0,1036 # 2b28 <schedule_dm+0x3fe>
     724:	00001097          	auipc	ra,0x1
     728:	f34080e7          	jalr	-204(ra) # 1658 <printf>
     72c:	00002517          	auipc	a0,0x2
     730:	28450513          	addi	a0,a0,644 # 29b0 <schedule_dm+0x286>
     734:	00001097          	auipc	ra,0x1
     738:	f24080e7          	jalr	-220(ra) # 1658 <printf>
     73c:	4505                	li	a0,1
     73e:	00001097          	auipc	ra,0x1
     742:	9d4080e7          	jalr	-1580(ra) # 1112 <exit>
        if (!turn_soft && !is_hard)
     746:	fec42783          	lw	a5,-20(s0)
     74a:	2781                	sext.w	a5,a5
     74c:	eb81                	bnez	a5,75c <edf_cbs_setup+0x11c>
     74e:	fe442783          	lw	a5,-28(s0)
     752:	2781                	sext.w	a5,a5
     754:	e781                	bnez	a5,75c <edf_cbs_setup+0x11c>
            turn_soft = 1;
     756:	4785                	li	a5,1
     758:	fef42623          	sw	a5,-20(s0)

        printf("period [1-100]: ");
     75c:	00002517          	auipc	a0,0x2
     760:	2d450513          	addi	a0,a0,724 # 2a30 <schedule_dm+0x306>
     764:	00001097          	auipc	ra,0x1
     768:	ef4080e7          	jalr	-268(ra) # 1658 <printf>
        gets(buf, 5);
     76c:	4595                	li	a1,5
     76e:	00002517          	auipc	a0,0x2
     772:	6b250513          	addi	a0,a0,1714 # 2e20 <buf>
     776:	00000097          	auipc	ra,0x0
     77a:	69c080e7          	jalr	1692(ra) # e12 <gets>
        period = atoi(buf);
     77e:	00002517          	auipc	a0,0x2
     782:	6a250513          	addi	a0,a0,1698 # 2e20 <buf>
     786:	00000097          	auipc	ra,0x0
     78a:	794080e7          	jalr	1940(ra) # f1a <atoi>
     78e:	87aa                	mv	a5,a0
     790:	fef42023          	sw	a5,-32(s0)
        printf("\n");
     794:	00002517          	auipc	a0,0x2
     798:	21c50513          	addi	a0,a0,540 # 29b0 <schedule_dm+0x286>
     79c:	00001097          	auipc	ra,0x1
     7a0:	ebc080e7          	jalr	-324(ra) # 1658 <printf>
        if (prr_setup <= 0 || period > 100)
     7a4:	fe042783          	lw	a5,-32(s0)
     7a8:	0007871b          	sext.w	a4,a5
     7ac:	06400793          	li	a5,100
     7b0:	02e7d763          	bge	a5,a4,7de <edf_cbs_setup+0x19e>
            ERROR_EXIT(wrong period);
     7b4:	00002517          	auipc	a0,0x2
     7b8:	29450513          	addi	a0,a0,660 # 2a48 <schedule_dm+0x31e>
     7bc:	00001097          	auipc	ra,0x1
     7c0:	e9c080e7          	jalr	-356(ra) # 1658 <printf>
     7c4:	00002517          	auipc	a0,0x2
     7c8:	1ec50513          	addi	a0,a0,492 # 29b0 <schedule_dm+0x286>
     7cc:	00001097          	auipc	ra,0x1
     7d0:	e8c080e7          	jalr	-372(ra) # 1658 <printf>
     7d4:	4505                	li	a0,1
     7d6:	00001097          	auipc	ra,0x1
     7da:	93c080e7          	jalr	-1732(ra) # 1112 <exit>

        printf("burst time [1-%d]: ", period);
     7de:	fe042783          	lw	a5,-32(s0)
     7e2:	85be                	mv	a1,a5
     7e4:	00002517          	auipc	a0,0x2
     7e8:	27450513          	addi	a0,a0,628 # 2a58 <schedule_dm+0x32e>
     7ec:	00001097          	auipc	ra,0x1
     7f0:	e6c080e7          	jalr	-404(ra) # 1658 <printf>
        gets(buf, 5);
     7f4:	4595                	li	a1,5
     7f6:	00002517          	auipc	a0,0x2
     7fa:	62a50513          	addi	a0,a0,1578 # 2e20 <buf>
     7fe:	00000097          	auipc	ra,0x0
     802:	614080e7          	jalr	1556(ra) # e12 <gets>
        burst_time = atoi(buf);
     806:	00002517          	auipc	a0,0x2
     80a:	61a50513          	addi	a0,a0,1562 # 2e20 <buf>
     80e:	00000097          	auipc	ra,0x0
     812:	70c080e7          	jalr	1804(ra) # f1a <atoi>
     816:	87aa                	mv	a5,a0
     818:	fcf42e23          	sw	a5,-36(s0)
        printf("\n");
     81c:	00002517          	auipc	a0,0x2
     820:	19450513          	addi	a0,a0,404 # 29b0 <schedule_dm+0x286>
     824:	00001097          	auipc	ra,0x1
     828:	e34080e7          	jalr	-460(ra) # 1658 <printf>
        if (burst_time <= 0 || burst_time > period)
     82c:	fdc42783          	lw	a5,-36(s0)
     830:	2781                	sext.w	a5,a5
     832:	00f05a63          	blez	a5,846 <edf_cbs_setup+0x206>
     836:	fdc42703          	lw	a4,-36(s0)
     83a:	fe042783          	lw	a5,-32(s0)
     83e:	2701                	sext.w	a4,a4
     840:	2781                	sext.w	a5,a5
     842:	02e7d763          	bge	a5,a4,870 <edf_cbs_setup+0x230>
            ERROR_EXIT(wrong burst time);
     846:	00002517          	auipc	a0,0x2
     84a:	17250513          	addi	a0,a0,370 # 29b8 <schedule_dm+0x28e>
     84e:	00001097          	auipc	ra,0x1
     852:	e0a080e7          	jalr	-502(ra) # 1658 <printf>
     856:	00002517          	auipc	a0,0x2
     85a:	15a50513          	addi	a0,a0,346 # 29b0 <schedule_dm+0x286>
     85e:	00001097          	auipc	ra,0x1
     862:	dfa080e7          	jalr	-518(ra) # 1658 <printf>
     866:	4505                	li	a0,1
     868:	00001097          	auipc	ra,0x1
     86c:	8aa080e7          	jalr	-1878(ra) # 1112 <exit>
    
        printf("cbs budget [%d-9999]: ", burst_time/2 + 1);
     870:	fdc42783          	lw	a5,-36(s0)
     874:	01f7d71b          	srliw	a4,a5,0x1f
     878:	9fb9                	addw	a5,a5,a4
     87a:	4017d79b          	sraiw	a5,a5,0x1
     87e:	2781                	sext.w	a5,a5
     880:	2785                	addiw	a5,a5,1
     882:	2781                	sext.w	a5,a5
     884:	85be                	mv	a1,a5
     886:	00002517          	auipc	a0,0x2
     88a:	2b250513          	addi	a0,a0,690 # 2b38 <schedule_dm+0x40e>
     88e:	00001097          	auipc	ra,0x1
     892:	dca080e7          	jalr	-566(ra) # 1658 <printf>
        gets(buf, 5);
     896:	4595                	li	a1,5
     898:	00002517          	auipc	a0,0x2
     89c:	58850513          	addi	a0,a0,1416 # 2e20 <buf>
     8a0:	00000097          	auipc	ra,0x0
     8a4:	572080e7          	jalr	1394(ra) # e12 <gets>
        budget = atoi(buf);
     8a8:	00002517          	auipc	a0,0x2
     8ac:	57850513          	addi	a0,a0,1400 # 2e20 <buf>
     8b0:	00000097          	auipc	ra,0x0
     8b4:	66a080e7          	jalr	1642(ra) # f1a <atoi>
     8b8:	87aa                	mv	a5,a0
     8ba:	fcf42c23          	sw	a5,-40(s0)
        printf("\n");
     8be:	00002517          	auipc	a0,0x2
     8c2:	0f250513          	addi	a0,a0,242 # 29b0 <schedule_dm+0x286>
     8c6:	00001097          	auipc	ra,0x1
     8ca:	d92080e7          	jalr	-622(ra) # 1658 <printf>
        if (2 * budget <= burst_time)
     8ce:	fd842783          	lw	a5,-40(s0)
     8d2:	0017979b          	slliw	a5,a5,0x1
     8d6:	0007871b          	sext.w	a4,a5
     8da:	fdc42783          	lw	a5,-36(s0)
     8de:	2781                	sext.w	a5,a5
     8e0:	02e7c763          	blt	a5,a4,90e <edf_cbs_setup+0x2ce>
            ERROR_EXIT(wrong cbs budget);
     8e4:	00002517          	auipc	a0,0x2
     8e8:	26c50513          	addi	a0,a0,620 # 2b50 <schedule_dm+0x426>
     8ec:	00001097          	auipc	ra,0x1
     8f0:	d6c080e7          	jalr	-660(ra) # 1658 <printf>
     8f4:	00002517          	auipc	a0,0x2
     8f8:	0bc50513          	addi	a0,a0,188 # 29b0 <schedule_dm+0x286>
     8fc:	00001097          	auipc	ra,0x1
     900:	d5c080e7          	jalr	-676(ra) # 1658 <printf>
     904:	4505                	li	a0,1
     906:	00001097          	auipc	ra,0x1
     90a:	80c080e7          	jalr	-2036(ra) # 1112 <exit>

        printf("n [1-5]: ");
     90e:	00002517          	auipc	a0,0x2
     912:	25a50513          	addi	a0,a0,602 # 2b68 <schedule_dm+0x43e>
     916:	00001097          	auipc	ra,0x1
     91a:	d42080e7          	jalr	-702(ra) # 1658 <printf>
        gets(buf, 5);
     91e:	4595                	li	a1,5
     920:	00002517          	auipc	a0,0x2
     924:	50050513          	addi	a0,a0,1280 # 2e20 <buf>
     928:	00000097          	auipc	ra,0x0
     92c:	4ea080e7          	jalr	1258(ra) # e12 <gets>
        repeat_times = atoi(buf);
     930:	00002517          	auipc	a0,0x2
     934:	4f050513          	addi	a0,a0,1264 # 2e20 <buf>
     938:	00000097          	auipc	ra,0x0
     93c:	5e2080e7          	jalr	1506(ra) # f1a <atoi>
     940:	87aa                	mv	a5,a0
     942:	fcf42a23          	sw	a5,-44(s0)
        printf("\n");
     946:	00002517          	auipc	a0,0x2
     94a:	06a50513          	addi	a0,a0,106 # 29b0 <schedule_dm+0x286>
     94e:	00001097          	auipc	ra,0x1
     952:	d0a080e7          	jalr	-758(ra) # 1658 <printf>
        if (repeat_times <= 0 || repeat_times > 5)
     956:	fd442783          	lw	a5,-44(s0)
     95a:	2781                	sext.w	a5,a5
     95c:	00f05963          	blez	a5,96e <edf_cbs_setup+0x32e>
     960:	fd442783          	lw	a5,-44(s0)
     964:	0007871b          	sext.w	a4,a5
     968:	4795                	li	a5,5
     96a:	02e7d763          	bge	a5,a4,998 <edf_cbs_setup+0x358>
            ERROR_EXIT(wrong n);
     96e:	00002517          	auipc	a0,0x2
     972:	11250513          	addi	a0,a0,274 # 2a80 <schedule_dm+0x356>
     976:	00001097          	auipc	ra,0x1
     97a:	ce2080e7          	jalr	-798(ra) # 1658 <printf>
     97e:	00002517          	auipc	a0,0x2
     982:	03250513          	addi	a0,a0,50 # 29b0 <schedule_dm+0x286>
     986:	00001097          	auipc	ra,0x1
     98a:	cd2080e7          	jalr	-814(ra) # 1658 <printf>
     98e:	4505                	li	a0,1
     990:	00000097          	auipc	ra,0x0
     994:	782080e7          	jalr	1922(ra) # 1112 <exit>
        
        printf("arrival time [0-100]: ");
     998:	00002517          	auipc	a0,0x2
     99c:	03850513          	addi	a0,a0,56 # 29d0 <schedule_dm+0x2a6>
     9a0:	00001097          	auipc	ra,0x1
     9a4:	cb8080e7          	jalr	-840(ra) # 1658 <printf>
        gets(buf, 5);
     9a8:	4595                	li	a1,5
     9aa:	00002517          	auipc	a0,0x2
     9ae:	47650513          	addi	a0,a0,1142 # 2e20 <buf>
     9b2:	00000097          	auipc	ra,0x0
     9b6:	460080e7          	jalr	1120(ra) # e12 <gets>
        arrival_time = atoi(buf);
     9ba:	00002517          	auipc	a0,0x2
     9be:	46650513          	addi	a0,a0,1126 # 2e20 <buf>
     9c2:	00000097          	auipc	ra,0x0
     9c6:	558080e7          	jalr	1368(ra) # f1a <atoi>
     9ca:	87aa                	mv	a5,a0
     9cc:	fcf42823          	sw	a5,-48(s0)
        printf("\n");
     9d0:	00002517          	auipc	a0,0x2
     9d4:	fe050513          	addi	a0,a0,-32 # 29b0 <schedule_dm+0x286>
     9d8:	00001097          	auipc	ra,0x1
     9dc:	c80080e7          	jalr	-896(ra) # 1658 <printf>
        if (arrival_time < 0 || arrival_time > 100)
     9e0:	fd042783          	lw	a5,-48(s0)
     9e4:	2781                	sext.w	a5,a5
     9e6:	0007ca63          	bltz	a5,9fa <edf_cbs_setup+0x3ba>
     9ea:	fd042783          	lw	a5,-48(s0)
     9ee:	0007871b          	sext.w	a4,a5
     9f2:	06400793          	li	a5,100
     9f6:	02e7d763          	bge	a5,a4,a24 <edf_cbs_setup+0x3e4>
            ERROR_EXIT(wrong arrival time);
     9fa:	00002517          	auipc	a0,0x2
     9fe:	fee50513          	addi	a0,a0,-18 # 29e8 <schedule_dm+0x2be>
     a02:	00001097          	auipc	ra,0x1
     a06:	c56080e7          	jalr	-938(ra) # 1658 <printf>
     a0a:	00002517          	auipc	a0,0x2
     a0e:	fa650513          	addi	a0,a0,-90 # 29b0 <schedule_dm+0x286>
     a12:	00001097          	auipc	ra,0x1
     a16:	c46080e7          	jalr	-954(ra) # 1658 <printf>
     a1a:	4505                	li	a0,1
     a1c:	00000097          	auipc	ra,0x0
     a20:	6f6080e7          	jalr	1782(ra) # 1112 <exit>

        t = thread_create(f, (void *)((uint64) (i+1)), 1, burst_time, period, repeat_times);
     a24:	fe842783          	lw	a5,-24(s0)
     a28:	2785                	addiw	a5,a5,1
     a2a:	2781                	sext.w	a5,a5
     a2c:	85be                	mv	a1,a5
     a2e:	fd442783          	lw	a5,-44(s0)
     a32:	fe042703          	lw	a4,-32(s0)
     a36:	fdc42683          	lw	a3,-36(s0)
     a3a:	4605                	li	a2,1
     a3c:	fffff517          	auipc	a0,0xfffff
     a40:	5c450513          	addi	a0,a0,1476 # 0 <f>
     a44:	00001097          	auipc	ra,0x1
     a48:	0cc080e7          	jalr	204(ra) # 1b10 <thread_create>
     a4c:	fca43423          	sd	a0,-56(s0)
        init_thread_cbs(t, budget, is_hard);
     a50:	fe442703          	lw	a4,-28(s0)
     a54:	fd842783          	lw	a5,-40(s0)
     a58:	863a                	mv	a2,a4
     a5a:	85be                	mv	a1,a5
     a5c:	fc843503          	ld	a0,-56(s0)
     a60:	00001097          	auipc	ra,0x1
     a64:	1ea080e7          	jalr	490(ra) # 1c4a <init_thread_cbs>
        thread_add_at(t, arrival_time);
     a68:	fd042783          	lw	a5,-48(s0)
     a6c:	85be                	mv	a1,a5
     a6e:	fc843503          	ld	a0,-56(s0)
     a72:	00001097          	auipc	ra,0x1
     a76:	22e080e7          	jalr	558(ra) # 1ca0 <thread_add_at>
    for (int i = 0; i < tnum; ++i) {
     a7a:	fe842783          	lw	a5,-24(s0)
     a7e:	2785                	addiw	a5,a5,1
     a80:	fef42423          	sw	a5,-24(s0)
     a84:	fe842703          	lw	a4,-24(s0)
     a88:	fbc42783          	lw	a5,-68(s0)
     a8c:	2701                	sext.w	a4,a4
     a8e:	2781                	sext.w	a5,a5
     a90:	bef74ee3          	blt	a4,a5,68c <edf_cbs_setup+0x4c>
    }
}
     a94:	0001                	nop
     a96:	0001                	nop
     a98:	60a6                	ld	ra,72(sp)
     a9a:	6406                	ld	s0,64(sp)
     a9c:	6161                	addi	sp,sp,80
     a9e:	8082                	ret

0000000000000aa0 <main>:


int main(int argc, char **argv)
{
     aa0:	7179                	addi	sp,sp,-48
     aa2:	f406                	sd	ra,40(sp)
     aa4:	f022                	sd	s0,32(sp)
     aa6:	1800                	addi	s0,sp,48
     aa8:	87aa                	mv	a5,a0
     aaa:	fcb43823          	sd	a1,-48(s0)
     aae:	fcf42e23          	sw	a5,-36(s0)
    printf("The scheduler selected in the thread lib\n");
     ab2:	00002517          	auipc	a0,0x2
     ab6:	0c650513          	addi	a0,a0,198 # 2b78 <schedule_dm+0x44e>
     aba:	00001097          	auipc	ra,0x1
     abe:	b9e080e7          	jalr	-1122(ra) # 1658 <printf>
    printf("0:HRRN, 1:PRR, 2:DM, 3:EDF-CBS: ");
     ac2:	00002517          	auipc	a0,0x2
     ac6:	0e650513          	addi	a0,a0,230 # 2ba8 <schedule_dm+0x47e>
     aca:	00001097          	auipc	ra,0x1
     ace:	b8e080e7          	jalr	-1138(ra) # 1658 <printf>
    gets(buf, 5);
     ad2:	4595                	li	a1,5
     ad4:	00002517          	auipc	a0,0x2
     ad8:	34c50513          	addi	a0,a0,844 # 2e20 <buf>
     adc:	00000097          	auipc	ra,0x0
     ae0:	336080e7          	jalr	822(ra) # e12 <gets>
    int sched_type = atoi(buf);
     ae4:	00002517          	auipc	a0,0x2
     ae8:	33c50513          	addi	a0,a0,828 # 2e20 <buf>
     aec:	00000097          	auipc	ra,0x0
     af0:	42e080e7          	jalr	1070(ra) # f1a <atoi>
     af4:	87aa                	mv	a5,a0
     af6:	fef42623          	sw	a5,-20(s0)
    printf("\n");
     afa:	00002517          	auipc	a0,0x2
     afe:	eb650513          	addi	a0,a0,-330 # 29b0 <schedule_dm+0x286>
     b02:	00001097          	auipc	ra,0x1
     b06:	b56080e7          	jalr	-1194(ra) # 1658 <printf>

    if (sched_type >= 4) 
     b0a:	fec42783          	lw	a5,-20(s0)
     b0e:	0007871b          	sext.w	a4,a5
     b12:	478d                	li	a5,3
     b14:	02e7d763          	bge	a5,a4,b42 <main+0xa2>
        ERROR_EXIT(scheduling type error);
     b18:	00002517          	auipc	a0,0x2
     b1c:	0b850513          	addi	a0,a0,184 # 2bd0 <schedule_dm+0x4a6>
     b20:	00001097          	auipc	ra,0x1
     b24:	b38080e7          	jalr	-1224(ra) # 1658 <printf>
     b28:	00002517          	auipc	a0,0x2
     b2c:	e8850513          	addi	a0,a0,-376 # 29b0 <schedule_dm+0x286>
     b30:	00001097          	auipc	ra,0x1
     b34:	b28080e7          	jalr	-1240(ra) # 1658 <printf>
     b38:	4505                	li	a0,1
     b3a:	00000097          	auipc	ra,0x0
     b3e:	5d8080e7          	jalr	1496(ra) # 1112 <exit>
    
    printf("Note that MAX_THRD_NUM in kernel/proc.h is 16\n");
     b42:	00002517          	auipc	a0,0x2
     b46:	0a650513          	addi	a0,a0,166 # 2be8 <schedule_dm+0x4be>
     b4a:	00001097          	auipc	ra,0x1
     b4e:	b0e080e7          	jalr	-1266(ra) # 1658 <printf>
    printf("# of threads [1-(15)-9999]: ");
     b52:	00002517          	auipc	a0,0x2
     b56:	0c650513          	addi	a0,a0,198 # 2c18 <schedule_dm+0x4ee>
     b5a:	00001097          	auipc	ra,0x1
     b5e:	afe080e7          	jalr	-1282(ra) # 1658 <printf>
    gets(buf, 5);
     b62:	4595                	li	a1,5
     b64:	00002517          	auipc	a0,0x2
     b68:	2bc50513          	addi	a0,a0,700 # 2e20 <buf>
     b6c:	00000097          	auipc	ra,0x0
     b70:	2a6080e7          	jalr	678(ra) # e12 <gets>
    int thread_num = atoi(buf);
     b74:	00002517          	auipc	a0,0x2
     b78:	2ac50513          	addi	a0,a0,684 # 2e20 <buf>
     b7c:	00000097          	auipc	ra,0x0
     b80:	39e080e7          	jalr	926(ra) # f1a <atoi>
     b84:	87aa                	mv	a5,a0
     b86:	fef42423          	sw	a5,-24(s0)
    printf("\n");
     b8a:	00002517          	auipc	a0,0x2
     b8e:	e2650513          	addi	a0,a0,-474 # 29b0 <schedule_dm+0x286>
     b92:	00001097          	auipc	ra,0x1
     b96:	ac6080e7          	jalr	-1338(ra) # 1658 <printf>

    if (thread_num < 1)
     b9a:	fe842783          	lw	a5,-24(s0)
     b9e:	2781                	sext.w	a5,a5
     ba0:	02f04763          	bgtz	a5,bce <main+0x12e>
        ERROR_EXIT(thread number error);
     ba4:	00002517          	auipc	a0,0x2
     ba8:	09450513          	addi	a0,a0,148 # 2c38 <schedule_dm+0x50e>
     bac:	00001097          	auipc	ra,0x1
     bb0:	aac080e7          	jalr	-1364(ra) # 1658 <printf>
     bb4:	00002517          	auipc	a0,0x2
     bb8:	dfc50513          	addi	a0,a0,-516 # 29b0 <schedule_dm+0x286>
     bbc:	00001097          	auipc	ra,0x1
     bc0:	a9c080e7          	jalr	-1380(ra) # 1658 <printf>
     bc4:	4505                	li	a0,1
     bc6:	00000097          	auipc	ra,0x0
     bca:	54c080e7          	jalr	1356(ra) # 1112 <exit>

    switch (sched_type)
     bce:	fec42783          	lw	a5,-20(s0)
     bd2:	0007871b          	sext.w	a4,a5
     bd6:	478d                	li	a5,3
     bd8:	06f70b63          	beq	a4,a5,c4e <main+0x1ae>
     bdc:	fec42783          	lw	a5,-20(s0)
     be0:	0007871b          	sext.w	a4,a5
     be4:	478d                	li	a5,3
     be6:	06e7cc63          	blt	a5,a4,c5e <main+0x1be>
     bea:	fec42783          	lw	a5,-20(s0)
     bee:	0007871b          	sext.w	a4,a5
     bf2:	4789                	li	a5,2
     bf4:	04f70563          	beq	a4,a5,c3e <main+0x19e>
     bf8:	fec42783          	lw	a5,-20(s0)
     bfc:	0007871b          	sext.w	a4,a5
     c00:	4789                	li	a5,2
     c02:	04e7ce63          	blt	a5,a4,c5e <main+0x1be>
     c06:	fec42783          	lw	a5,-20(s0)
     c0a:	2781                	sext.w	a5,a5
     c0c:	cb89                	beqz	a5,c1e <main+0x17e>
     c0e:	fec42783          	lw	a5,-20(s0)
     c12:	0007871b          	sext.w	a4,a5
     c16:	4785                	li	a5,1
     c18:	00f70b63          	beq	a4,a5,c2e <main+0x18e>
        break;
    case 3:
        edf_cbs_setup(thread_num);
        break;
    default:
        break;
     c1c:	a089                	j	c5e <main+0x1be>
        hrrn_setup(thread_num);
     c1e:	fe842783          	lw	a5,-24(s0)
     c22:	853e                	mv	a0,a5
     c24:	fffff097          	auipc	ra,0xfffff
     c28:	408080e7          	jalr	1032(ra) # 2c <hrrn_setup>
        break;
     c2c:	a815                	j	c60 <main+0x1c0>
        prr_setup(thread_num);
     c2e:	fe842783          	lw	a5,-24(s0)
     c32:	853e                	mv	a0,a5
     c34:	fffff097          	auipc	ra,0xfffff
     c38:	59e080e7          	jalr	1438(ra) # 1d2 <prr_setup>
        break;
     c3c:	a015                	j	c60 <main+0x1c0>
        dm_setup(thread_num);
     c3e:	fe842783          	lw	a5,-24(s0)
     c42:	853e                	mv	a0,a5
     c44:	fffff097          	auipc	ra,0xfffff
     c48:	740080e7          	jalr	1856(ra) # 384 <dm_setup>
        break;
     c4c:	a811                	j	c60 <main+0x1c0>
        edf_cbs_setup(thread_num);
     c4e:	fe842783          	lw	a5,-24(s0)
     c52:	853e                	mv	a0,a5
     c54:	00000097          	auipc	ra,0x0
     c58:	9ec080e7          	jalr	-1556(ra) # 640 <edf_cbs_setup>
        break;
     c5c:	a011                	j	c60 <main+0x1c0>
        break;
     c5e:	0001                	nop
    }

    thread_start_threading();
     c60:	00002097          	auipc	ra,0x2
     c64:	88a080e7          	jalr	-1910(ra) # 24ea <thread_start_threading>
    printf("\nexited\n");
     c68:	00002517          	auipc	a0,0x2
     c6c:	fe850513          	addi	a0,a0,-24 # 2c50 <schedule_dm+0x526>
     c70:	00001097          	auipc	ra,0x1
     c74:	9e8080e7          	jalr	-1560(ra) # 1658 <printf>
    exit(0);
     c78:	4501                	li	a0,0
     c7a:	00000097          	auipc	ra,0x0
     c7e:	498080e7          	jalr	1176(ra) # 1112 <exit>

0000000000000c82 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
     c82:	7179                	addi	sp,sp,-48
     c84:	f422                	sd	s0,40(sp)
     c86:	1800                	addi	s0,sp,48
     c88:	fca43c23          	sd	a0,-40(s0)
     c8c:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
     c90:	fd843783          	ld	a5,-40(s0)
     c94:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
     c98:	0001                	nop
     c9a:	fd043703          	ld	a4,-48(s0)
     c9e:	00170793          	addi	a5,a4,1
     ca2:	fcf43823          	sd	a5,-48(s0)
     ca6:	fd843783          	ld	a5,-40(s0)
     caa:	00178693          	addi	a3,a5,1
     cae:	fcd43c23          	sd	a3,-40(s0)
     cb2:	00074703          	lbu	a4,0(a4)
     cb6:	00e78023          	sb	a4,0(a5)
     cba:	0007c783          	lbu	a5,0(a5)
     cbe:	fff1                	bnez	a5,c9a <strcpy+0x18>
    ;
  return os;
     cc0:	fe843783          	ld	a5,-24(s0)
}
     cc4:	853e                	mv	a0,a5
     cc6:	7422                	ld	s0,40(sp)
     cc8:	6145                	addi	sp,sp,48
     cca:	8082                	ret

0000000000000ccc <strcmp>:

int
strcmp(const char *p, const char *q)
{
     ccc:	1101                	addi	sp,sp,-32
     cce:	ec22                	sd	s0,24(sp)
     cd0:	1000                	addi	s0,sp,32
     cd2:	fea43423          	sd	a0,-24(s0)
     cd6:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     cda:	a819                	j	cf0 <strcmp+0x24>
    p++, q++;
     cdc:	fe843783          	ld	a5,-24(s0)
     ce0:	0785                	addi	a5,a5,1
     ce2:	fef43423          	sd	a5,-24(s0)
     ce6:	fe043783          	ld	a5,-32(s0)
     cea:	0785                	addi	a5,a5,1
     cec:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     cf0:	fe843783          	ld	a5,-24(s0)
     cf4:	0007c783          	lbu	a5,0(a5)
     cf8:	cb99                	beqz	a5,d0e <strcmp+0x42>
     cfa:	fe843783          	ld	a5,-24(s0)
     cfe:	0007c703          	lbu	a4,0(a5)
     d02:	fe043783          	ld	a5,-32(s0)
     d06:	0007c783          	lbu	a5,0(a5)
     d0a:	fcf709e3          	beq	a4,a5,cdc <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     d0e:	fe843783          	ld	a5,-24(s0)
     d12:	0007c783          	lbu	a5,0(a5)
     d16:	0007871b          	sext.w	a4,a5
     d1a:	fe043783          	ld	a5,-32(s0)
     d1e:	0007c783          	lbu	a5,0(a5)
     d22:	2781                	sext.w	a5,a5
     d24:	40f707bb          	subw	a5,a4,a5
     d28:	2781                	sext.w	a5,a5
}
     d2a:	853e                	mv	a0,a5
     d2c:	6462                	ld	s0,24(sp)
     d2e:	6105                	addi	sp,sp,32
     d30:	8082                	ret

0000000000000d32 <strlen>:

uint
strlen(const char *s)
{
     d32:	7179                	addi	sp,sp,-48
     d34:	f422                	sd	s0,40(sp)
     d36:	1800                	addi	s0,sp,48
     d38:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     d3c:	fe042623          	sw	zero,-20(s0)
     d40:	a031                	j	d4c <strlen+0x1a>
     d42:	fec42783          	lw	a5,-20(s0)
     d46:	2785                	addiw	a5,a5,1
     d48:	fef42623          	sw	a5,-20(s0)
     d4c:	fec42783          	lw	a5,-20(s0)
     d50:	fd843703          	ld	a4,-40(s0)
     d54:	97ba                	add	a5,a5,a4
     d56:	0007c783          	lbu	a5,0(a5)
     d5a:	f7e5                	bnez	a5,d42 <strlen+0x10>
    ;
  return n;
     d5c:	fec42783          	lw	a5,-20(s0)
}
     d60:	853e                	mv	a0,a5
     d62:	7422                	ld	s0,40(sp)
     d64:	6145                	addi	sp,sp,48
     d66:	8082                	ret

0000000000000d68 <memset>:

void*
memset(void *dst, int c, uint n)
{
     d68:	7179                	addi	sp,sp,-48
     d6a:	f422                	sd	s0,40(sp)
     d6c:	1800                	addi	s0,sp,48
     d6e:	fca43c23          	sd	a0,-40(s0)
     d72:	87ae                	mv	a5,a1
     d74:	8732                	mv	a4,a2
     d76:	fcf42a23          	sw	a5,-44(s0)
     d7a:	87ba                	mv	a5,a4
     d7c:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     d80:	fd843783          	ld	a5,-40(s0)
     d84:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     d88:	fe042623          	sw	zero,-20(s0)
     d8c:	a00d                	j	dae <memset+0x46>
    cdst[i] = c;
     d8e:	fec42783          	lw	a5,-20(s0)
     d92:	fe043703          	ld	a4,-32(s0)
     d96:	97ba                	add	a5,a5,a4
     d98:	fd442703          	lw	a4,-44(s0)
     d9c:	0ff77713          	andi	a4,a4,255
     da0:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     da4:	fec42783          	lw	a5,-20(s0)
     da8:	2785                	addiw	a5,a5,1
     daa:	fef42623          	sw	a5,-20(s0)
     dae:	fec42703          	lw	a4,-20(s0)
     db2:	fd042783          	lw	a5,-48(s0)
     db6:	2781                	sext.w	a5,a5
     db8:	fcf76be3          	bltu	a4,a5,d8e <memset+0x26>
  }
  return dst;
     dbc:	fd843783          	ld	a5,-40(s0)
}
     dc0:	853e                	mv	a0,a5
     dc2:	7422                	ld	s0,40(sp)
     dc4:	6145                	addi	sp,sp,48
     dc6:	8082                	ret

0000000000000dc8 <strchr>:

char*
strchr(const char *s, char c)
{
     dc8:	1101                	addi	sp,sp,-32
     dca:	ec22                	sd	s0,24(sp)
     dcc:	1000                	addi	s0,sp,32
     dce:	fea43423          	sd	a0,-24(s0)
     dd2:	87ae                	mv	a5,a1
     dd4:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     dd8:	a01d                	j	dfe <strchr+0x36>
    if(*s == c)
     dda:	fe843783          	ld	a5,-24(s0)
     dde:	0007c703          	lbu	a4,0(a5)
     de2:	fe744783          	lbu	a5,-25(s0)
     de6:	0ff7f793          	andi	a5,a5,255
     dea:	00e79563          	bne	a5,a4,df4 <strchr+0x2c>
      return (char*)s;
     dee:	fe843783          	ld	a5,-24(s0)
     df2:	a821                	j	e0a <strchr+0x42>
  for(; *s; s++)
     df4:	fe843783          	ld	a5,-24(s0)
     df8:	0785                	addi	a5,a5,1
     dfa:	fef43423          	sd	a5,-24(s0)
     dfe:	fe843783          	ld	a5,-24(s0)
     e02:	0007c783          	lbu	a5,0(a5)
     e06:	fbf1                	bnez	a5,dda <strchr+0x12>
  return 0;
     e08:	4781                	li	a5,0
}
     e0a:	853e                	mv	a0,a5
     e0c:	6462                	ld	s0,24(sp)
     e0e:	6105                	addi	sp,sp,32
     e10:	8082                	ret

0000000000000e12 <gets>:

char*
gets(char *buf, int max)
{
     e12:	7179                	addi	sp,sp,-48
     e14:	f406                	sd	ra,40(sp)
     e16:	f022                	sd	s0,32(sp)
     e18:	1800                	addi	s0,sp,48
     e1a:	fca43c23          	sd	a0,-40(s0)
     e1e:	87ae                	mv	a5,a1
     e20:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     e24:	fe042623          	sw	zero,-20(s0)
     e28:	a8a1                	j	e80 <gets+0x6e>
    cc = read(0, &c, 1);
     e2a:	fe740793          	addi	a5,s0,-25
     e2e:	4605                	li	a2,1
     e30:	85be                	mv	a1,a5
     e32:	4501                	li	a0,0
     e34:	00000097          	auipc	ra,0x0
     e38:	2f6080e7          	jalr	758(ra) # 112a <read>
     e3c:	87aa                	mv	a5,a0
     e3e:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     e42:	fe842783          	lw	a5,-24(s0)
     e46:	2781                	sext.w	a5,a5
     e48:	04f05763          	blez	a5,e96 <gets+0x84>
      break;
    buf[i++] = c;
     e4c:	fec42783          	lw	a5,-20(s0)
     e50:	0017871b          	addiw	a4,a5,1
     e54:	fee42623          	sw	a4,-20(s0)
     e58:	873e                	mv	a4,a5
     e5a:	fd843783          	ld	a5,-40(s0)
     e5e:	97ba                	add	a5,a5,a4
     e60:	fe744703          	lbu	a4,-25(s0)
     e64:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     e68:	fe744783          	lbu	a5,-25(s0)
     e6c:	873e                	mv	a4,a5
     e6e:	47a9                	li	a5,10
     e70:	02f70463          	beq	a4,a5,e98 <gets+0x86>
     e74:	fe744783          	lbu	a5,-25(s0)
     e78:	873e                	mv	a4,a5
     e7a:	47b5                	li	a5,13
     e7c:	00f70e63          	beq	a4,a5,e98 <gets+0x86>
  for(i=0; i+1 < max; ){
     e80:	fec42783          	lw	a5,-20(s0)
     e84:	2785                	addiw	a5,a5,1
     e86:	0007871b          	sext.w	a4,a5
     e8a:	fd442783          	lw	a5,-44(s0)
     e8e:	2781                	sext.w	a5,a5
     e90:	f8f74de3          	blt	a4,a5,e2a <gets+0x18>
     e94:	a011                	j	e98 <gets+0x86>
      break;
     e96:	0001                	nop
      break;
  }
  buf[i] = '\0';
     e98:	fec42783          	lw	a5,-20(s0)
     e9c:	fd843703          	ld	a4,-40(s0)
     ea0:	97ba                	add	a5,a5,a4
     ea2:	00078023          	sb	zero,0(a5)
  return buf;
     ea6:	fd843783          	ld	a5,-40(s0)
}
     eaa:	853e                	mv	a0,a5
     eac:	70a2                	ld	ra,40(sp)
     eae:	7402                	ld	s0,32(sp)
     eb0:	6145                	addi	sp,sp,48
     eb2:	8082                	ret

0000000000000eb4 <stat>:

int
stat(const char *n, struct stat *st)
{
     eb4:	7179                	addi	sp,sp,-48
     eb6:	f406                	sd	ra,40(sp)
     eb8:	f022                	sd	s0,32(sp)
     eba:	1800                	addi	s0,sp,48
     ebc:	fca43c23          	sd	a0,-40(s0)
     ec0:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     ec4:	4581                	li	a1,0
     ec6:	fd843503          	ld	a0,-40(s0)
     eca:	00000097          	auipc	ra,0x0
     ece:	288080e7          	jalr	648(ra) # 1152 <open>
     ed2:	87aa                	mv	a5,a0
     ed4:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     ed8:	fec42783          	lw	a5,-20(s0)
     edc:	2781                	sext.w	a5,a5
     ede:	0007d463          	bgez	a5,ee6 <stat+0x32>
    return -1;
     ee2:	57fd                	li	a5,-1
     ee4:	a035                	j	f10 <stat+0x5c>
  r = fstat(fd, st);
     ee6:	fec42783          	lw	a5,-20(s0)
     eea:	fd043583          	ld	a1,-48(s0)
     eee:	853e                	mv	a0,a5
     ef0:	00000097          	auipc	ra,0x0
     ef4:	27a080e7          	jalr	634(ra) # 116a <fstat>
     ef8:	87aa                	mv	a5,a0
     efa:	fef42423          	sw	a5,-24(s0)
  close(fd);
     efe:	fec42783          	lw	a5,-20(s0)
     f02:	853e                	mv	a0,a5
     f04:	00000097          	auipc	ra,0x0
     f08:	236080e7          	jalr	566(ra) # 113a <close>
  return r;
     f0c:	fe842783          	lw	a5,-24(s0)
}
     f10:	853e                	mv	a0,a5
     f12:	70a2                	ld	ra,40(sp)
     f14:	7402                	ld	s0,32(sp)
     f16:	6145                	addi	sp,sp,48
     f18:	8082                	ret

0000000000000f1a <atoi>:

int
atoi(const char *s)
{
     f1a:	7179                	addi	sp,sp,-48
     f1c:	f422                	sd	s0,40(sp)
     f1e:	1800                	addi	s0,sp,48
     f20:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     f24:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     f28:	a815                	j	f5c <atoi+0x42>
    n = n*10 + *s++ - '0';
     f2a:	fec42703          	lw	a4,-20(s0)
     f2e:	87ba                	mv	a5,a4
     f30:	0027979b          	slliw	a5,a5,0x2
     f34:	9fb9                	addw	a5,a5,a4
     f36:	0017979b          	slliw	a5,a5,0x1
     f3a:	0007871b          	sext.w	a4,a5
     f3e:	fd843783          	ld	a5,-40(s0)
     f42:	00178693          	addi	a3,a5,1
     f46:	fcd43c23          	sd	a3,-40(s0)
     f4a:	0007c783          	lbu	a5,0(a5)
     f4e:	2781                	sext.w	a5,a5
     f50:	9fb9                	addw	a5,a5,a4
     f52:	2781                	sext.w	a5,a5
     f54:	fd07879b          	addiw	a5,a5,-48
     f58:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     f5c:	fd843783          	ld	a5,-40(s0)
     f60:	0007c783          	lbu	a5,0(a5)
     f64:	873e                	mv	a4,a5
     f66:	02f00793          	li	a5,47
     f6a:	00e7fb63          	bgeu	a5,a4,f80 <atoi+0x66>
     f6e:	fd843783          	ld	a5,-40(s0)
     f72:	0007c783          	lbu	a5,0(a5)
     f76:	873e                	mv	a4,a5
     f78:	03900793          	li	a5,57
     f7c:	fae7f7e3          	bgeu	a5,a4,f2a <atoi+0x10>
  return n;
     f80:	fec42783          	lw	a5,-20(s0)
}
     f84:	853e                	mv	a0,a5
     f86:	7422                	ld	s0,40(sp)
     f88:	6145                	addi	sp,sp,48
     f8a:	8082                	ret

0000000000000f8c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     f8c:	7139                	addi	sp,sp,-64
     f8e:	fc22                	sd	s0,56(sp)
     f90:	0080                	addi	s0,sp,64
     f92:	fca43c23          	sd	a0,-40(s0)
     f96:	fcb43823          	sd	a1,-48(s0)
     f9a:	87b2                	mv	a5,a2
     f9c:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     fa0:	fd843783          	ld	a5,-40(s0)
     fa4:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     fa8:	fd043783          	ld	a5,-48(s0)
     fac:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     fb0:	fe043703          	ld	a4,-32(s0)
     fb4:	fe843783          	ld	a5,-24(s0)
     fb8:	02e7fc63          	bgeu	a5,a4,ff0 <memmove+0x64>
    while(n-- > 0)
     fbc:	a00d                	j	fde <memmove+0x52>
      *dst++ = *src++;
     fbe:	fe043703          	ld	a4,-32(s0)
     fc2:	00170793          	addi	a5,a4,1
     fc6:	fef43023          	sd	a5,-32(s0)
     fca:	fe843783          	ld	a5,-24(s0)
     fce:	00178693          	addi	a3,a5,1
     fd2:	fed43423          	sd	a3,-24(s0)
     fd6:	00074703          	lbu	a4,0(a4)
     fda:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     fde:	fcc42783          	lw	a5,-52(s0)
     fe2:	fff7871b          	addiw	a4,a5,-1
     fe6:	fce42623          	sw	a4,-52(s0)
     fea:	fcf04ae3          	bgtz	a5,fbe <memmove+0x32>
     fee:	a891                	j	1042 <memmove+0xb6>
  } else {
    dst += n;
     ff0:	fcc42783          	lw	a5,-52(s0)
     ff4:	fe843703          	ld	a4,-24(s0)
     ff8:	97ba                	add	a5,a5,a4
     ffa:	fef43423          	sd	a5,-24(s0)
    src += n;
     ffe:	fcc42783          	lw	a5,-52(s0)
    1002:	fe043703          	ld	a4,-32(s0)
    1006:	97ba                	add	a5,a5,a4
    1008:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
    100c:	a01d                	j	1032 <memmove+0xa6>
      *--dst = *--src;
    100e:	fe043783          	ld	a5,-32(s0)
    1012:	17fd                	addi	a5,a5,-1
    1014:	fef43023          	sd	a5,-32(s0)
    1018:	fe843783          	ld	a5,-24(s0)
    101c:	17fd                	addi	a5,a5,-1
    101e:	fef43423          	sd	a5,-24(s0)
    1022:	fe043783          	ld	a5,-32(s0)
    1026:	0007c703          	lbu	a4,0(a5)
    102a:	fe843783          	ld	a5,-24(s0)
    102e:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    1032:	fcc42783          	lw	a5,-52(s0)
    1036:	fff7871b          	addiw	a4,a5,-1
    103a:	fce42623          	sw	a4,-52(s0)
    103e:	fcf048e3          	bgtz	a5,100e <memmove+0x82>
  }
  return vdst;
    1042:	fd843783          	ld	a5,-40(s0)
}
    1046:	853e                	mv	a0,a5
    1048:	7462                	ld	s0,56(sp)
    104a:	6121                	addi	sp,sp,64
    104c:	8082                	ret

000000000000104e <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
    104e:	7139                	addi	sp,sp,-64
    1050:	fc22                	sd	s0,56(sp)
    1052:	0080                	addi	s0,sp,64
    1054:	fca43c23          	sd	a0,-40(s0)
    1058:	fcb43823          	sd	a1,-48(s0)
    105c:	87b2                	mv	a5,a2
    105e:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
    1062:	fd843783          	ld	a5,-40(s0)
    1066:	fef43423          	sd	a5,-24(s0)
    106a:	fd043783          	ld	a5,-48(s0)
    106e:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
    1072:	a0a1                	j	10ba <memcmp+0x6c>
    if (*p1 != *p2) {
    1074:	fe843783          	ld	a5,-24(s0)
    1078:	0007c703          	lbu	a4,0(a5)
    107c:	fe043783          	ld	a5,-32(s0)
    1080:	0007c783          	lbu	a5,0(a5)
    1084:	02f70163          	beq	a4,a5,10a6 <memcmp+0x58>
      return *p1 - *p2;
    1088:	fe843783          	ld	a5,-24(s0)
    108c:	0007c783          	lbu	a5,0(a5)
    1090:	0007871b          	sext.w	a4,a5
    1094:	fe043783          	ld	a5,-32(s0)
    1098:	0007c783          	lbu	a5,0(a5)
    109c:	2781                	sext.w	a5,a5
    109e:	40f707bb          	subw	a5,a4,a5
    10a2:	2781                	sext.w	a5,a5
    10a4:	a01d                	j	10ca <memcmp+0x7c>
    }
    p1++;
    10a6:	fe843783          	ld	a5,-24(s0)
    10aa:	0785                	addi	a5,a5,1
    10ac:	fef43423          	sd	a5,-24(s0)
    p2++;
    10b0:	fe043783          	ld	a5,-32(s0)
    10b4:	0785                	addi	a5,a5,1
    10b6:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
    10ba:	fcc42783          	lw	a5,-52(s0)
    10be:	fff7871b          	addiw	a4,a5,-1
    10c2:	fce42623          	sw	a4,-52(s0)
    10c6:	f7dd                	bnez	a5,1074 <memcmp+0x26>
  }
  return 0;
    10c8:	4781                	li	a5,0
}
    10ca:	853e                	mv	a0,a5
    10cc:	7462                	ld	s0,56(sp)
    10ce:	6121                	addi	sp,sp,64
    10d0:	8082                	ret

00000000000010d2 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
    10d2:	7179                	addi	sp,sp,-48
    10d4:	f406                	sd	ra,40(sp)
    10d6:	f022                	sd	s0,32(sp)
    10d8:	1800                	addi	s0,sp,48
    10da:	fea43423          	sd	a0,-24(s0)
    10de:	feb43023          	sd	a1,-32(s0)
    10e2:	87b2                	mv	a5,a2
    10e4:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
    10e8:	fdc42783          	lw	a5,-36(s0)
    10ec:	863e                	mv	a2,a5
    10ee:	fe043583          	ld	a1,-32(s0)
    10f2:	fe843503          	ld	a0,-24(s0)
    10f6:	00000097          	auipc	ra,0x0
    10fa:	e96080e7          	jalr	-362(ra) # f8c <memmove>
    10fe:	87aa                	mv	a5,a0
}
    1100:	853e                	mv	a0,a5
    1102:	70a2                	ld	ra,40(sp)
    1104:	7402                	ld	s0,32(sp)
    1106:	6145                	addi	sp,sp,48
    1108:	8082                	ret

000000000000110a <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
    110a:	4885                	li	a7,1
 ecall
    110c:	00000073          	ecall
 ret
    1110:	8082                	ret

0000000000001112 <exit>:
.global exit
exit:
 li a7, SYS_exit
    1112:	4889                	li	a7,2
 ecall
    1114:	00000073          	ecall
 ret
    1118:	8082                	ret

000000000000111a <wait>:
.global wait
wait:
 li a7, SYS_wait
    111a:	488d                	li	a7,3
 ecall
    111c:	00000073          	ecall
 ret
    1120:	8082                	ret

0000000000001122 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
    1122:	4891                	li	a7,4
 ecall
    1124:	00000073          	ecall
 ret
    1128:	8082                	ret

000000000000112a <read>:
.global read
read:
 li a7, SYS_read
    112a:	4895                	li	a7,5
 ecall
    112c:	00000073          	ecall
 ret
    1130:	8082                	ret

0000000000001132 <write>:
.global write
write:
 li a7, SYS_write
    1132:	48c1                	li	a7,16
 ecall
    1134:	00000073          	ecall
 ret
    1138:	8082                	ret

000000000000113a <close>:
.global close
close:
 li a7, SYS_close
    113a:	48d5                	li	a7,21
 ecall
    113c:	00000073          	ecall
 ret
    1140:	8082                	ret

0000000000001142 <kill>:
.global kill
kill:
 li a7, SYS_kill
    1142:	4899                	li	a7,6
 ecall
    1144:	00000073          	ecall
 ret
    1148:	8082                	ret

000000000000114a <exec>:
.global exec
exec:
 li a7, SYS_exec
    114a:	489d                	li	a7,7
 ecall
    114c:	00000073          	ecall
 ret
    1150:	8082                	ret

0000000000001152 <open>:
.global open
open:
 li a7, SYS_open
    1152:	48bd                	li	a7,15
 ecall
    1154:	00000073          	ecall
 ret
    1158:	8082                	ret

000000000000115a <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
    115a:	48c5                	li	a7,17
 ecall
    115c:	00000073          	ecall
 ret
    1160:	8082                	ret

0000000000001162 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
    1162:	48c9                	li	a7,18
 ecall
    1164:	00000073          	ecall
 ret
    1168:	8082                	ret

000000000000116a <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
    116a:	48a1                	li	a7,8
 ecall
    116c:	00000073          	ecall
 ret
    1170:	8082                	ret

0000000000001172 <link>:
.global link
link:
 li a7, SYS_link
    1172:	48cd                	li	a7,19
 ecall
    1174:	00000073          	ecall
 ret
    1178:	8082                	ret

000000000000117a <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
    117a:	48d1                	li	a7,20
 ecall
    117c:	00000073          	ecall
 ret
    1180:	8082                	ret

0000000000001182 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
    1182:	48a5                	li	a7,9
 ecall
    1184:	00000073          	ecall
 ret
    1188:	8082                	ret

000000000000118a <dup>:
.global dup
dup:
 li a7, SYS_dup
    118a:	48a9                	li	a7,10
 ecall
    118c:	00000073          	ecall
 ret
    1190:	8082                	ret

0000000000001192 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
    1192:	48ad                	li	a7,11
 ecall
    1194:	00000073          	ecall
 ret
    1198:	8082                	ret

000000000000119a <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
    119a:	48b1                	li	a7,12
 ecall
    119c:	00000073          	ecall
 ret
    11a0:	8082                	ret

00000000000011a2 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
    11a2:	48b5                	li	a7,13
 ecall
    11a4:	00000073          	ecall
 ret
    11a8:	8082                	ret

00000000000011aa <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
    11aa:	48b9                	li	a7,14
 ecall
    11ac:	00000073          	ecall
 ret
    11b0:	8082                	ret

00000000000011b2 <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
    11b2:	48d9                	li	a7,22
 ecall
    11b4:	00000073          	ecall
 ret
    11b8:	8082                	ret

00000000000011ba <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
    11ba:	48dd                	li	a7,23
 ecall
    11bc:	00000073          	ecall
 ret
    11c0:	8082                	ret

00000000000011c2 <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
    11c2:	48e1                	li	a7,24
 ecall
    11c4:	00000073          	ecall
 ret
    11c8:	8082                	ret

00000000000011ca <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
    11ca:	1101                	addi	sp,sp,-32
    11cc:	ec06                	sd	ra,24(sp)
    11ce:	e822                	sd	s0,16(sp)
    11d0:	1000                	addi	s0,sp,32
    11d2:	87aa                	mv	a5,a0
    11d4:	872e                	mv	a4,a1
    11d6:	fef42623          	sw	a5,-20(s0)
    11da:	87ba                	mv	a5,a4
    11dc:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
    11e0:	feb40713          	addi	a4,s0,-21
    11e4:	fec42783          	lw	a5,-20(s0)
    11e8:	4605                	li	a2,1
    11ea:	85ba                	mv	a1,a4
    11ec:	853e                	mv	a0,a5
    11ee:	00000097          	auipc	ra,0x0
    11f2:	f44080e7          	jalr	-188(ra) # 1132 <write>
}
    11f6:	0001                	nop
    11f8:	60e2                	ld	ra,24(sp)
    11fa:	6442                	ld	s0,16(sp)
    11fc:	6105                	addi	sp,sp,32
    11fe:	8082                	ret

0000000000001200 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    1200:	7139                	addi	sp,sp,-64
    1202:	fc06                	sd	ra,56(sp)
    1204:	f822                	sd	s0,48(sp)
    1206:	0080                	addi	s0,sp,64
    1208:	87aa                	mv	a5,a0
    120a:	8736                	mv	a4,a3
    120c:	fcf42623          	sw	a5,-52(s0)
    1210:	87ae                	mv	a5,a1
    1212:	fcf42423          	sw	a5,-56(s0)
    1216:	87b2                	mv	a5,a2
    1218:	fcf42223          	sw	a5,-60(s0)
    121c:	87ba                	mv	a5,a4
    121e:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1222:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
    1226:	fc042783          	lw	a5,-64(s0)
    122a:	2781                	sext.w	a5,a5
    122c:	c38d                	beqz	a5,124e <printint+0x4e>
    122e:	fc842783          	lw	a5,-56(s0)
    1232:	2781                	sext.w	a5,a5
    1234:	0007dd63          	bgez	a5,124e <printint+0x4e>
    neg = 1;
    1238:	4785                	li	a5,1
    123a:	fef42423          	sw	a5,-24(s0)
    x = -xx;
    123e:	fc842783          	lw	a5,-56(s0)
    1242:	40f007bb          	negw	a5,a5
    1246:	2781                	sext.w	a5,a5
    1248:	fef42223          	sw	a5,-28(s0)
    124c:	a029                	j	1256 <printint+0x56>
  } else {
    x = xx;
    124e:	fc842783          	lw	a5,-56(s0)
    1252:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
    1256:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
    125a:	fc442783          	lw	a5,-60(s0)
    125e:	fe442703          	lw	a4,-28(s0)
    1262:	02f777bb          	remuw	a5,a4,a5
    1266:	0007861b          	sext.w	a2,a5
    126a:	fec42783          	lw	a5,-20(s0)
    126e:	0017871b          	addiw	a4,a5,1
    1272:	fee42623          	sw	a4,-20(s0)
    1276:	00002697          	auipc	a3,0x2
    127a:	b6a68693          	addi	a3,a3,-1174 # 2de0 <digits>
    127e:	02061713          	slli	a4,a2,0x20
    1282:	9301                	srli	a4,a4,0x20
    1284:	9736                	add	a4,a4,a3
    1286:	00074703          	lbu	a4,0(a4)
    128a:	ff040693          	addi	a3,s0,-16
    128e:	97b6                	add	a5,a5,a3
    1290:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
    1294:	fc442783          	lw	a5,-60(s0)
    1298:	fe442703          	lw	a4,-28(s0)
    129c:	02f757bb          	divuw	a5,a4,a5
    12a0:	fef42223          	sw	a5,-28(s0)
    12a4:	fe442783          	lw	a5,-28(s0)
    12a8:	2781                	sext.w	a5,a5
    12aa:	fbc5                	bnez	a5,125a <printint+0x5a>
  if(neg)
    12ac:	fe842783          	lw	a5,-24(s0)
    12b0:	2781                	sext.w	a5,a5
    12b2:	cf95                	beqz	a5,12ee <printint+0xee>
    buf[i++] = '-';
    12b4:	fec42783          	lw	a5,-20(s0)
    12b8:	0017871b          	addiw	a4,a5,1
    12bc:	fee42623          	sw	a4,-20(s0)
    12c0:	ff040713          	addi	a4,s0,-16
    12c4:	97ba                	add	a5,a5,a4
    12c6:	02d00713          	li	a4,45
    12ca:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
    12ce:	a005                	j	12ee <printint+0xee>
    putc(fd, buf[i]);
    12d0:	fec42783          	lw	a5,-20(s0)
    12d4:	ff040713          	addi	a4,s0,-16
    12d8:	97ba                	add	a5,a5,a4
    12da:	fe07c703          	lbu	a4,-32(a5)
    12de:	fcc42783          	lw	a5,-52(s0)
    12e2:	85ba                	mv	a1,a4
    12e4:	853e                	mv	a0,a5
    12e6:	00000097          	auipc	ra,0x0
    12ea:	ee4080e7          	jalr	-284(ra) # 11ca <putc>
  while(--i >= 0)
    12ee:	fec42783          	lw	a5,-20(s0)
    12f2:	37fd                	addiw	a5,a5,-1
    12f4:	fef42623          	sw	a5,-20(s0)
    12f8:	fec42783          	lw	a5,-20(s0)
    12fc:	2781                	sext.w	a5,a5
    12fe:	fc07d9e3          	bgez	a5,12d0 <printint+0xd0>
}
    1302:	0001                	nop
    1304:	0001                	nop
    1306:	70e2                	ld	ra,56(sp)
    1308:	7442                	ld	s0,48(sp)
    130a:	6121                	addi	sp,sp,64
    130c:	8082                	ret

000000000000130e <printptr>:

static void
printptr(int fd, uint64 x) {
    130e:	7179                	addi	sp,sp,-48
    1310:	f406                	sd	ra,40(sp)
    1312:	f022                	sd	s0,32(sp)
    1314:	1800                	addi	s0,sp,48
    1316:	87aa                	mv	a5,a0
    1318:	fcb43823          	sd	a1,-48(s0)
    131c:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
    1320:	fdc42783          	lw	a5,-36(s0)
    1324:	03000593          	li	a1,48
    1328:	853e                	mv	a0,a5
    132a:	00000097          	auipc	ra,0x0
    132e:	ea0080e7          	jalr	-352(ra) # 11ca <putc>
  putc(fd, 'x');
    1332:	fdc42783          	lw	a5,-36(s0)
    1336:	07800593          	li	a1,120
    133a:	853e                	mv	a0,a5
    133c:	00000097          	auipc	ra,0x0
    1340:	e8e080e7          	jalr	-370(ra) # 11ca <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    1344:	fe042623          	sw	zero,-20(s0)
    1348:	a82d                	j	1382 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
    134a:	fd043783          	ld	a5,-48(s0)
    134e:	93f1                	srli	a5,a5,0x3c
    1350:	00002717          	auipc	a4,0x2
    1354:	a9070713          	addi	a4,a4,-1392 # 2de0 <digits>
    1358:	97ba                	add	a5,a5,a4
    135a:	0007c703          	lbu	a4,0(a5)
    135e:	fdc42783          	lw	a5,-36(s0)
    1362:	85ba                	mv	a1,a4
    1364:	853e                	mv	a0,a5
    1366:	00000097          	auipc	ra,0x0
    136a:	e64080e7          	jalr	-412(ra) # 11ca <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    136e:	fec42783          	lw	a5,-20(s0)
    1372:	2785                	addiw	a5,a5,1
    1374:	fef42623          	sw	a5,-20(s0)
    1378:	fd043783          	ld	a5,-48(s0)
    137c:	0792                	slli	a5,a5,0x4
    137e:	fcf43823          	sd	a5,-48(s0)
    1382:	fec42783          	lw	a5,-20(s0)
    1386:	873e                	mv	a4,a5
    1388:	47bd                	li	a5,15
    138a:	fce7f0e3          	bgeu	a5,a4,134a <printptr+0x3c>
}
    138e:	0001                	nop
    1390:	0001                	nop
    1392:	70a2                	ld	ra,40(sp)
    1394:	7402                	ld	s0,32(sp)
    1396:	6145                	addi	sp,sp,48
    1398:	8082                	ret

000000000000139a <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
    139a:	715d                	addi	sp,sp,-80
    139c:	e486                	sd	ra,72(sp)
    139e:	e0a2                	sd	s0,64(sp)
    13a0:	0880                	addi	s0,sp,80
    13a2:	87aa                	mv	a5,a0
    13a4:	fcb43023          	sd	a1,-64(s0)
    13a8:	fac43c23          	sd	a2,-72(s0)
    13ac:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
    13b0:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
    13b4:	fe042223          	sw	zero,-28(s0)
    13b8:	a42d                	j	15e2 <vprintf+0x248>
    c = fmt[i] & 0xff;
    13ba:	fe442783          	lw	a5,-28(s0)
    13be:	fc043703          	ld	a4,-64(s0)
    13c2:	97ba                	add	a5,a5,a4
    13c4:	0007c783          	lbu	a5,0(a5)
    13c8:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
    13cc:	fe042783          	lw	a5,-32(s0)
    13d0:	2781                	sext.w	a5,a5
    13d2:	eb9d                	bnez	a5,1408 <vprintf+0x6e>
      if(c == '%'){
    13d4:	fdc42783          	lw	a5,-36(s0)
    13d8:	0007871b          	sext.w	a4,a5
    13dc:	02500793          	li	a5,37
    13e0:	00f71763          	bne	a4,a5,13ee <vprintf+0x54>
        state = '%';
    13e4:	02500793          	li	a5,37
    13e8:	fef42023          	sw	a5,-32(s0)
    13ec:	a2f5                	j	15d8 <vprintf+0x23e>
      } else {
        putc(fd, c);
    13ee:	fdc42783          	lw	a5,-36(s0)
    13f2:	0ff7f713          	andi	a4,a5,255
    13f6:	fcc42783          	lw	a5,-52(s0)
    13fa:	85ba                	mv	a1,a4
    13fc:	853e                	mv	a0,a5
    13fe:	00000097          	auipc	ra,0x0
    1402:	dcc080e7          	jalr	-564(ra) # 11ca <putc>
    1406:	aac9                	j	15d8 <vprintf+0x23e>
      }
    } else if(state == '%'){
    1408:	fe042783          	lw	a5,-32(s0)
    140c:	0007871b          	sext.w	a4,a5
    1410:	02500793          	li	a5,37
    1414:	1cf71263          	bne	a4,a5,15d8 <vprintf+0x23e>
      if(c == 'd'){
    1418:	fdc42783          	lw	a5,-36(s0)
    141c:	0007871b          	sext.w	a4,a5
    1420:	06400793          	li	a5,100
    1424:	02f71463          	bne	a4,a5,144c <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
    1428:	fb843783          	ld	a5,-72(s0)
    142c:	00878713          	addi	a4,a5,8
    1430:	fae43c23          	sd	a4,-72(s0)
    1434:	4398                	lw	a4,0(a5)
    1436:	fcc42783          	lw	a5,-52(s0)
    143a:	4685                	li	a3,1
    143c:	4629                	li	a2,10
    143e:	85ba                	mv	a1,a4
    1440:	853e                	mv	a0,a5
    1442:	00000097          	auipc	ra,0x0
    1446:	dbe080e7          	jalr	-578(ra) # 1200 <printint>
    144a:	a269                	j	15d4 <vprintf+0x23a>
      } else if(c == 'l') {
    144c:	fdc42783          	lw	a5,-36(s0)
    1450:	0007871b          	sext.w	a4,a5
    1454:	06c00793          	li	a5,108
    1458:	02f71663          	bne	a4,a5,1484 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
    145c:	fb843783          	ld	a5,-72(s0)
    1460:	00878713          	addi	a4,a5,8
    1464:	fae43c23          	sd	a4,-72(s0)
    1468:	639c                	ld	a5,0(a5)
    146a:	0007871b          	sext.w	a4,a5
    146e:	fcc42783          	lw	a5,-52(s0)
    1472:	4681                	li	a3,0
    1474:	4629                	li	a2,10
    1476:	85ba                	mv	a1,a4
    1478:	853e                	mv	a0,a5
    147a:	00000097          	auipc	ra,0x0
    147e:	d86080e7          	jalr	-634(ra) # 1200 <printint>
    1482:	aa89                	j	15d4 <vprintf+0x23a>
      } else if(c == 'x') {
    1484:	fdc42783          	lw	a5,-36(s0)
    1488:	0007871b          	sext.w	a4,a5
    148c:	07800793          	li	a5,120
    1490:	02f71463          	bne	a4,a5,14b8 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
    1494:	fb843783          	ld	a5,-72(s0)
    1498:	00878713          	addi	a4,a5,8
    149c:	fae43c23          	sd	a4,-72(s0)
    14a0:	4398                	lw	a4,0(a5)
    14a2:	fcc42783          	lw	a5,-52(s0)
    14a6:	4681                	li	a3,0
    14a8:	4641                	li	a2,16
    14aa:	85ba                	mv	a1,a4
    14ac:	853e                	mv	a0,a5
    14ae:	00000097          	auipc	ra,0x0
    14b2:	d52080e7          	jalr	-686(ra) # 1200 <printint>
    14b6:	aa39                	j	15d4 <vprintf+0x23a>
      } else if(c == 'p') {
    14b8:	fdc42783          	lw	a5,-36(s0)
    14bc:	0007871b          	sext.w	a4,a5
    14c0:	07000793          	li	a5,112
    14c4:	02f71263          	bne	a4,a5,14e8 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
    14c8:	fb843783          	ld	a5,-72(s0)
    14cc:	00878713          	addi	a4,a5,8
    14d0:	fae43c23          	sd	a4,-72(s0)
    14d4:	6398                	ld	a4,0(a5)
    14d6:	fcc42783          	lw	a5,-52(s0)
    14da:	85ba                	mv	a1,a4
    14dc:	853e                	mv	a0,a5
    14de:	00000097          	auipc	ra,0x0
    14e2:	e30080e7          	jalr	-464(ra) # 130e <printptr>
    14e6:	a0fd                	j	15d4 <vprintf+0x23a>
      } else if(c == 's'){
    14e8:	fdc42783          	lw	a5,-36(s0)
    14ec:	0007871b          	sext.w	a4,a5
    14f0:	07300793          	li	a5,115
    14f4:	04f71c63          	bne	a4,a5,154c <vprintf+0x1b2>
        s = va_arg(ap, char*);
    14f8:	fb843783          	ld	a5,-72(s0)
    14fc:	00878713          	addi	a4,a5,8
    1500:	fae43c23          	sd	a4,-72(s0)
    1504:	639c                	ld	a5,0(a5)
    1506:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
    150a:	fe843783          	ld	a5,-24(s0)
    150e:	eb8d                	bnez	a5,1540 <vprintf+0x1a6>
          s = "(null)";
    1510:	00001797          	auipc	a5,0x1
    1514:	75078793          	addi	a5,a5,1872 # 2c60 <schedule_dm+0x536>
    1518:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
    151c:	a015                	j	1540 <vprintf+0x1a6>
          putc(fd, *s);
    151e:	fe843783          	ld	a5,-24(s0)
    1522:	0007c703          	lbu	a4,0(a5)
    1526:	fcc42783          	lw	a5,-52(s0)
    152a:	85ba                	mv	a1,a4
    152c:	853e                	mv	a0,a5
    152e:	00000097          	auipc	ra,0x0
    1532:	c9c080e7          	jalr	-868(ra) # 11ca <putc>
          s++;
    1536:	fe843783          	ld	a5,-24(s0)
    153a:	0785                	addi	a5,a5,1
    153c:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
    1540:	fe843783          	ld	a5,-24(s0)
    1544:	0007c783          	lbu	a5,0(a5)
    1548:	fbf9                	bnez	a5,151e <vprintf+0x184>
    154a:	a069                	j	15d4 <vprintf+0x23a>
        }
      } else if(c == 'c'){
    154c:	fdc42783          	lw	a5,-36(s0)
    1550:	0007871b          	sext.w	a4,a5
    1554:	06300793          	li	a5,99
    1558:	02f71463          	bne	a4,a5,1580 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
    155c:	fb843783          	ld	a5,-72(s0)
    1560:	00878713          	addi	a4,a5,8
    1564:	fae43c23          	sd	a4,-72(s0)
    1568:	439c                	lw	a5,0(a5)
    156a:	0ff7f713          	andi	a4,a5,255
    156e:	fcc42783          	lw	a5,-52(s0)
    1572:	85ba                	mv	a1,a4
    1574:	853e                	mv	a0,a5
    1576:	00000097          	auipc	ra,0x0
    157a:	c54080e7          	jalr	-940(ra) # 11ca <putc>
    157e:	a899                	j	15d4 <vprintf+0x23a>
      } else if(c == '%'){
    1580:	fdc42783          	lw	a5,-36(s0)
    1584:	0007871b          	sext.w	a4,a5
    1588:	02500793          	li	a5,37
    158c:	00f71f63          	bne	a4,a5,15aa <vprintf+0x210>
        putc(fd, c);
    1590:	fdc42783          	lw	a5,-36(s0)
    1594:	0ff7f713          	andi	a4,a5,255
    1598:	fcc42783          	lw	a5,-52(s0)
    159c:	85ba                	mv	a1,a4
    159e:	853e                	mv	a0,a5
    15a0:	00000097          	auipc	ra,0x0
    15a4:	c2a080e7          	jalr	-982(ra) # 11ca <putc>
    15a8:	a035                	j	15d4 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    15aa:	fcc42783          	lw	a5,-52(s0)
    15ae:	02500593          	li	a1,37
    15b2:	853e                	mv	a0,a5
    15b4:	00000097          	auipc	ra,0x0
    15b8:	c16080e7          	jalr	-1002(ra) # 11ca <putc>
        putc(fd, c);
    15bc:	fdc42783          	lw	a5,-36(s0)
    15c0:	0ff7f713          	andi	a4,a5,255
    15c4:	fcc42783          	lw	a5,-52(s0)
    15c8:	85ba                	mv	a1,a4
    15ca:	853e                	mv	a0,a5
    15cc:	00000097          	auipc	ra,0x0
    15d0:	bfe080e7          	jalr	-1026(ra) # 11ca <putc>
      }
      state = 0;
    15d4:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
    15d8:	fe442783          	lw	a5,-28(s0)
    15dc:	2785                	addiw	a5,a5,1
    15de:	fef42223          	sw	a5,-28(s0)
    15e2:	fe442783          	lw	a5,-28(s0)
    15e6:	fc043703          	ld	a4,-64(s0)
    15ea:	97ba                	add	a5,a5,a4
    15ec:	0007c783          	lbu	a5,0(a5)
    15f0:	dc0795e3          	bnez	a5,13ba <vprintf+0x20>
    }
  }
}
    15f4:	0001                	nop
    15f6:	0001                	nop
    15f8:	60a6                	ld	ra,72(sp)
    15fa:	6406                	ld	s0,64(sp)
    15fc:	6161                	addi	sp,sp,80
    15fe:	8082                	ret

0000000000001600 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
    1600:	7159                	addi	sp,sp,-112
    1602:	fc06                	sd	ra,56(sp)
    1604:	f822                	sd	s0,48(sp)
    1606:	0080                	addi	s0,sp,64
    1608:	fcb43823          	sd	a1,-48(s0)
    160c:	e010                	sd	a2,0(s0)
    160e:	e414                	sd	a3,8(s0)
    1610:	e818                	sd	a4,16(s0)
    1612:	ec1c                	sd	a5,24(s0)
    1614:	03043023          	sd	a6,32(s0)
    1618:	03143423          	sd	a7,40(s0)
    161c:	87aa                	mv	a5,a0
    161e:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
    1622:	03040793          	addi	a5,s0,48
    1626:	fcf43423          	sd	a5,-56(s0)
    162a:	fc843783          	ld	a5,-56(s0)
    162e:	fd078793          	addi	a5,a5,-48
    1632:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
    1636:	fe843703          	ld	a4,-24(s0)
    163a:	fdc42783          	lw	a5,-36(s0)
    163e:	863a                	mv	a2,a4
    1640:	fd043583          	ld	a1,-48(s0)
    1644:	853e                	mv	a0,a5
    1646:	00000097          	auipc	ra,0x0
    164a:	d54080e7          	jalr	-684(ra) # 139a <vprintf>
}
    164e:	0001                	nop
    1650:	70e2                	ld	ra,56(sp)
    1652:	7442                	ld	s0,48(sp)
    1654:	6165                	addi	sp,sp,112
    1656:	8082                	ret

0000000000001658 <printf>:

void
printf(const char *fmt, ...)
{
    1658:	7159                	addi	sp,sp,-112
    165a:	f406                	sd	ra,40(sp)
    165c:	f022                	sd	s0,32(sp)
    165e:	1800                	addi	s0,sp,48
    1660:	fca43c23          	sd	a0,-40(s0)
    1664:	e40c                	sd	a1,8(s0)
    1666:	e810                	sd	a2,16(s0)
    1668:	ec14                	sd	a3,24(s0)
    166a:	f018                	sd	a4,32(s0)
    166c:	f41c                	sd	a5,40(s0)
    166e:	03043823          	sd	a6,48(s0)
    1672:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
    1676:	04040793          	addi	a5,s0,64
    167a:	fcf43823          	sd	a5,-48(s0)
    167e:	fd043783          	ld	a5,-48(s0)
    1682:	fc878793          	addi	a5,a5,-56
    1686:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
    168a:	fe843783          	ld	a5,-24(s0)
    168e:	863e                	mv	a2,a5
    1690:	fd843583          	ld	a1,-40(s0)
    1694:	4505                	li	a0,1
    1696:	00000097          	auipc	ra,0x0
    169a:	d04080e7          	jalr	-764(ra) # 139a <vprintf>
}
    169e:	0001                	nop
    16a0:	70a2                	ld	ra,40(sp)
    16a2:	7402                	ld	s0,32(sp)
    16a4:	6165                	addi	sp,sp,112
    16a6:	8082                	ret

00000000000016a8 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    16a8:	7179                	addi	sp,sp,-48
    16aa:	f422                	sd	s0,40(sp)
    16ac:	1800                	addi	s0,sp,48
    16ae:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
    16b2:	fd843783          	ld	a5,-40(s0)
    16b6:	17c1                	addi	a5,a5,-16
    16b8:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16bc:	00001797          	auipc	a5,0x1
    16c0:	77c78793          	addi	a5,a5,1916 # 2e38 <freep>
    16c4:	639c                	ld	a5,0(a5)
    16c6:	fef43423          	sd	a5,-24(s0)
    16ca:	a815                	j	16fe <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16cc:	fe843783          	ld	a5,-24(s0)
    16d0:	639c                	ld	a5,0(a5)
    16d2:	fe843703          	ld	a4,-24(s0)
    16d6:	00f76f63          	bltu	a4,a5,16f4 <free+0x4c>
    16da:	fe043703          	ld	a4,-32(s0)
    16de:	fe843783          	ld	a5,-24(s0)
    16e2:	02e7eb63          	bltu	a5,a4,1718 <free+0x70>
    16e6:	fe843783          	ld	a5,-24(s0)
    16ea:	639c                	ld	a5,0(a5)
    16ec:	fe043703          	ld	a4,-32(s0)
    16f0:	02f76463          	bltu	a4,a5,1718 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16f4:	fe843783          	ld	a5,-24(s0)
    16f8:	639c                	ld	a5,0(a5)
    16fa:	fef43423          	sd	a5,-24(s0)
    16fe:	fe043703          	ld	a4,-32(s0)
    1702:	fe843783          	ld	a5,-24(s0)
    1706:	fce7f3e3          	bgeu	a5,a4,16cc <free+0x24>
    170a:	fe843783          	ld	a5,-24(s0)
    170e:	639c                	ld	a5,0(a5)
    1710:	fe043703          	ld	a4,-32(s0)
    1714:	faf77ce3          	bgeu	a4,a5,16cc <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1718:	fe043783          	ld	a5,-32(s0)
    171c:	479c                	lw	a5,8(a5)
    171e:	1782                	slli	a5,a5,0x20
    1720:	9381                	srli	a5,a5,0x20
    1722:	0792                	slli	a5,a5,0x4
    1724:	fe043703          	ld	a4,-32(s0)
    1728:	973e                	add	a4,a4,a5
    172a:	fe843783          	ld	a5,-24(s0)
    172e:	639c                	ld	a5,0(a5)
    1730:	02f71763          	bne	a4,a5,175e <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
    1734:	fe043783          	ld	a5,-32(s0)
    1738:	4798                	lw	a4,8(a5)
    173a:	fe843783          	ld	a5,-24(s0)
    173e:	639c                	ld	a5,0(a5)
    1740:	479c                	lw	a5,8(a5)
    1742:	9fb9                	addw	a5,a5,a4
    1744:	0007871b          	sext.w	a4,a5
    1748:	fe043783          	ld	a5,-32(s0)
    174c:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
    174e:	fe843783          	ld	a5,-24(s0)
    1752:	639c                	ld	a5,0(a5)
    1754:	6398                	ld	a4,0(a5)
    1756:	fe043783          	ld	a5,-32(s0)
    175a:	e398                	sd	a4,0(a5)
    175c:	a039                	j	176a <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
    175e:	fe843783          	ld	a5,-24(s0)
    1762:	6398                	ld	a4,0(a5)
    1764:	fe043783          	ld	a5,-32(s0)
    1768:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
    176a:	fe843783          	ld	a5,-24(s0)
    176e:	479c                	lw	a5,8(a5)
    1770:	1782                	slli	a5,a5,0x20
    1772:	9381                	srli	a5,a5,0x20
    1774:	0792                	slli	a5,a5,0x4
    1776:	fe843703          	ld	a4,-24(s0)
    177a:	97ba                	add	a5,a5,a4
    177c:	fe043703          	ld	a4,-32(s0)
    1780:	02f71563          	bne	a4,a5,17aa <free+0x102>
    p->s.size += bp->s.size;
    1784:	fe843783          	ld	a5,-24(s0)
    1788:	4798                	lw	a4,8(a5)
    178a:	fe043783          	ld	a5,-32(s0)
    178e:	479c                	lw	a5,8(a5)
    1790:	9fb9                	addw	a5,a5,a4
    1792:	0007871b          	sext.w	a4,a5
    1796:	fe843783          	ld	a5,-24(s0)
    179a:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
    179c:	fe043783          	ld	a5,-32(s0)
    17a0:	6398                	ld	a4,0(a5)
    17a2:	fe843783          	ld	a5,-24(s0)
    17a6:	e398                	sd	a4,0(a5)
    17a8:	a031                	j	17b4 <free+0x10c>
  } else
    p->s.ptr = bp;
    17aa:	fe843783          	ld	a5,-24(s0)
    17ae:	fe043703          	ld	a4,-32(s0)
    17b2:	e398                	sd	a4,0(a5)
  freep = p;
    17b4:	00001797          	auipc	a5,0x1
    17b8:	68478793          	addi	a5,a5,1668 # 2e38 <freep>
    17bc:	fe843703          	ld	a4,-24(s0)
    17c0:	e398                	sd	a4,0(a5)
}
    17c2:	0001                	nop
    17c4:	7422                	ld	s0,40(sp)
    17c6:	6145                	addi	sp,sp,48
    17c8:	8082                	ret

00000000000017ca <morecore>:

static Header*
morecore(uint nu)
{
    17ca:	7179                	addi	sp,sp,-48
    17cc:	f406                	sd	ra,40(sp)
    17ce:	f022                	sd	s0,32(sp)
    17d0:	1800                	addi	s0,sp,48
    17d2:	87aa                	mv	a5,a0
    17d4:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
    17d8:	fdc42783          	lw	a5,-36(s0)
    17dc:	0007871b          	sext.w	a4,a5
    17e0:	6785                	lui	a5,0x1
    17e2:	00f77563          	bgeu	a4,a5,17ec <morecore+0x22>
    nu = 4096;
    17e6:	6785                	lui	a5,0x1
    17e8:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
    17ec:	fdc42783          	lw	a5,-36(s0)
    17f0:	0047979b          	slliw	a5,a5,0x4
    17f4:	2781                	sext.w	a5,a5
    17f6:	2781                	sext.w	a5,a5
    17f8:	853e                	mv	a0,a5
    17fa:	00000097          	auipc	ra,0x0
    17fe:	9a0080e7          	jalr	-1632(ra) # 119a <sbrk>
    1802:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
    1806:	fe843703          	ld	a4,-24(s0)
    180a:	57fd                	li	a5,-1
    180c:	00f71463          	bne	a4,a5,1814 <morecore+0x4a>
    return 0;
    1810:	4781                	li	a5,0
    1812:	a03d                	j	1840 <morecore+0x76>
  hp = (Header*)p;
    1814:	fe843783          	ld	a5,-24(s0)
    1818:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
    181c:	fe043783          	ld	a5,-32(s0)
    1820:	fdc42703          	lw	a4,-36(s0)
    1824:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
    1826:	fe043783          	ld	a5,-32(s0)
    182a:	07c1                	addi	a5,a5,16
    182c:	853e                	mv	a0,a5
    182e:	00000097          	auipc	ra,0x0
    1832:	e7a080e7          	jalr	-390(ra) # 16a8 <free>
  return freep;
    1836:	00001797          	auipc	a5,0x1
    183a:	60278793          	addi	a5,a5,1538 # 2e38 <freep>
    183e:	639c                	ld	a5,0(a5)
}
    1840:	853e                	mv	a0,a5
    1842:	70a2                	ld	ra,40(sp)
    1844:	7402                	ld	s0,32(sp)
    1846:	6145                	addi	sp,sp,48
    1848:	8082                	ret

000000000000184a <malloc>:

void*
malloc(uint nbytes)
{
    184a:	7139                	addi	sp,sp,-64
    184c:	fc06                	sd	ra,56(sp)
    184e:	f822                	sd	s0,48(sp)
    1850:	0080                	addi	s0,sp,64
    1852:	87aa                	mv	a5,a0
    1854:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1858:	fcc46783          	lwu	a5,-52(s0)
    185c:	07bd                	addi	a5,a5,15
    185e:	8391                	srli	a5,a5,0x4
    1860:	2781                	sext.w	a5,a5
    1862:	2785                	addiw	a5,a5,1
    1864:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
    1868:	00001797          	auipc	a5,0x1
    186c:	5d078793          	addi	a5,a5,1488 # 2e38 <freep>
    1870:	639c                	ld	a5,0(a5)
    1872:	fef43023          	sd	a5,-32(s0)
    1876:	fe043783          	ld	a5,-32(s0)
    187a:	ef95                	bnez	a5,18b6 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
    187c:	00001797          	auipc	a5,0x1
    1880:	5ac78793          	addi	a5,a5,1452 # 2e28 <base>
    1884:	fef43023          	sd	a5,-32(s0)
    1888:	00001797          	auipc	a5,0x1
    188c:	5b078793          	addi	a5,a5,1456 # 2e38 <freep>
    1890:	fe043703          	ld	a4,-32(s0)
    1894:	e398                	sd	a4,0(a5)
    1896:	00001797          	auipc	a5,0x1
    189a:	5a278793          	addi	a5,a5,1442 # 2e38 <freep>
    189e:	6398                	ld	a4,0(a5)
    18a0:	00001797          	auipc	a5,0x1
    18a4:	58878793          	addi	a5,a5,1416 # 2e28 <base>
    18a8:	e398                	sd	a4,0(a5)
    base.s.size = 0;
    18aa:	00001797          	auipc	a5,0x1
    18ae:	57e78793          	addi	a5,a5,1406 # 2e28 <base>
    18b2:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    18b6:	fe043783          	ld	a5,-32(s0)
    18ba:	639c                	ld	a5,0(a5)
    18bc:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    18c0:	fe843783          	ld	a5,-24(s0)
    18c4:	4798                	lw	a4,8(a5)
    18c6:	fdc42783          	lw	a5,-36(s0)
    18ca:	2781                	sext.w	a5,a5
    18cc:	06f76863          	bltu	a4,a5,193c <malloc+0xf2>
      if(p->s.size == nunits)
    18d0:	fe843783          	ld	a5,-24(s0)
    18d4:	4798                	lw	a4,8(a5)
    18d6:	fdc42783          	lw	a5,-36(s0)
    18da:	2781                	sext.w	a5,a5
    18dc:	00e79963          	bne	a5,a4,18ee <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
    18e0:	fe843783          	ld	a5,-24(s0)
    18e4:	6398                	ld	a4,0(a5)
    18e6:	fe043783          	ld	a5,-32(s0)
    18ea:	e398                	sd	a4,0(a5)
    18ec:	a82d                	j	1926 <malloc+0xdc>
      else {
        p->s.size -= nunits;
    18ee:	fe843783          	ld	a5,-24(s0)
    18f2:	4798                	lw	a4,8(a5)
    18f4:	fdc42783          	lw	a5,-36(s0)
    18f8:	40f707bb          	subw	a5,a4,a5
    18fc:	0007871b          	sext.w	a4,a5
    1900:	fe843783          	ld	a5,-24(s0)
    1904:	c798                	sw	a4,8(a5)
        p += p->s.size;
    1906:	fe843783          	ld	a5,-24(s0)
    190a:	479c                	lw	a5,8(a5)
    190c:	1782                	slli	a5,a5,0x20
    190e:	9381                	srli	a5,a5,0x20
    1910:	0792                	slli	a5,a5,0x4
    1912:	fe843703          	ld	a4,-24(s0)
    1916:	97ba                	add	a5,a5,a4
    1918:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
    191c:	fe843783          	ld	a5,-24(s0)
    1920:	fdc42703          	lw	a4,-36(s0)
    1924:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
    1926:	00001797          	auipc	a5,0x1
    192a:	51278793          	addi	a5,a5,1298 # 2e38 <freep>
    192e:	fe043703          	ld	a4,-32(s0)
    1932:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
    1934:	fe843783          	ld	a5,-24(s0)
    1938:	07c1                	addi	a5,a5,16
    193a:	a091                	j	197e <malloc+0x134>
    }
    if(p == freep)
    193c:	00001797          	auipc	a5,0x1
    1940:	4fc78793          	addi	a5,a5,1276 # 2e38 <freep>
    1944:	639c                	ld	a5,0(a5)
    1946:	fe843703          	ld	a4,-24(s0)
    194a:	02f71063          	bne	a4,a5,196a <malloc+0x120>
      if((p = morecore(nunits)) == 0)
    194e:	fdc42783          	lw	a5,-36(s0)
    1952:	853e                	mv	a0,a5
    1954:	00000097          	auipc	ra,0x0
    1958:	e76080e7          	jalr	-394(ra) # 17ca <morecore>
    195c:	fea43423          	sd	a0,-24(s0)
    1960:	fe843783          	ld	a5,-24(s0)
    1964:	e399                	bnez	a5,196a <malloc+0x120>
        return 0;
    1966:	4781                	li	a5,0
    1968:	a819                	j	197e <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    196a:	fe843783          	ld	a5,-24(s0)
    196e:	fef43023          	sd	a5,-32(s0)
    1972:	fe843783          	ld	a5,-24(s0)
    1976:	639c                	ld	a5,0(a5)
    1978:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    197c:	b791                	j	18c0 <malloc+0x76>
  }
}
    197e:	853e                	mv	a0,a5
    1980:	70e2                	ld	ra,56(sp)
    1982:	7442                	ld	s0,48(sp)
    1984:	6121                	addi	sp,sp,64
    1986:	8082                	ret

0000000000001988 <setjmp>:
    1988:	e100                	sd	s0,0(a0)
    198a:	e504                	sd	s1,8(a0)
    198c:	01253823          	sd	s2,16(a0)
    1990:	01353c23          	sd	s3,24(a0)
    1994:	03453023          	sd	s4,32(a0)
    1998:	03553423          	sd	s5,40(a0)
    199c:	03653823          	sd	s6,48(a0)
    19a0:	03753c23          	sd	s7,56(a0)
    19a4:	05853023          	sd	s8,64(a0)
    19a8:	05953423          	sd	s9,72(a0)
    19ac:	05a53823          	sd	s10,80(a0)
    19b0:	05b53c23          	sd	s11,88(a0)
    19b4:	06153023          	sd	ra,96(a0)
    19b8:	06253423          	sd	sp,104(a0)
    19bc:	4501                	li	a0,0
    19be:	8082                	ret

00000000000019c0 <longjmp>:
    19c0:	6100                	ld	s0,0(a0)
    19c2:	6504                	ld	s1,8(a0)
    19c4:	01053903          	ld	s2,16(a0)
    19c8:	01853983          	ld	s3,24(a0)
    19cc:	02053a03          	ld	s4,32(a0)
    19d0:	02853a83          	ld	s5,40(a0)
    19d4:	03053b03          	ld	s6,48(a0)
    19d8:	03853b83          	ld	s7,56(a0)
    19dc:	04053c03          	ld	s8,64(a0)
    19e0:	04853c83          	ld	s9,72(a0)
    19e4:	05053d03          	ld	s10,80(a0)
    19e8:	05853d83          	ld	s11,88(a0)
    19ec:	06053083          	ld	ra,96(a0)
    19f0:	06853103          	ld	sp,104(a0)
    19f4:	c199                	beqz	a1,19fa <longjmp_1>
    19f6:	852e                	mv	a0,a1
    19f8:	8082                	ret

00000000000019fa <longjmp_1>:
    19fa:	4505                	li	a0,1
    19fc:	8082                	ret

00000000000019fe <__list_add>:
 * the prev/next entries already!
 */
static inline void __list_add(struct list_head *new_entry,
                              struct list_head *prev,
                              struct list_head *next)
{
    19fe:	7179                	addi	sp,sp,-48
    1a00:	f422                	sd	s0,40(sp)
    1a02:	1800                	addi	s0,sp,48
    1a04:	fea43423          	sd	a0,-24(s0)
    1a08:	feb43023          	sd	a1,-32(s0)
    1a0c:	fcc43c23          	sd	a2,-40(s0)
    next->prev = new_entry;
    1a10:	fd843783          	ld	a5,-40(s0)
    1a14:	fe843703          	ld	a4,-24(s0)
    1a18:	e798                	sd	a4,8(a5)
    new_entry->next = next;
    1a1a:	fe843783          	ld	a5,-24(s0)
    1a1e:	fd843703          	ld	a4,-40(s0)
    1a22:	e398                	sd	a4,0(a5)
    new_entry->prev = prev;
    1a24:	fe843783          	ld	a5,-24(s0)
    1a28:	fe043703          	ld	a4,-32(s0)
    1a2c:	e798                	sd	a4,8(a5)
    prev->next = new_entry;
    1a2e:	fe043783          	ld	a5,-32(s0)
    1a32:	fe843703          	ld	a4,-24(s0)
    1a36:	e398                	sd	a4,0(a5)
}
    1a38:	0001                	nop
    1a3a:	7422                	ld	s0,40(sp)
    1a3c:	6145                	addi	sp,sp,48
    1a3e:	8082                	ret

0000000000001a40 <list_add_tail>:
 *
 * Insert a new entry before the specified head.
 * This is useful for implementing queues.
 */
static inline void list_add_tail(struct list_head *new_entry, struct list_head *head)
{
    1a40:	1101                	addi	sp,sp,-32
    1a42:	ec06                	sd	ra,24(sp)
    1a44:	e822                	sd	s0,16(sp)
    1a46:	1000                	addi	s0,sp,32
    1a48:	fea43423          	sd	a0,-24(s0)
    1a4c:	feb43023          	sd	a1,-32(s0)
    __list_add(new_entry, head->prev, head);
    1a50:	fe043783          	ld	a5,-32(s0)
    1a54:	679c                	ld	a5,8(a5)
    1a56:	fe043603          	ld	a2,-32(s0)
    1a5a:	85be                	mv	a1,a5
    1a5c:	fe843503          	ld	a0,-24(s0)
    1a60:	00000097          	auipc	ra,0x0
    1a64:	f9e080e7          	jalr	-98(ra) # 19fe <__list_add>
}
    1a68:	0001                	nop
    1a6a:	60e2                	ld	ra,24(sp)
    1a6c:	6442                	ld	s0,16(sp)
    1a6e:	6105                	addi	sp,sp,32
    1a70:	8082                	ret

0000000000001a72 <__list_del>:
 *
 * This is only for internal list manipulation where we know
 * the prev/next entries already!
 */
static inline void __list_del(struct list_head *prev, struct list_head *next)
{
    1a72:	1101                	addi	sp,sp,-32
    1a74:	ec22                	sd	s0,24(sp)
    1a76:	1000                	addi	s0,sp,32
    1a78:	fea43423          	sd	a0,-24(s0)
    1a7c:	feb43023          	sd	a1,-32(s0)
    next->prev = prev;
    1a80:	fe043783          	ld	a5,-32(s0)
    1a84:	fe843703          	ld	a4,-24(s0)
    1a88:	e798                	sd	a4,8(a5)
    prev->next = next;
    1a8a:	fe843783          	ld	a5,-24(s0)
    1a8e:	fe043703          	ld	a4,-32(s0)
    1a92:	e398                	sd	a4,0(a5)
}
    1a94:	0001                	nop
    1a96:	6462                	ld	s0,24(sp)
    1a98:	6105                	addi	sp,sp,32
    1a9a:	8082                	ret

0000000000001a9c <list_del>:
 * @entry: the element to delete from the list.
 * Note: list_empty on entry does not return true after this, the entry is
 * in an undefined state.
 */
static inline void list_del(struct list_head *entry)
{
    1a9c:	1101                	addi	sp,sp,-32
    1a9e:	ec06                	sd	ra,24(sp)
    1aa0:	e822                	sd	s0,16(sp)
    1aa2:	1000                	addi	s0,sp,32
    1aa4:	fea43423          	sd	a0,-24(s0)
    __list_del(entry->prev, entry->next);
    1aa8:	fe843783          	ld	a5,-24(s0)
    1aac:	6798                	ld	a4,8(a5)
    1aae:	fe843783          	ld	a5,-24(s0)
    1ab2:	639c                	ld	a5,0(a5)
    1ab4:	85be                	mv	a1,a5
    1ab6:	853a                	mv	a0,a4
    1ab8:	00000097          	auipc	ra,0x0
    1abc:	fba080e7          	jalr	-70(ra) # 1a72 <__list_del>
    entry->next = LIST_POISON1;
    1ac0:	fe843783          	ld	a5,-24(s0)
    1ac4:	00100737          	lui	a4,0x100
    1ac8:	10070713          	addi	a4,a4,256 # 100100 <__global_pointer$+0xfcb20>
    1acc:	e398                	sd	a4,0(a5)
    entry->prev = LIST_POISON2;
    1ace:	fe843783          	ld	a5,-24(s0)
    1ad2:	00200737          	lui	a4,0x200
    1ad6:	20070713          	addi	a4,a4,512 # 200200 <__global_pointer$+0x1fcc20>
    1ada:	e798                	sd	a4,8(a5)
}
    1adc:	0001                	nop
    1ade:	60e2                	ld	ra,24(sp)
    1ae0:	6442                	ld	s0,16(sp)
    1ae2:	6105                	addi	sp,sp,32
    1ae4:	8082                	ret

0000000000001ae6 <list_empty>:
/**
 * list_empty - tests whether a list is empty
 * @head: the list to test.
 */
static inline int list_empty(const struct list_head *head)
{
    1ae6:	1101                	addi	sp,sp,-32
    1ae8:	ec22                	sd	s0,24(sp)
    1aea:	1000                	addi	s0,sp,32
    1aec:	fea43423          	sd	a0,-24(s0)
    return head->next == head;
    1af0:	fe843783          	ld	a5,-24(s0)
    1af4:	639c                	ld	a5,0(a5)
    1af6:	fe843703          	ld	a4,-24(s0)
    1afa:	40f707b3          	sub	a5,a4,a5
    1afe:	0017b793          	seqz	a5,a5
    1b02:	0ff7f793          	andi	a5,a5,255
    1b06:	2781                	sext.w	a5,a5
}
    1b08:	853e                	mv	a0,a5
    1b0a:	6462                	ld	s0,24(sp)
    1b0c:	6105                	addi	sp,sp,32
    1b0e:	8082                	ret

0000000000001b10 <thread_create>:

void __dispatch(void);
void __schedule(void);

struct thread *thread_create(void (*f)(void *), void *arg, int is_real_time, int processing_time, int period, int n)
{
    1b10:	715d                	addi	sp,sp,-80
    1b12:	e486                	sd	ra,72(sp)
    1b14:	e0a2                	sd	s0,64(sp)
    1b16:	0880                	addi	s0,sp,80
    1b18:	fca43423          	sd	a0,-56(s0)
    1b1c:	fcb43023          	sd	a1,-64(s0)
    1b20:	85b2                	mv	a1,a2
    1b22:	8636                	mv	a2,a3
    1b24:	86ba                	mv	a3,a4
    1b26:	873e                	mv	a4,a5
    1b28:	87ae                	mv	a5,a1
    1b2a:	faf42e23          	sw	a5,-68(s0)
    1b2e:	87b2                	mv	a5,a2
    1b30:	faf42c23          	sw	a5,-72(s0)
    1b34:	87b6                	mv	a5,a3
    1b36:	faf42a23          	sw	a5,-76(s0)
    1b3a:	87ba                	mv	a5,a4
    1b3c:	faf42823          	sw	a5,-80(s0)
    static int _id = 1;
    struct thread *t = (struct thread *)malloc(sizeof(struct thread));
    1b40:	08000513          	li	a0,128
    1b44:	00000097          	auipc	ra,0x0
    1b48:	d06080e7          	jalr	-762(ra) # 184a <malloc>
    1b4c:	fea43423          	sd	a0,-24(s0)
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long)malloc(sizeof(unsigned long) * 0x200);
    1b50:	6505                	lui	a0,0x1
    1b52:	00000097          	auipc	ra,0x0
    1b56:	cf8080e7          	jalr	-776(ra) # 184a <malloc>
    1b5a:	87aa                	mv	a5,a0
    1b5c:	fef43023          	sd	a5,-32(s0)
    new_stack_p = new_stack + 0x200 * 8 - 0x2 * 8;
    1b60:	fe043703          	ld	a4,-32(s0)
    1b64:	6785                	lui	a5,0x1
    1b66:	17c1                	addi	a5,a5,-16
    1b68:	97ba                	add	a5,a5,a4
    1b6a:	fcf43c23          	sd	a5,-40(s0)
    t->fp = f;
    1b6e:	fe843783          	ld	a5,-24(s0)
    1b72:	fc843703          	ld	a4,-56(s0)
    1b76:	e398                	sd	a4,0(a5)
    t->arg = arg;
    1b78:	fe843783          	ld	a5,-24(s0)
    1b7c:	fc043703          	ld	a4,-64(s0)
    1b80:	e798                	sd	a4,8(a5)
    t->ID = _id++;
    1b82:	00001797          	auipc	a5,0x1
    1b86:	29a78793          	addi	a5,a5,666 # 2e1c <_id.1239>
    1b8a:	439c                	lw	a5,0(a5)
    1b8c:	0017871b          	addiw	a4,a5,1
    1b90:	0007069b          	sext.w	a3,a4
    1b94:	00001717          	auipc	a4,0x1
    1b98:	28870713          	addi	a4,a4,648 # 2e1c <_id.1239>
    1b9c:	c314                	sw	a3,0(a4)
    1b9e:	fe843703          	ld	a4,-24(s0)
    1ba2:	df5c                	sw	a5,60(a4)
    t->buf_set = 0;
    1ba4:	fe843783          	ld	a5,-24(s0)
    1ba8:	0207a023          	sw	zero,32(a5)
    t->stack = (void *)new_stack;
    1bac:	fe043703          	ld	a4,-32(s0)
    1bb0:	fe843783          	ld	a5,-24(s0)
    1bb4:	eb98                	sd	a4,16(a5)
    t->stack_p = (void *)new_stack_p;
    1bb6:	fd843703          	ld	a4,-40(s0)
    1bba:	fe843783          	ld	a5,-24(s0)
    1bbe:	ef98                	sd	a4,24(a5)

    t->processing_time = processing_time;
    1bc0:	fe843783          	ld	a5,-24(s0)
    1bc4:	fb842703          	lw	a4,-72(s0)
    1bc8:	c3f8                	sw	a4,68(a5)
    t->period = period;
    1bca:	fe843783          	ld	a5,-24(s0)
    1bce:	fb442703          	lw	a4,-76(s0)
    1bd2:	c7f8                	sw	a4,76(a5)
    t->deadline = period;
    1bd4:	fe843783          	ld	a5,-24(s0)
    1bd8:	fb442703          	lw	a4,-76(s0)
    1bdc:	c7b8                	sw	a4,72(a5)
    t->n = n;
    1bde:	fe843783          	ld	a5,-24(s0)
    1be2:	fb042703          	lw	a4,-80(s0)
    1be6:	cbb8                	sw	a4,80(a5)
    t->is_real_time = is_real_time;
    1be8:	fe843783          	ld	a5,-24(s0)
    1bec:	fbc42703          	lw	a4,-68(s0)
    1bf0:	c3b8                	sw	a4,64(a5)
    t->remaining_time = processing_time;
    1bf2:	fe843783          	ld	a5,-24(s0)
    1bf6:	fb842703          	lw	a4,-72(s0)
    1bfa:	cbf8                	sw	a4,84(a5)
    t->current_deadline = 0;
    1bfc:	fe843783          	ld	a5,-24(s0)
    1c00:	0407ac23          	sw	zero,88(a5)
    t->priority = 100;
    1c04:	fe843783          	ld	a5,-24(s0)
    1c08:	06400713          	li	a4,100
    1c0c:	cff8                	sw	a4,92(a5)
    t->arrival_time = 30000;
    1c0e:	fe843783          	ld	a5,-24(s0)
    1c12:	671d                	lui	a4,0x7
    1c14:	5307071b          	addiw	a4,a4,1328
    1c18:	d3b8                	sw	a4,96(a5)
    
    return t;
    1c1a:	fe843783          	ld	a5,-24(s0)
}
    1c1e:	853e                	mv	a0,a5
    1c20:	60a6                	ld	ra,72(sp)
    1c22:	6406                	ld	s0,64(sp)
    1c24:	6161                	addi	sp,sp,80
    1c26:	8082                	ret

0000000000001c28 <thread_set_priority>:

void thread_set_priority(struct thread *t, int priority)
{
    1c28:	1101                	addi	sp,sp,-32
    1c2a:	ec22                	sd	s0,24(sp)
    1c2c:	1000                	addi	s0,sp,32
    1c2e:	fea43423          	sd	a0,-24(s0)
    1c32:	87ae                	mv	a5,a1
    1c34:	fef42223          	sw	a5,-28(s0)
    t->priority = priority;
    1c38:	fe843783          	ld	a5,-24(s0)
    1c3c:	fe442703          	lw	a4,-28(s0)
    1c40:	cff8                	sw	a4,92(a5)
}
    1c42:	0001                	nop
    1c44:	6462                	ld	s0,24(sp)
    1c46:	6105                	addi	sp,sp,32
    1c48:	8082                	ret

0000000000001c4a <init_thread_cbs>:
void init_thread_cbs(struct thread *t, int budget, int is_hard_rt)
{
    1c4a:	1101                	addi	sp,sp,-32
    1c4c:	ec22                	sd	s0,24(sp)
    1c4e:	1000                	addi	s0,sp,32
    1c50:	fea43423          	sd	a0,-24(s0)
    1c54:	87ae                	mv	a5,a1
    1c56:	8732                	mv	a4,a2
    1c58:	fef42223          	sw	a5,-28(s0)
    1c5c:	87ba                	mv	a5,a4
    1c5e:	fef42023          	sw	a5,-32(s0)
    t->cbs.budget = budget;
    1c62:	fe843783          	ld	a5,-24(s0)
    1c66:	fe442703          	lw	a4,-28(s0)
    1c6a:	d3f8                	sw	a4,100(a5)
    t->cbs.remaining_budget = budget; 
    1c6c:	fe843783          	ld	a5,-24(s0)
    1c70:	fe442703          	lw	a4,-28(s0)
    1c74:	d7b8                	sw	a4,104(a5)
    t->cbs.is_hard_rt = is_hard_rt;
    1c76:	fe843783          	ld	a5,-24(s0)
    1c7a:	fe042703          	lw	a4,-32(s0)
    1c7e:	d7f8                	sw	a4,108(a5)
    t->cbs.is_throttled = 0;
    1c80:	fe843783          	ld	a5,-24(s0)
    1c84:	0607a823          	sw	zero,112(a5)
    t->cbs.throttled_arrived_time = 0;
    1c88:	fe843783          	ld	a5,-24(s0)
    1c8c:	0607aa23          	sw	zero,116(a5)
    t->cbs.throttle_new_deadline = 0;
    1c90:	fe843783          	ld	a5,-24(s0)
    1c94:	0607ac23          	sw	zero,120(a5)
}
    1c98:	0001                	nop
    1c9a:	6462                	ld	s0,24(sp)
    1c9c:	6105                	addi	sp,sp,32
    1c9e:	8082                	ret

0000000000001ca0 <thread_add_at>:
void thread_add_at(struct thread *t, int arrival_time)
{
    1ca0:	7179                	addi	sp,sp,-48
    1ca2:	f406                	sd	ra,40(sp)
    1ca4:	f022                	sd	s0,32(sp)
    1ca6:	1800                	addi	s0,sp,48
    1ca8:	fca43c23          	sd	a0,-40(s0)
    1cac:	87ae                	mv	a5,a1
    1cae:	fcf42a23          	sw	a5,-44(s0)
    struct release_queue_entry *new_entry = (struct release_queue_entry *)malloc(sizeof(struct release_queue_entry));
    1cb2:	02000513          	li	a0,32
    1cb6:	00000097          	auipc	ra,0x0
    1cba:	b94080e7          	jalr	-1132(ra) # 184a <malloc>
    1cbe:	fea43423          	sd	a0,-24(s0)
    new_entry->thrd = t;
    1cc2:	fe843783          	ld	a5,-24(s0)
    1cc6:	fd843703          	ld	a4,-40(s0)
    1cca:	e398                	sd	a4,0(a5)
    new_entry->release_time = arrival_time;
    1ccc:	fe843783          	ld	a5,-24(s0)
    1cd0:	fd442703          	lw	a4,-44(s0)
    1cd4:	cf98                	sw	a4,24(a5)
    t->arrival_time = arrival_time;
    1cd6:	fd843783          	ld	a5,-40(s0)
    1cda:	fd442703          	lw	a4,-44(s0)
    1cde:	d3b8                	sw	a4,96(a5)
    // t->remaining_time = t->processing_time;
    if (t->is_real_time) {
    1ce0:	fd843783          	ld	a5,-40(s0)
    1ce4:	43bc                	lw	a5,64(a5)
    1ce6:	cf81                	beqz	a5,1cfe <thread_add_at+0x5e>
        t->current_deadline = arrival_time + t->deadline;
    1ce8:	fd843783          	ld	a5,-40(s0)
    1cec:	47bc                	lw	a5,72(a5)
    1cee:	fd442703          	lw	a4,-44(s0)
    1cf2:	9fb9                	addw	a5,a5,a4
    1cf4:	0007871b          	sext.w	a4,a5
    1cf8:	fd843783          	ld	a5,-40(s0)
    1cfc:	cfb8                	sw	a4,88(a5)
    }
    list_add_tail(&new_entry->thread_list, &release_queue);
    1cfe:	fe843783          	ld	a5,-24(s0)
    1d02:	07a1                	addi	a5,a5,8
    1d04:	00001597          	auipc	a1,0x1
    1d08:	10458593          	addi	a1,a1,260 # 2e08 <release_queue>
    1d0c:	853e                	mv	a0,a5
    1d0e:	00000097          	auipc	ra,0x0
    1d12:	d32080e7          	jalr	-718(ra) # 1a40 <list_add_tail>
}
    1d16:	0001                	nop
    1d18:	70a2                	ld	ra,40(sp)
    1d1a:	7402                	ld	s0,32(sp)
    1d1c:	6145                	addi	sp,sp,48
    1d1e:	8082                	ret

0000000000001d20 <__release>:

void __release()
{
    1d20:	7139                	addi	sp,sp,-64
    1d22:	fc06                	sd	ra,56(sp)
    1d24:	f822                	sd	s0,48(sp)
    1d26:	0080                	addi	s0,sp,64
    struct release_queue_entry *cur, *nxt;
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    1d28:	00001797          	auipc	a5,0x1
    1d2c:	0e078793          	addi	a5,a5,224 # 2e08 <release_queue>
    1d30:	639c                	ld	a5,0(a5)
    1d32:	fcf43c23          	sd	a5,-40(s0)
    1d36:	fd843783          	ld	a5,-40(s0)
    1d3a:	17e1                	addi	a5,a5,-8
    1d3c:	fef43423          	sd	a5,-24(s0)
    1d40:	fe843783          	ld	a5,-24(s0)
    1d44:	679c                	ld	a5,8(a5)
    1d46:	fcf43823          	sd	a5,-48(s0)
    1d4a:	fd043783          	ld	a5,-48(s0)
    1d4e:	17e1                	addi	a5,a5,-8
    1d50:	fef43023          	sd	a5,-32(s0)
    1d54:	a851                	j	1de8 <__release+0xc8>
        if (threading_system_time >= cur->release_time) {
    1d56:	fe843783          	ld	a5,-24(s0)
    1d5a:	4f98                	lw	a4,24(a5)
    1d5c:	00001797          	auipc	a5,0x1
    1d60:	0ec78793          	addi	a5,a5,236 # 2e48 <threading_system_time>
    1d64:	439c                	lw	a5,0(a5)
    1d66:	06e7c363          	blt	a5,a4,1dcc <__release+0xac>
            cur->thrd->remaining_time = cur->thrd->processing_time;
    1d6a:	fe843783          	ld	a5,-24(s0)
    1d6e:	6398                	ld	a4,0(a5)
    1d70:	fe843783          	ld	a5,-24(s0)
    1d74:	639c                	ld	a5,0(a5)
    1d76:	4378                	lw	a4,68(a4)
    1d78:	cbf8                	sw	a4,84(a5)
            cur->thrd->current_deadline = cur->release_time + cur->thrd->deadline;
    1d7a:	fe843783          	ld	a5,-24(s0)
    1d7e:	4f94                	lw	a3,24(a5)
    1d80:	fe843783          	ld	a5,-24(s0)
    1d84:	639c                	ld	a5,0(a5)
    1d86:	47b8                	lw	a4,72(a5)
    1d88:	fe843783          	ld	a5,-24(s0)
    1d8c:	639c                	ld	a5,0(a5)
    1d8e:	9f35                	addw	a4,a4,a3
    1d90:	2701                	sext.w	a4,a4
    1d92:	cfb8                	sw	a4,88(a5)
            list_add_tail(&cur->thrd->thread_list, &run_queue);
    1d94:	fe843783          	ld	a5,-24(s0)
    1d98:	639c                	ld	a5,0(a5)
    1d9a:	02878793          	addi	a5,a5,40
    1d9e:	00001597          	auipc	a1,0x1
    1da2:	05a58593          	addi	a1,a1,90 # 2df8 <run_queue>
    1da6:	853e                	mv	a0,a5
    1da8:	00000097          	auipc	ra,0x0
    1dac:	c98080e7          	jalr	-872(ra) # 1a40 <list_add_tail>
            list_del(&cur->thread_list);
    1db0:	fe843783          	ld	a5,-24(s0)
    1db4:	07a1                	addi	a5,a5,8
    1db6:	853e                	mv	a0,a5
    1db8:	00000097          	auipc	ra,0x0
    1dbc:	ce4080e7          	jalr	-796(ra) # 1a9c <list_del>
            free(cur);
    1dc0:	fe843503          	ld	a0,-24(s0)
    1dc4:	00000097          	auipc	ra,0x0
    1dc8:	8e4080e7          	jalr	-1820(ra) # 16a8 <free>
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    1dcc:	fe043783          	ld	a5,-32(s0)
    1dd0:	fef43423          	sd	a5,-24(s0)
    1dd4:	fe043783          	ld	a5,-32(s0)
    1dd8:	679c                	ld	a5,8(a5)
    1dda:	fcf43423          	sd	a5,-56(s0)
    1dde:	fc843783          	ld	a5,-56(s0)
    1de2:	17e1                	addi	a5,a5,-8
    1de4:	fef43023          	sd	a5,-32(s0)
    1de8:	fe843783          	ld	a5,-24(s0)
    1dec:	00878713          	addi	a4,a5,8
    1df0:	00001797          	auipc	a5,0x1
    1df4:	01878793          	addi	a5,a5,24 # 2e08 <release_queue>
    1df8:	f4f71fe3          	bne	a4,a5,1d56 <__release+0x36>
        }
    }
}
    1dfc:	0001                	nop
    1dfe:	0001                	nop
    1e00:	70e2                	ld	ra,56(sp)
    1e02:	7442                	ld	s0,48(sp)
    1e04:	6121                	addi	sp,sp,64
    1e06:	8082                	ret

0000000000001e08 <__thread_exit>:

void __thread_exit(struct thread *to_remove)
{
    1e08:	1101                	addi	sp,sp,-32
    1e0a:	ec06                	sd	ra,24(sp)
    1e0c:	e822                	sd	s0,16(sp)
    1e0e:	1000                	addi	s0,sp,32
    1e10:	fea43423          	sd	a0,-24(s0)
    current = to_remove->thread_list.prev;
    1e14:	fe843783          	ld	a5,-24(s0)
    1e18:	7b98                	ld	a4,48(a5)
    1e1a:	00001797          	auipc	a5,0x1
    1e1e:	02678793          	addi	a5,a5,38 # 2e40 <current>
    1e22:	e398                	sd	a4,0(a5)
    list_del(&to_remove->thread_list);
    1e24:	fe843783          	ld	a5,-24(s0)
    1e28:	02878793          	addi	a5,a5,40
    1e2c:	853e                	mv	a0,a5
    1e2e:	00000097          	auipc	ra,0x0
    1e32:	c6e080e7          	jalr	-914(ra) # 1a9c <list_del>

    free(to_remove->stack);
    1e36:	fe843783          	ld	a5,-24(s0)
    1e3a:	6b9c                	ld	a5,16(a5)
    1e3c:	853e                	mv	a0,a5
    1e3e:	00000097          	auipc	ra,0x0
    1e42:	86a080e7          	jalr	-1942(ra) # 16a8 <free>
    free(to_remove);
    1e46:	fe843503          	ld	a0,-24(s0)
    1e4a:	00000097          	auipc	ra,0x0
    1e4e:	85e080e7          	jalr	-1954(ra) # 16a8 <free>

    __schedule();
    1e52:	00000097          	auipc	ra,0x0
    1e56:	5ae080e7          	jalr	1454(ra) # 2400 <__schedule>
    __dispatch();
    1e5a:	00000097          	auipc	ra,0x0
    1e5e:	416080e7          	jalr	1046(ra) # 2270 <__dispatch>
    thrdresume(main_thrd_id);
    1e62:	00001797          	auipc	a5,0x1
    1e66:	fb678793          	addi	a5,a5,-74 # 2e18 <main_thrd_id>
    1e6a:	439c                	lw	a5,0(a5)
    1e6c:	853e                	mv	a0,a5
    1e6e:	fffff097          	auipc	ra,0xfffff
    1e72:	34c080e7          	jalr	844(ra) # 11ba <thrdresume>
}
    1e76:	0001                	nop
    1e78:	60e2                	ld	ra,24(sp)
    1e7a:	6442                	ld	s0,16(sp)
    1e7c:	6105                	addi	sp,sp,32
    1e7e:	8082                	ret

0000000000001e80 <thread_exit>:

void thread_exit(void)
{
    1e80:	7179                	addi	sp,sp,-48
    1e82:	f406                	sd	ra,40(sp)
    1e84:	f022                	sd	s0,32(sp)
    1e86:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    1e88:	00001797          	auipc	a5,0x1
    1e8c:	fb878793          	addi	a5,a5,-72 # 2e40 <current>
    1e90:	6398                	ld	a4,0(a5)
    1e92:	00001797          	auipc	a5,0x1
    1e96:	f6678793          	addi	a5,a5,-154 # 2df8 <run_queue>
    1e9a:	02f71063          	bne	a4,a5,1eba <thread_exit+0x3a>
        fprintf(2, "[FATAL] thread_exit is called on a nonexistent thread\n");
    1e9e:	00001597          	auipc	a1,0x1
    1ea2:	dca58593          	addi	a1,a1,-566 # 2c68 <schedule_dm+0x53e>
    1ea6:	4509                	li	a0,2
    1ea8:	fffff097          	auipc	ra,0xfffff
    1eac:	758080e7          	jalr	1880(ra) # 1600 <fprintf>
        exit(1);
    1eb0:	4505                	li	a0,1
    1eb2:	fffff097          	auipc	ra,0xfffff
    1eb6:	260080e7          	jalr	608(ra) # 1112 <exit>
    }

    struct thread *to_remove = list_entry(current, struct thread, thread_list);
    1eba:	00001797          	auipc	a5,0x1
    1ebe:	f8678793          	addi	a5,a5,-122 # 2e40 <current>
    1ec2:	639c                	ld	a5,0(a5)
    1ec4:	fef43423          	sd	a5,-24(s0)
    1ec8:	fe843783          	ld	a5,-24(s0)
    1ecc:	fd878793          	addi	a5,a5,-40
    1ed0:	fef43023          	sd	a5,-32(s0)
    int consume_ticks = cancelthrdstop(to_remove->thrdstop_context_id, 1);
    1ed4:	fe043783          	ld	a5,-32(s0)
    1ed8:	5f9c                	lw	a5,56(a5)
    1eda:	4585                	li	a1,1
    1edc:	853e                	mv	a0,a5
    1ede:	fffff097          	auipc	ra,0xfffff
    1ee2:	2e4080e7          	jalr	740(ra) # 11c2 <cancelthrdstop>
    1ee6:	87aa                	mv	a5,a0
    1ee8:	fcf42e23          	sw	a5,-36(s0)
    threading_system_time += consume_ticks;
    1eec:	00001797          	auipc	a5,0x1
    1ef0:	f5c78793          	addi	a5,a5,-164 # 2e48 <threading_system_time>
    1ef4:	439c                	lw	a5,0(a5)
    1ef6:	fdc42703          	lw	a4,-36(s0)
    1efa:	9fb9                	addw	a5,a5,a4
    1efc:	0007871b          	sext.w	a4,a5
    1f00:	00001797          	auipc	a5,0x1
    1f04:	f4878793          	addi	a5,a5,-184 # 2e48 <threading_system_time>
    1f08:	c398                	sw	a4,0(a5)

    __release();
    1f0a:	00000097          	auipc	ra,0x0
    1f0e:	e16080e7          	jalr	-490(ra) # 1d20 <__release>
    __thread_exit(to_remove);
    1f12:	fe043503          	ld	a0,-32(s0)
    1f16:	00000097          	auipc	ra,0x0
    1f1a:	ef2080e7          	jalr	-270(ra) # 1e08 <__thread_exit>
}
    1f1e:	0001                	nop
    1f20:	70a2                	ld	ra,40(sp)
    1f22:	7402                	ld	s0,32(sp)
    1f24:	6145                	addi	sp,sp,48
    1f26:	8082                	ret

0000000000001f28 <__finish_current>:

void __finish_current()
{
    1f28:	7179                	addi	sp,sp,-48
    1f2a:	f406                	sd	ra,40(sp)
    1f2c:	f022                	sd	s0,32(sp)
    1f2e:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    1f30:	00001797          	auipc	a5,0x1
    1f34:	f1078793          	addi	a5,a5,-240 # 2e40 <current>
    1f38:	639c                	ld	a5,0(a5)
    1f3a:	fef43423          	sd	a5,-24(s0)
    1f3e:	fe843783          	ld	a5,-24(s0)
    1f42:	fd878793          	addi	a5,a5,-40
    1f46:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    1f4a:	fe043783          	ld	a5,-32(s0)
    1f4e:	4bbc                	lw	a5,80(a5)
    1f50:	37fd                	addiw	a5,a5,-1
    1f52:	0007871b          	sext.w	a4,a5
    1f56:	fe043783          	ld	a5,-32(s0)
    1f5a:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish at %d\n",
    1f5c:	fe043783          	ld	a5,-32(s0)
    1f60:	5fd8                	lw	a4,60(a5)
    1f62:	00001797          	auipc	a5,0x1
    1f66:	ee678793          	addi	a5,a5,-282 # 2e48 <threading_system_time>
    1f6a:	4390                	lw	a2,0(a5)
    1f6c:	fe043783          	ld	a5,-32(s0)
    1f70:	4bbc                	lw	a5,80(a5)
    1f72:	86be                	mv	a3,a5
    1f74:	85ba                	mv	a1,a4
    1f76:	00001517          	auipc	a0,0x1
    1f7a:	d2a50513          	addi	a0,a0,-726 # 2ca0 <schedule_dm+0x576>
    1f7e:	fffff097          	auipc	ra,0xfffff
    1f82:	6da080e7          	jalr	1754(ra) # 1658 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    1f86:	fe043783          	ld	a5,-32(s0)
    1f8a:	4bbc                	lw	a5,80(a5)
    1f8c:	04f05563          	blez	a5,1fd6 <__finish_current+0xae>
        struct list_head *to_remove = current;
    1f90:	00001797          	auipc	a5,0x1
    1f94:	eb078793          	addi	a5,a5,-336 # 2e40 <current>
    1f98:	639c                	ld	a5,0(a5)
    1f9a:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    1f9e:	00001797          	auipc	a5,0x1
    1fa2:	ea278793          	addi	a5,a5,-350 # 2e40 <current>
    1fa6:	639c                	ld	a5,0(a5)
    1fa8:	6798                	ld	a4,8(a5)
    1faa:	00001797          	auipc	a5,0x1
    1fae:	e9678793          	addi	a5,a5,-362 # 2e40 <current>
    1fb2:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    1fb4:	fd843503          	ld	a0,-40(s0)
    1fb8:	00000097          	auipc	ra,0x0
    1fbc:	ae4080e7          	jalr	-1308(ra) # 1a9c <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    1fc0:	fe043783          	ld	a5,-32(s0)
    1fc4:	4fbc                	lw	a5,88(a5)
    1fc6:	85be                	mv	a1,a5
    1fc8:	fe043503          	ld	a0,-32(s0)
    1fcc:	00000097          	auipc	ra,0x0
    1fd0:	cd4080e7          	jalr	-812(ra) # 1ca0 <thread_add_at>
    } else {
        __thread_exit(current_thread);
    }
}
    1fd4:	a039                	j	1fe2 <__finish_current+0xba>
        __thread_exit(current_thread);
    1fd6:	fe043503          	ld	a0,-32(s0)
    1fda:	00000097          	auipc	ra,0x0
    1fde:	e2e080e7          	jalr	-466(ra) # 1e08 <__thread_exit>
}
    1fe2:	0001                	nop
    1fe4:	70a2                	ld	ra,40(sp)
    1fe6:	7402                	ld	s0,32(sp)
    1fe8:	6145                	addi	sp,sp,48
    1fea:	8082                	ret

0000000000001fec <__rt_finish_current>:
void __rt_finish_current()
{
    1fec:	7179                	addi	sp,sp,-48
    1fee:	f406                	sd	ra,40(sp)
    1ff0:	f022                	sd	s0,32(sp)
    1ff2:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    1ff4:	00001797          	auipc	a5,0x1
    1ff8:	e4c78793          	addi	a5,a5,-436 # 2e40 <current>
    1ffc:	639c                	ld	a5,0(a5)
    1ffe:	fef43423          	sd	a5,-24(s0)
    2002:	fe843783          	ld	a5,-24(s0)
    2006:	fd878793          	addi	a5,a5,-40
    200a:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    200e:	fe043783          	ld	a5,-32(s0)
    2012:	4bbc                	lw	a5,80(a5)
    2014:	37fd                	addiw	a5,a5,-1
    2016:	0007871b          	sext.w	a4,a5
    201a:	fe043783          	ld	a5,-32(s0)
    201e:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish one cycle at %d: %d cycles left\n",
    2020:	fe043783          	ld	a5,-32(s0)
    2024:	5fd8                	lw	a4,60(a5)
    2026:	00001797          	auipc	a5,0x1
    202a:	e2278793          	addi	a5,a5,-478 # 2e48 <threading_system_time>
    202e:	4390                	lw	a2,0(a5)
    2030:	fe043783          	ld	a5,-32(s0)
    2034:	4bbc                	lw	a5,80(a5)
    2036:	86be                	mv	a3,a5
    2038:	85ba                	mv	a1,a4
    203a:	00001517          	auipc	a0,0x1
    203e:	c7e50513          	addi	a0,a0,-898 # 2cb8 <schedule_dm+0x58e>
    2042:	fffff097          	auipc	ra,0xfffff
    2046:	616080e7          	jalr	1558(ra) # 1658 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    204a:	fe043783          	ld	a5,-32(s0)
    204e:	4bbc                	lw	a5,80(a5)
    2050:	04f05f63          	blez	a5,20ae <__rt_finish_current+0xc2>
        struct list_head *to_remove = current;
    2054:	00001797          	auipc	a5,0x1
    2058:	dec78793          	addi	a5,a5,-532 # 2e40 <current>
    205c:	639c                	ld	a5,0(a5)
    205e:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    2062:	00001797          	auipc	a5,0x1
    2066:	dde78793          	addi	a5,a5,-546 # 2e40 <current>
    206a:	639c                	ld	a5,0(a5)
    206c:	6798                	ld	a4,8(a5)
    206e:	00001797          	auipc	a5,0x1
    2072:	dd278793          	addi	a5,a5,-558 # 2e40 <current>
    2076:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    2078:	fd843503          	ld	a0,-40(s0)
    207c:	00000097          	auipc	ra,0x0
    2080:	a20080e7          	jalr	-1504(ra) # 1a9c <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    2084:	fe043783          	ld	a5,-32(s0)
    2088:	4fbc                	lw	a5,88(a5)
    208a:	85be                	mv	a1,a5
    208c:	fe043503          	ld	a0,-32(s0)
    2090:	00000097          	auipc	ra,0x0
    2094:	c10080e7          	jalr	-1008(ra) # 1ca0 <thread_add_at>
        if (!current_thread->cbs.is_hard_rt) {
    2098:	fe043783          	ld	a5,-32(s0)
    209c:	57fc                	lw	a5,108(a5)
    209e:	ef91                	bnez	a5,20ba <__rt_finish_current+0xce>
            current_thread->cbs.remaining_budget = current_thread->cbs.budget;
    20a0:	fe043783          	ld	a5,-32(s0)
    20a4:	53f8                	lw	a4,100(a5)
    20a6:	fe043783          	ld	a5,-32(s0)
    20aa:	d7b8                	sw	a4,104(a5)
        }
    } else {
        __thread_exit(current_thread);
    }
}
    20ac:	a039                	j	20ba <__rt_finish_current+0xce>
        __thread_exit(current_thread);
    20ae:	fe043503          	ld	a0,-32(s0)
    20b2:	00000097          	auipc	ra,0x0
    20b6:	d56080e7          	jalr	-682(ra) # 1e08 <__thread_exit>
}
    20ba:	0001                	nop
    20bc:	70a2                	ld	ra,40(sp)
    20be:	7402                	ld	s0,32(sp)
    20c0:	6145                	addi	sp,sp,48
    20c2:	8082                	ret

00000000000020c4 <switch_handler>:

void switch_handler(void *arg)
{
    20c4:	7139                	addi	sp,sp,-64
    20c6:	fc06                	sd	ra,56(sp)
    20c8:	f822                	sd	s0,48(sp)
    20ca:	0080                	addi	s0,sp,64
    20cc:	fca43423          	sd	a0,-56(s0)
    uint64 elapsed_time = (uint64)arg;
    20d0:	fc843783          	ld	a5,-56(s0)
    20d4:	fef43423          	sd	a5,-24(s0)
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    20d8:	00001797          	auipc	a5,0x1
    20dc:	d6878793          	addi	a5,a5,-664 # 2e40 <current>
    20e0:	639c                	ld	a5,0(a5)
    20e2:	fef43023          	sd	a5,-32(s0)
    20e6:	fe043783          	ld	a5,-32(s0)
    20ea:	fd878793          	addi	a5,a5,-40
    20ee:	fcf43c23          	sd	a5,-40(s0)

    threading_system_time += elapsed_time;
    20f2:	fe843783          	ld	a5,-24(s0)
    20f6:	0007871b          	sext.w	a4,a5
    20fa:	00001797          	auipc	a5,0x1
    20fe:	d4e78793          	addi	a5,a5,-690 # 2e48 <threading_system_time>
    2102:	439c                	lw	a5,0(a5)
    2104:	2781                	sext.w	a5,a5
    2106:	9fb9                	addw	a5,a5,a4
    2108:	2781                	sext.w	a5,a5
    210a:	0007871b          	sext.w	a4,a5
    210e:	00001797          	auipc	a5,0x1
    2112:	d3a78793          	addi	a5,a5,-710 # 2e48 <threading_system_time>
    2116:	c398                	sw	a4,0(a5)
     __release();
    2118:	00000097          	auipc	ra,0x0
    211c:	c08080e7          	jalr	-1016(ra) # 1d20 <__release>
    current_thread->remaining_time -= elapsed_time;
    2120:	fd843783          	ld	a5,-40(s0)
    2124:	4bfc                	lw	a5,84(a5)
    2126:	0007871b          	sext.w	a4,a5
    212a:	fe843783          	ld	a5,-24(s0)
    212e:	2781                	sext.w	a5,a5
    2130:	40f707bb          	subw	a5,a4,a5
    2134:	2781                	sext.w	a5,a5
    2136:	0007871b          	sext.w	a4,a5
    213a:	fd843783          	ld	a5,-40(s0)
    213e:	cbf8                	sw	a4,84(a5)
    if (!current_thread->cbs.is_hard_rt) {
    2140:	fd843783          	ld	a5,-40(s0)
    2144:	57fc                	lw	a5,108(a5)
    2146:	e38d                	bnez	a5,2168 <switch_handler+0xa4>
        current_thread->cbs.remaining_budget -= elapsed_time;
    2148:	fd843783          	ld	a5,-40(s0)
    214c:	57bc                	lw	a5,104(a5)
    214e:	0007871b          	sext.w	a4,a5
    2152:	fe843783          	ld	a5,-24(s0)
    2156:	2781                	sext.w	a5,a5
    2158:	40f707bb          	subw	a5,a4,a5
    215c:	2781                	sext.w	a5,a5
    215e:	0007871b          	sext.w	a4,a5
    2162:	fd843783          	ld	a5,-40(s0)
    2166:	d7b8                	sw	a4,104(a5)
    }
    if (current_thread->is_real_time)
    2168:	fd843783          	ld	a5,-40(s0)
    216c:	43bc                	lw	a5,64(a5)
    216e:	c3ad                	beqz	a5,21d0 <switch_handler+0x10c>
        if (threading_system_time > current_thread->current_deadline || 
    2170:	fd843783          	ld	a5,-40(s0)
    2174:	4fb8                	lw	a4,88(a5)
    2176:	00001797          	auipc	a5,0x1
    217a:	cd278793          	addi	a5,a5,-814 # 2e48 <threading_system_time>
    217e:	439c                	lw	a5,0(a5)
    2180:	02f74163          	blt	a4,a5,21a2 <switch_handler+0xde>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    2184:	fd843783          	ld	a5,-40(s0)
    2188:	4fb8                	lw	a4,88(a5)
    218a:	00001797          	auipc	a5,0x1
    218e:	cbe78793          	addi	a5,a5,-834 # 2e48 <threading_system_time>
    2192:	439c                	lw	a5,0(a5)
        if (threading_system_time > current_thread->current_deadline || 
    2194:	02f71e63          	bne	a4,a5,21d0 <switch_handler+0x10c>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    2198:	fd843783          	ld	a5,-40(s0)
    219c:	4bfc                	lw	a5,84(a5)
    219e:	02f05963          	blez	a5,21d0 <switch_handler+0x10c>
            printf("thread#%d misses a deadline at %d in swicth\n", current_thread->ID, threading_system_time);
    21a2:	fd843783          	ld	a5,-40(s0)
    21a6:	5fd8                	lw	a4,60(a5)
    21a8:	00001797          	auipc	a5,0x1
    21ac:	ca078793          	addi	a5,a5,-864 # 2e48 <threading_system_time>
    21b0:	439c                	lw	a5,0(a5)
    21b2:	863e                	mv	a2,a5
    21b4:	85ba                	mv	a1,a4
    21b6:	00001517          	auipc	a0,0x1
    21ba:	b3a50513          	addi	a0,a0,-1222 # 2cf0 <schedule_dm+0x5c6>
    21be:	fffff097          	auipc	ra,0xfffff
    21c2:	49a080e7          	jalr	1178(ra) # 1658 <printf>
            exit(0);
    21c6:	4501                	li	a0,0
    21c8:	fffff097          	auipc	ra,0xfffff
    21cc:	f4a080e7          	jalr	-182(ra) # 1112 <exit>
        }

    if (current_thread->remaining_time <= 0) {
    21d0:	fd843783          	ld	a5,-40(s0)
    21d4:	4bfc                	lw	a5,84(a5)
    21d6:	02f04063          	bgtz	a5,21f6 <switch_handler+0x132>
        if (current_thread->is_real_time)
    21da:	fd843783          	ld	a5,-40(s0)
    21de:	43bc                	lw	a5,64(a5)
    21e0:	c791                	beqz	a5,21ec <switch_handler+0x128>
            __rt_finish_current();
    21e2:	00000097          	auipc	ra,0x0
    21e6:	e0a080e7          	jalr	-502(ra) # 1fec <__rt_finish_current>
    21ea:	a881                	j	223a <switch_handler+0x176>
        else
            __finish_current();
    21ec:	00000097          	auipc	ra,0x0
    21f0:	d3c080e7          	jalr	-708(ra) # 1f28 <__finish_current>
    21f4:	a099                	j	223a <switch_handler+0x176>
    } else {
        // move the current thread to the end of the run_queue
        struct list_head *to_remove = current;
    21f6:	00001797          	auipc	a5,0x1
    21fa:	c4a78793          	addi	a5,a5,-950 # 2e40 <current>
    21fe:	639c                	ld	a5,0(a5)
    2200:	fcf43823          	sd	a5,-48(s0)
        current = current->prev;
    2204:	00001797          	auipc	a5,0x1
    2208:	c3c78793          	addi	a5,a5,-964 # 2e40 <current>
    220c:	639c                	ld	a5,0(a5)
    220e:	6798                	ld	a4,8(a5)
    2210:	00001797          	auipc	a5,0x1
    2214:	c3078793          	addi	a5,a5,-976 # 2e40 <current>
    2218:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    221a:	fd043503          	ld	a0,-48(s0)
    221e:	00000097          	auipc	ra,0x0
    2222:	87e080e7          	jalr	-1922(ra) # 1a9c <list_del>
        list_add_tail(to_remove, &run_queue);
    2226:	00001597          	auipc	a1,0x1
    222a:	bd258593          	addi	a1,a1,-1070 # 2df8 <run_queue>
    222e:	fd043503          	ld	a0,-48(s0)
    2232:	00000097          	auipc	ra,0x0
    2236:	80e080e7          	jalr	-2034(ra) # 1a40 <list_add_tail>
    }

    __release();
    223a:	00000097          	auipc	ra,0x0
    223e:	ae6080e7          	jalr	-1306(ra) # 1d20 <__release>
    __schedule();
    2242:	00000097          	auipc	ra,0x0
    2246:	1be080e7          	jalr	446(ra) # 2400 <__schedule>
    __dispatch();
    224a:	00000097          	auipc	ra,0x0
    224e:	026080e7          	jalr	38(ra) # 2270 <__dispatch>
    thrdresume(main_thrd_id);
    2252:	00001797          	auipc	a5,0x1
    2256:	bc678793          	addi	a5,a5,-1082 # 2e18 <main_thrd_id>
    225a:	439c                	lw	a5,0(a5)
    225c:	853e                	mv	a0,a5
    225e:	fffff097          	auipc	ra,0xfffff
    2262:	f5c080e7          	jalr	-164(ra) # 11ba <thrdresume>
}
    2266:	0001                	nop
    2268:	70e2                	ld	ra,56(sp)
    226a:	7442                	ld	s0,48(sp)
    226c:	6121                	addi	sp,sp,64
    226e:	8082                	ret

0000000000002270 <__dispatch>:

void __dispatch()
{
    2270:	7179                	addi	sp,sp,-48
    2272:	f406                	sd	ra,40(sp)
    2274:	f022                	sd	s0,32(sp)
    2276:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    2278:	00001797          	auipc	a5,0x1
    227c:	bc878793          	addi	a5,a5,-1080 # 2e40 <current>
    2280:	6398                	ld	a4,0(a5)
    2282:	00001797          	auipc	a5,0x1
    2286:	b7678793          	addi	a5,a5,-1162 # 2df8 <run_queue>
    228a:	16f70663          	beq	a4,a5,23f6 <__dispatch+0x186>
    if (allocated_time < 0) {
        fprintf(2, "[FATAL] allocated_time is negative\n");
        exit(1);
    }

    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    228e:	00001797          	auipc	a5,0x1
    2292:	bb278793          	addi	a5,a5,-1102 # 2e40 <current>
    2296:	639c                	ld	a5,0(a5)
    2298:	fef43423          	sd	a5,-24(s0)
    229c:	fe843783          	ld	a5,-24(s0)
    22a0:	fd878793          	addi	a5,a5,-40
    22a4:	fef43023          	sd	a5,-32(s0)
    if (current_thread->is_real_time && allocated_time == 0) {
    22a8:	fe043783          	ld	a5,-32(s0)
    22ac:	43bc                	lw	a5,64(a5)
    22ae:	cf85                	beqz	a5,22e6 <__dispatch+0x76>
    22b0:	00001797          	auipc	a5,0x1
    22b4:	ba078793          	addi	a5,a5,-1120 # 2e50 <allocated_time>
    22b8:	639c                	ld	a5,0(a5)
    22ba:	e795                	bnez	a5,22e6 <__dispatch+0x76>
        printf("thread#%d misses a deadline at %d in dispatch\n", current_thread->ID, current_thread->current_deadline);
    22bc:	fe043783          	ld	a5,-32(s0)
    22c0:	5fd8                	lw	a4,60(a5)
    22c2:	fe043783          	ld	a5,-32(s0)
    22c6:	4fbc                	lw	a5,88(a5)
    22c8:	863e                	mv	a2,a5
    22ca:	85ba                	mv	a1,a4
    22cc:	00001517          	auipc	a0,0x1
    22d0:	a5450513          	addi	a0,a0,-1452 # 2d20 <schedule_dm+0x5f6>
    22d4:	fffff097          	auipc	ra,0xfffff
    22d8:	384080e7          	jalr	900(ra) # 1658 <printf>
        exit(0);
    22dc:	4501                	li	a0,0
    22de:	fffff097          	auipc	ra,0xfffff
    22e2:	e34080e7          	jalr	-460(ra) # 1112 <exit>
    }

    printf("dispatch thread#%d at %d: allocated_time=%d\n", current_thread->ID, threading_system_time, allocated_time);
    22e6:	fe043783          	ld	a5,-32(s0)
    22ea:	5fd8                	lw	a4,60(a5)
    22ec:	00001797          	auipc	a5,0x1
    22f0:	b5c78793          	addi	a5,a5,-1188 # 2e48 <threading_system_time>
    22f4:	4390                	lw	a2,0(a5)
    22f6:	00001797          	auipc	a5,0x1
    22fa:	b5a78793          	addi	a5,a5,-1190 # 2e50 <allocated_time>
    22fe:	639c                	ld	a5,0(a5)
    2300:	86be                	mv	a3,a5
    2302:	85ba                	mv	a1,a4
    2304:	00001517          	auipc	a0,0x1
    2308:	a4c50513          	addi	a0,a0,-1460 # 2d50 <schedule_dm+0x626>
    230c:	fffff097          	auipc	ra,0xfffff
    2310:	34c080e7          	jalr	844(ra) # 1658 <printf>

    if (current_thread->buf_set) {
    2314:	fe043783          	ld	a5,-32(s0)
    2318:	539c                	lw	a5,32(a5)
    231a:	c7a1                	beqz	a5,2362 <__dispatch+0xf2>
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    231c:	00001797          	auipc	a5,0x1
    2320:	b3478793          	addi	a5,a5,-1228 # 2e50 <allocated_time>
    2324:	639c                	ld	a5,0(a5)
    2326:	0007871b          	sext.w	a4,a5
    232a:	fe043783          	ld	a5,-32(s0)
    232e:	03878593          	addi	a1,a5,56
    2332:	00001797          	auipc	a5,0x1
    2336:	b1e78793          	addi	a5,a5,-1250 # 2e50 <allocated_time>
    233a:	639c                	ld	a5,0(a5)
    233c:	86be                	mv	a3,a5
    233e:	00000617          	auipc	a2,0x0
    2342:	d8660613          	addi	a2,a2,-634 # 20c4 <switch_handler>
    2346:	853a                	mv	a0,a4
    2348:	fffff097          	auipc	ra,0xfffff
    234c:	e6a080e7          	jalr	-406(ra) # 11b2 <thrdstop>
        thrdresume(current_thread->thrdstop_context_id);
    2350:	fe043783          	ld	a5,-32(s0)
    2354:	5f9c                	lw	a5,56(a5)
    2356:	853e                	mv	a0,a5
    2358:	fffff097          	auipc	ra,0xfffff
    235c:	e62080e7          	jalr	-414(ra) # 11ba <thrdresume>
    2360:	a071                	j	23ec <__dispatch+0x17c>
    } else {
        current_thread->buf_set = 1;
    2362:	fe043783          	ld	a5,-32(s0)
    2366:	4705                	li	a4,1
    2368:	d398                	sw	a4,32(a5)
        unsigned long new_stack_p = (unsigned long)current_thread->stack_p;
    236a:	fe043783          	ld	a5,-32(s0)
    236e:	6f9c                	ld	a5,24(a5)
    2370:	fcf43c23          	sd	a5,-40(s0)
        current_thread->thrdstop_context_id = -1;
    2374:	fe043783          	ld	a5,-32(s0)
    2378:	577d                	li	a4,-1
    237a:	df98                	sw	a4,56(a5)
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    237c:	00001797          	auipc	a5,0x1
    2380:	ad478793          	addi	a5,a5,-1324 # 2e50 <allocated_time>
    2384:	639c                	ld	a5,0(a5)
    2386:	0007871b          	sext.w	a4,a5
    238a:	fe043783          	ld	a5,-32(s0)
    238e:	03878593          	addi	a1,a5,56
    2392:	00001797          	auipc	a5,0x1
    2396:	abe78793          	addi	a5,a5,-1346 # 2e50 <allocated_time>
    239a:	639c                	ld	a5,0(a5)
    239c:	86be                	mv	a3,a5
    239e:	00000617          	auipc	a2,0x0
    23a2:	d2660613          	addi	a2,a2,-730 # 20c4 <switch_handler>
    23a6:	853a                	mv	a0,a4
    23a8:	fffff097          	auipc	ra,0xfffff
    23ac:	e0a080e7          	jalr	-502(ra) # 11b2 <thrdstop>
        if (current_thread->thrdstop_context_id < 0) {
    23b0:	fe043783          	ld	a5,-32(s0)
    23b4:	5f9c                	lw	a5,56(a5)
    23b6:	0207d063          	bgez	a5,23d6 <__dispatch+0x166>
            fprintf(2, "[ERROR] number of threads may exceed MAX_THRD_NUM\n");
    23ba:	00001597          	auipc	a1,0x1
    23be:	9c658593          	addi	a1,a1,-1594 # 2d80 <schedule_dm+0x656>
    23c2:	4509                	li	a0,2
    23c4:	fffff097          	auipc	ra,0xfffff
    23c8:	23c080e7          	jalr	572(ra) # 1600 <fprintf>
            exit(1);
    23cc:	4505                	li	a0,1
    23ce:	fffff097          	auipc	ra,0xfffff
    23d2:	d44080e7          	jalr	-700(ra) # 1112 <exit>
        }

        // set sp to stack pointer of current thread.
        asm volatile("mv sp, %0"
    23d6:	fd843783          	ld	a5,-40(s0)
    23da:	813e                	mv	sp,a5
                     :
                     : "r"(new_stack_p));
        current_thread->fp(current_thread->arg);
    23dc:	fe043783          	ld	a5,-32(s0)
    23e0:	6398                	ld	a4,0(a5)
    23e2:	fe043783          	ld	a5,-32(s0)
    23e6:	679c                	ld	a5,8(a5)
    23e8:	853e                	mv	a0,a5
    23ea:	9702                	jalr	a4
    }
    thread_exit();
    23ec:	00000097          	auipc	ra,0x0
    23f0:	a94080e7          	jalr	-1388(ra) # 1e80 <thread_exit>
    23f4:	a011                	j	23f8 <__dispatch+0x188>
        return;
    23f6:	0001                	nop
}
    23f8:	70a2                	ld	ra,40(sp)
    23fa:	7402                	ld	s0,32(sp)
    23fc:	6145                	addi	sp,sp,48
    23fe:	8082                	ret

0000000000002400 <__schedule>:

void __schedule()
{
    2400:	711d                	addi	sp,sp,-96
    2402:	ec86                	sd	ra,88(sp)
    2404:	e8a2                	sd	s0,80(sp)
    2406:	1080                	addi	s0,sp,96
    struct threads_sched_args args = {
    2408:	00001797          	auipc	a5,0x1
    240c:	a4078793          	addi	a5,a5,-1472 # 2e48 <threading_system_time>
    2410:	439c                	lw	a5,0(a5)
    2412:	fcf42c23          	sw	a5,-40(s0)
    2416:	4789                	li	a5,2
    2418:	fcf42e23          	sw	a5,-36(s0)
    241c:	00001797          	auipc	a5,0x1
    2420:	9dc78793          	addi	a5,a5,-1572 # 2df8 <run_queue>
    2424:	fef43023          	sd	a5,-32(s0)
    2428:	00001797          	auipc	a5,0x1
    242c:	9e078793          	addi	a5,a5,-1568 # 2e08 <release_queue>
    2430:	fef43423          	sd	a5,-24(s0)
#ifdef THREAD_SCHEDULER_EDF_CBS
    r = schedule_edf_cbs(args);
#endif

#ifdef THREAD_SCHEDULER_DM
    r = schedule_dm(args);
    2434:	fd843783          	ld	a5,-40(s0)
    2438:	faf43023          	sd	a5,-96(s0)
    243c:	fe043783          	ld	a5,-32(s0)
    2440:	faf43423          	sd	a5,-88(s0)
    2444:	fe843783          	ld	a5,-24(s0)
    2448:	faf43823          	sd	a5,-80(s0)
    244c:	fa040793          	addi	a5,s0,-96
    2450:	853e                	mv	a0,a5
    2452:	00000097          	auipc	ra,0x0
    2456:	2d8080e7          	jalr	728(ra) # 272a <schedule_dm>
    245a:	872a                	mv	a4,a0
    245c:	87ae                	mv	a5,a1
    245e:	fce43423          	sd	a4,-56(s0)
    2462:	fcf43823          	sd	a5,-48(s0)
//     r = schedule_edf_cbs(args);
// #else
//     r = schedule_default(args);
// #endif

    current = r.scheduled_thread_list_member;
    2466:	fc843703          	ld	a4,-56(s0)
    246a:	00001797          	auipc	a5,0x1
    246e:	9d678793          	addi	a5,a5,-1578 # 2e40 <current>
    2472:	e398                	sd	a4,0(a5)
    allocated_time = r.allocated_time;
    2474:	fd042783          	lw	a5,-48(s0)
    2478:	873e                	mv	a4,a5
    247a:	00001797          	auipc	a5,0x1
    247e:	9d678793          	addi	a5,a5,-1578 # 2e50 <allocated_time>
    2482:	e398                	sd	a4,0(a5)
}
    2484:	0001                	nop
    2486:	60e6                	ld	ra,88(sp)
    2488:	6446                	ld	s0,80(sp)
    248a:	6125                	addi	sp,sp,96
    248c:	8082                	ret

000000000000248e <back_to_main_handler>:

void back_to_main_handler(void *arg)
{
    248e:	1101                	addi	sp,sp,-32
    2490:	ec06                	sd	ra,24(sp)
    2492:	e822                	sd	s0,16(sp)
    2494:	1000                	addi	s0,sp,32
    2496:	fea43423          	sd	a0,-24(s0)
    sleeping = 0;
    249a:	00001797          	auipc	a5,0x1
    249e:	9b278793          	addi	a5,a5,-1614 # 2e4c <sleeping>
    24a2:	0007a023          	sw	zero,0(a5)
    threading_system_time += (uint64)arg;
    24a6:	fe843783          	ld	a5,-24(s0)
    24aa:	0007871b          	sext.w	a4,a5
    24ae:	00001797          	auipc	a5,0x1
    24b2:	99a78793          	addi	a5,a5,-1638 # 2e48 <threading_system_time>
    24b6:	439c                	lw	a5,0(a5)
    24b8:	2781                	sext.w	a5,a5
    24ba:	9fb9                	addw	a5,a5,a4
    24bc:	2781                	sext.w	a5,a5
    24be:	0007871b          	sext.w	a4,a5
    24c2:	00001797          	auipc	a5,0x1
    24c6:	98678793          	addi	a5,a5,-1658 # 2e48 <threading_system_time>
    24ca:	c398                	sw	a4,0(a5)
    thrdresume(main_thrd_id);
    24cc:	00001797          	auipc	a5,0x1
    24d0:	94c78793          	addi	a5,a5,-1716 # 2e18 <main_thrd_id>
    24d4:	439c                	lw	a5,0(a5)
    24d6:	853e                	mv	a0,a5
    24d8:	fffff097          	auipc	ra,0xfffff
    24dc:	ce2080e7          	jalr	-798(ra) # 11ba <thrdresume>
}
    24e0:	0001                	nop
    24e2:	60e2                	ld	ra,24(sp)
    24e4:	6442                	ld	s0,16(sp)
    24e6:	6105                	addi	sp,sp,32
    24e8:	8082                	ret

00000000000024ea <thread_start_threading>:

void thread_start_threading()
{
    24ea:	1141                	addi	sp,sp,-16
    24ec:	e406                	sd	ra,8(sp)
    24ee:	e022                	sd	s0,0(sp)
    24f0:	0800                	addi	s0,sp,16
    threading_system_time = 0;
    24f2:	00001797          	auipc	a5,0x1
    24f6:	95678793          	addi	a5,a5,-1706 # 2e48 <threading_system_time>
    24fa:	0007a023          	sw	zero,0(a5)
    current = &run_queue;
    24fe:	00001797          	auipc	a5,0x1
    2502:	94278793          	addi	a5,a5,-1726 # 2e40 <current>
    2506:	00001717          	auipc	a4,0x1
    250a:	8f270713          	addi	a4,a4,-1806 # 2df8 <run_queue>
    250e:	e398                	sd	a4,0(a5)

    // call thrdstop just for obtain an ID
    thrdstop(1000, &main_thrd_id, back_to_main_handler, (void *)0);
    2510:	4681                	li	a3,0
    2512:	00000617          	auipc	a2,0x0
    2516:	f7c60613          	addi	a2,a2,-132 # 248e <back_to_main_handler>
    251a:	00001597          	auipc	a1,0x1
    251e:	8fe58593          	addi	a1,a1,-1794 # 2e18 <main_thrd_id>
    2522:	3e800513          	li	a0,1000
    2526:	fffff097          	auipc	ra,0xfffff
    252a:	c8c080e7          	jalr	-884(ra) # 11b2 <thrdstop>
    cancelthrdstop(main_thrd_id, 0);
    252e:	00001797          	auipc	a5,0x1
    2532:	8ea78793          	addi	a5,a5,-1814 # 2e18 <main_thrd_id>
    2536:	439c                	lw	a5,0(a5)
    2538:	4581                	li	a1,0
    253a:	853e                	mv	a0,a5
    253c:	fffff097          	auipc	ra,0xfffff
    2540:	c86080e7          	jalr	-890(ra) # 11c2 <cancelthrdstop>

    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    2544:	a0c9                	j	2606 <thread_start_threading+0x11c>
        __release();
    2546:	fffff097          	auipc	ra,0xfffff
    254a:	7da080e7          	jalr	2010(ra) # 1d20 <__release>
        __schedule();
    254e:	00000097          	auipc	ra,0x0
    2552:	eb2080e7          	jalr	-334(ra) # 2400 <__schedule>
        cancelthrdstop(main_thrd_id, 0);
    2556:	00001797          	auipc	a5,0x1
    255a:	8c278793          	addi	a5,a5,-1854 # 2e18 <main_thrd_id>
    255e:	439c                	lw	a5,0(a5)
    2560:	4581                	li	a1,0
    2562:	853e                	mv	a0,a5
    2564:	fffff097          	auipc	ra,0xfffff
    2568:	c5e080e7          	jalr	-930(ra) # 11c2 <cancelthrdstop>
        __dispatch();
    256c:	00000097          	auipc	ra,0x0
    2570:	d04080e7          	jalr	-764(ra) # 2270 <__dispatch>

        if (list_empty(&run_queue) && list_empty(&release_queue)) {
    2574:	00001517          	auipc	a0,0x1
    2578:	88450513          	addi	a0,a0,-1916 # 2df8 <run_queue>
    257c:	fffff097          	auipc	ra,0xfffff
    2580:	56a080e7          	jalr	1386(ra) # 1ae6 <list_empty>
    2584:	87aa                	mv	a5,a0
    2586:	cb99                	beqz	a5,259c <thread_start_threading+0xb2>
    2588:	00001517          	auipc	a0,0x1
    258c:	88050513          	addi	a0,a0,-1920 # 2e08 <release_queue>
    2590:	fffff097          	auipc	ra,0xfffff
    2594:	556080e7          	jalr	1366(ra) # 1ae6 <list_empty>
    2598:	87aa                	mv	a5,a0
    259a:	ebd9                	bnez	a5,2630 <thread_start_threading+0x146>
            break;
        }

        // no thread in run_queue, release_queue not empty
        printf("run_queue is empty, sleep for %d ticks\n", allocated_time);
    259c:	00001797          	auipc	a5,0x1
    25a0:	8b478793          	addi	a5,a5,-1868 # 2e50 <allocated_time>
    25a4:	639c                	ld	a5,0(a5)
    25a6:	85be                	mv	a1,a5
    25a8:	00001517          	auipc	a0,0x1
    25ac:	81050513          	addi	a0,a0,-2032 # 2db8 <schedule_dm+0x68e>
    25b0:	fffff097          	auipc	ra,0xfffff
    25b4:	0a8080e7          	jalr	168(ra) # 1658 <printf>
        sleeping = 1;
    25b8:	00001797          	auipc	a5,0x1
    25bc:	89478793          	addi	a5,a5,-1900 # 2e4c <sleeping>
    25c0:	4705                	li	a4,1
    25c2:	c398                	sw	a4,0(a5)
        thrdstop(allocated_time, &main_thrd_id, back_to_main_handler, (void *)allocated_time);
    25c4:	00001797          	auipc	a5,0x1
    25c8:	88c78793          	addi	a5,a5,-1908 # 2e50 <allocated_time>
    25cc:	639c                	ld	a5,0(a5)
    25ce:	0007871b          	sext.w	a4,a5
    25d2:	00001797          	auipc	a5,0x1
    25d6:	87e78793          	addi	a5,a5,-1922 # 2e50 <allocated_time>
    25da:	639c                	ld	a5,0(a5)
    25dc:	86be                	mv	a3,a5
    25de:	00000617          	auipc	a2,0x0
    25e2:	eb060613          	addi	a2,a2,-336 # 248e <back_to_main_handler>
    25e6:	00001597          	auipc	a1,0x1
    25ea:	83258593          	addi	a1,a1,-1998 # 2e18 <main_thrd_id>
    25ee:	853a                	mv	a0,a4
    25f0:	fffff097          	auipc	ra,0xfffff
    25f4:	bc2080e7          	jalr	-1086(ra) # 11b2 <thrdstop>
        while (sleeping) {
    25f8:	0001                	nop
    25fa:	00001797          	auipc	a5,0x1
    25fe:	85278793          	addi	a5,a5,-1966 # 2e4c <sleeping>
    2602:	439c                	lw	a5,0(a5)
    2604:	fbfd                	bnez	a5,25fa <thread_start_threading+0x110>
    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    2606:	00000517          	auipc	a0,0x0
    260a:	7f250513          	addi	a0,a0,2034 # 2df8 <run_queue>
    260e:	fffff097          	auipc	ra,0xfffff
    2612:	4d8080e7          	jalr	1240(ra) # 1ae6 <list_empty>
    2616:	87aa                	mv	a5,a0
    2618:	d79d                	beqz	a5,2546 <thread_start_threading+0x5c>
    261a:	00000517          	auipc	a0,0x0
    261e:	7ee50513          	addi	a0,a0,2030 # 2e08 <release_queue>
    2622:	fffff097          	auipc	ra,0xfffff
    2626:	4c4080e7          	jalr	1220(ra) # 1ae6 <list_empty>
    262a:	87aa                	mv	a5,a0
    262c:	df89                	beqz	a5,2546 <thread_start_threading+0x5c>
            // zzz...
        }
    }
}
    262e:	a011                	j	2632 <thread_start_threading+0x148>
            break;
    2630:	0001                	nop
}
    2632:	0001                	nop
    2634:	60a2                	ld	ra,8(sp)
    2636:	6402                	ld	s0,0(sp)
    2638:	0141                	addi	sp,sp,16
    263a:	8082                	ret

000000000000263c <__check_deadline_miss>:

/* MP3 Part 2 - Real-Time Scheduling*/

#if defined(THREAD_SCHEDULER_EDF_CBS) || defined(THREAD_SCHEDULER_DM)
static struct thread *__check_deadline_miss(struct list_head *run_queue, int current_time)
{
    263c:	7139                	addi	sp,sp,-64
    263e:	fc22                	sd	s0,56(sp)
    2640:	0080                	addi	s0,sp,64
    2642:	fca43423          	sd	a0,-56(s0)
    2646:	87ae                	mv	a5,a1
    2648:	fcf42223          	sw	a5,-60(s0)
    struct thread *th = NULL;
    264c:	fe043423          	sd	zero,-24(s0)
    struct thread *thread_missing_deadline = NULL;
    2650:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    2654:	fc843783          	ld	a5,-56(s0)
    2658:	639c                	ld	a5,0(a5)
    265a:	fcf43c23          	sd	a5,-40(s0)
    265e:	fd843783          	ld	a5,-40(s0)
    2662:	fd878793          	addi	a5,a5,-40
    2666:	fef43423          	sd	a5,-24(s0)
    266a:	a881                	j	26ba <__check_deadline_miss+0x7e>
        if (th->current_deadline <= current_time) {
    266c:	fe843783          	ld	a5,-24(s0)
    2670:	4fb8                	lw	a4,88(a5)
    2672:	fc442783          	lw	a5,-60(s0)
    2676:	2781                	sext.w	a5,a5
    2678:	02e7c663          	blt	a5,a4,26a4 <__check_deadline_miss+0x68>
            if (thread_missing_deadline == NULL)
    267c:	fe043783          	ld	a5,-32(s0)
    2680:	e791                	bnez	a5,268c <__check_deadline_miss+0x50>
                thread_missing_deadline = th;
    2682:	fe843783          	ld	a5,-24(s0)
    2686:	fef43023          	sd	a5,-32(s0)
    268a:	a829                	j	26a4 <__check_deadline_miss+0x68>
            else if (th->ID < thread_missing_deadline->ID)
    268c:	fe843783          	ld	a5,-24(s0)
    2690:	5fd8                	lw	a4,60(a5)
    2692:	fe043783          	ld	a5,-32(s0)
    2696:	5fdc                	lw	a5,60(a5)
    2698:	00f75663          	bge	a4,a5,26a4 <__check_deadline_miss+0x68>
                thread_missing_deadline = th;
    269c:	fe843783          	ld	a5,-24(s0)
    26a0:	fef43023          	sd	a5,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    26a4:	fe843783          	ld	a5,-24(s0)
    26a8:	779c                	ld	a5,40(a5)
    26aa:	fcf43823          	sd	a5,-48(s0)
    26ae:	fd043783          	ld	a5,-48(s0)
    26b2:	fd878793          	addi	a5,a5,-40
    26b6:	fef43423          	sd	a5,-24(s0)
    26ba:	fe843783          	ld	a5,-24(s0)
    26be:	02878793          	addi	a5,a5,40
    26c2:	fc843703          	ld	a4,-56(s0)
    26c6:	faf713e3          	bne	a4,a5,266c <__check_deadline_miss+0x30>
        }
    }
    return thread_missing_deadline;
    26ca:	fe043783          	ld	a5,-32(s0)
}
    26ce:	853e                	mv	a0,a5
    26d0:	7462                	ld	s0,56(sp)
    26d2:	6121                	addi	sp,sp,64
    26d4:	8082                	ret

00000000000026d6 <__dm_thread_cmp>:
#endif

#ifdef THREAD_SCHEDULER_DM
/* Deadline-Monotonic Scheduling */
static int __dm_thread_cmp(struct thread *a, struct thread *b)
{
    26d6:	1101                	addi	sp,sp,-32
    26d8:	ec22                	sd	s0,24(sp)
    26da:	1000                	addi	s0,sp,32
    26dc:	fea43423          	sd	a0,-24(s0)
    26e0:	feb43023          	sd	a1,-32(s0)
    //To DO
    if (a -> deadline < b -> deadline)
    26e4:	fe843783          	ld	a5,-24(s0)
    26e8:	47b8                	lw	a4,72(a5)
    26ea:	fe043783          	ld	a5,-32(s0)
    26ee:	47bc                	lw	a5,72(a5)
    26f0:	00f75463          	bge	a4,a5,26f8 <__dm_thread_cmp+0x22>
        return 1;
    26f4:	4785                	li	a5,1
    26f6:	a035                	j	2722 <__dm_thread_cmp+0x4c>
    else if (a -> deadline > b -> deadline)
    26f8:	fe843783          	ld	a5,-24(s0)
    26fc:	47b8                	lw	a4,72(a5)
    26fe:	fe043783          	ld	a5,-32(s0)
    2702:	47bc                	lw	a5,72(a5)
    2704:	00e7d463          	bge	a5,a4,270c <__dm_thread_cmp+0x36>
        return 0;
    2708:	4781                	li	a5,0
    270a:	a821                	j	2722 <__dm_thread_cmp+0x4c>
    else if (a -> ID < b -> ID)
    270c:	fe843783          	ld	a5,-24(s0)
    2710:	5fd8                	lw	a4,60(a5)
    2712:	fe043783          	ld	a5,-32(s0)
    2716:	5fdc                	lw	a5,60(a5)
    2718:	00f75463          	bge	a4,a5,2720 <__dm_thread_cmp+0x4a>
        return 1;
    271c:	4785                	li	a5,1
    271e:	a011                	j	2722 <__dm_thread_cmp+0x4c>
    else 
        return 0;
    2720:	4781                	li	a5,0
}
    2722:	853e                	mv	a0,a5
    2724:	6462                	ld	s0,24(sp)
    2726:	6105                	addi	sp,sp,32
    2728:	8082                	ret

000000000000272a <schedule_dm>:

struct threads_sched_result schedule_dm(struct threads_sched_args args)
{
    272a:	7171                	addi	sp,sp,-176
    272c:	f506                	sd	ra,168(sp)
    272e:	f122                	sd	s0,160(sp)
    2730:	ed26                	sd	s1,152(sp)
    2732:	e94a                	sd	s2,144(sp)
    2734:	e54e                	sd	s3,136(sp)
    2736:	1900                	addi	s0,sp,176
    2738:	84aa                	mv	s1,a0
    struct threads_sched_result r;

    // first check if there is any thread has missed its current deadline
    // TO DO
    struct thread *thread_dm = __check_deadline_miss(args.run_queue, args.current_time);
    273a:	649c                	ld	a5,8(s1)
    273c:	4098                	lw	a4,0(s1)
    273e:	85ba                	mv	a1,a4
    2740:	853e                	mv	a0,a5
    2742:	00000097          	auipc	ra,0x0
    2746:	efa080e7          	jalr	-262(ra) # 263c <__check_deadline_miss>
    274a:	fca43423          	sd	a0,-56(s0)
    if (thread_dm != NULL){
    274e:	fc843783          	ld	a5,-56(s0)
    2752:	c395                	beqz	a5,2776 <schedule_dm+0x4c>
        r.scheduled_thread_list_member = &thread_dm -> thread_list;
    2754:	fc843783          	ld	a5,-56(s0)
    2758:	02878793          	addi	a5,a5,40
    275c:	f4f43823          	sd	a5,-176(s0)
        r.allocated_time = 0;
    2760:	f4042c23          	sw	zero,-168(s0)
        return r;
    2764:	f5043783          	ld	a5,-176(s0)
    2768:	f6f43023          	sd	a5,-160(s0)
    276c:	f5843783          	ld	a5,-168(s0)
    2770:	f6f43423          	sd	a5,-152(s0)
    2774:	aad9                	j	294a <schedule_dm+0x220>
    }

    // handle the case where run queue is empty
    // TO DO
    struct thread *th = NULL;
    2776:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(th, args.run_queue, thread_list){
    277a:	649c                	ld	a5,8(s1)
    277c:	639c                	ld	a5,0(a5)
    277e:	faf43423          	sd	a5,-88(s0)
    2782:	fa843783          	ld	a5,-88(s0)
    2786:	fd878793          	addi	a5,a5,-40
    278a:	fcf43023          	sd	a5,-64(s0)
    278e:	a0a9                	j	27d8 <schedule_dm+0xae>
        if (thread_dm == NULL)
    2790:	fc843783          	ld	a5,-56(s0)
    2794:	e791                	bnez	a5,27a0 <schedule_dm+0x76>
            thread_dm = th;
    2796:	fc043783          	ld	a5,-64(s0)
    279a:	fcf43423          	sd	a5,-56(s0)
    279e:	a015                	j	27c2 <schedule_dm+0x98>
        else if (__dm_thread_cmp(th, thread_dm) == 1)
    27a0:	fc843583          	ld	a1,-56(s0)
    27a4:	fc043503          	ld	a0,-64(s0)
    27a8:	00000097          	auipc	ra,0x0
    27ac:	f2e080e7          	jalr	-210(ra) # 26d6 <__dm_thread_cmp>
    27b0:	87aa                	mv	a5,a0
    27b2:	873e                	mv	a4,a5
    27b4:	4785                	li	a5,1
    27b6:	00f71663          	bne	a4,a5,27c2 <schedule_dm+0x98>
            thread_dm = th;
    27ba:	fc043783          	ld	a5,-64(s0)
    27be:	fcf43423          	sd	a5,-56(s0)
    list_for_each_entry(th, args.run_queue, thread_list){
    27c2:	fc043783          	ld	a5,-64(s0)
    27c6:	779c                	ld	a5,40(a5)
    27c8:	f6f43823          	sd	a5,-144(s0)
    27cc:	f7043783          	ld	a5,-144(s0)
    27d0:	fd878793          	addi	a5,a5,-40
    27d4:	fcf43023          	sd	a5,-64(s0)
    27d8:	fc043783          	ld	a5,-64(s0)
    27dc:	02878713          	addi	a4,a5,40
    27e0:	649c                	ld	a5,8(s1)
    27e2:	faf717e3          	bne	a4,a5,2790 <schedule_dm+0x66>
    }
    struct release_queue_entry *entry = NULL;
    27e6:	fa043c23          	sd	zero,-72(s0)
    if (thread_dm != NULL){
    27ea:	fc843783          	ld	a5,-56(s0)
    27ee:	cfd5                	beqz	a5,28aa <schedule_dm+0x180>
        int next_stop = thread_dm -> current_deadline - args.current_time;
    27f0:	fc843783          	ld	a5,-56(s0)
    27f4:	4fb8                	lw	a4,88(a5)
    27f6:	409c                	lw	a5,0(s1)
    27f8:	40f707bb          	subw	a5,a4,a5
    27fc:	faf42a23          	sw	a5,-76(s0)
        list_for_each_entry(entry, args.release_queue, thread_list){
    2800:	689c                	ld	a5,16(s1)
    2802:	639c                	ld	a5,0(a5)
    2804:	f8f43423          	sd	a5,-120(s0)
    2808:	f8843783          	ld	a5,-120(s0)
    280c:	17e1                	addi	a5,a5,-8
    280e:	faf43c23          	sd	a5,-72(s0)
    2812:	a8b1                	j	286e <schedule_dm+0x144>
            if (__dm_thread_cmp(entry -> thrd, thread_dm) == 1){
    2814:	fb843783          	ld	a5,-72(s0)
    2818:	639c                	ld	a5,0(a5)
    281a:	fc843583          	ld	a1,-56(s0)
    281e:	853e                	mv	a0,a5
    2820:	00000097          	auipc	ra,0x0
    2824:	eb6080e7          	jalr	-330(ra) # 26d6 <__dm_thread_cmp>
    2828:	87aa                	mv	a5,a0
    282a:	873e                	mv	a4,a5
    282c:	4785                	li	a5,1
    282e:	02f71663          	bne	a4,a5,285a <schedule_dm+0x130>
                int next_th = entry -> release_time - args.current_time;
    2832:	fb843783          	ld	a5,-72(s0)
    2836:	4f98                	lw	a4,24(a5)
    2838:	409c                	lw	a5,0(s1)
    283a:	40f707bb          	subw	a5,a4,a5
    283e:	f8f42223          	sw	a5,-124(s0)
                if (next_th < next_stop)
    2842:	f8442703          	lw	a4,-124(s0)
    2846:	fb442783          	lw	a5,-76(s0)
    284a:	2701                	sext.w	a4,a4
    284c:	2781                	sext.w	a5,a5
    284e:	00f75663          	bge	a4,a5,285a <schedule_dm+0x130>
                    next_stop = next_th;
    2852:	f8442783          	lw	a5,-124(s0)
    2856:	faf42a23          	sw	a5,-76(s0)
        list_for_each_entry(entry, args.release_queue, thread_list){
    285a:	fb843783          	ld	a5,-72(s0)
    285e:	679c                	ld	a5,8(a5)
    2860:	f6f43c23          	sd	a5,-136(s0)
    2864:	f7843783          	ld	a5,-136(s0)
    2868:	17e1                	addi	a5,a5,-8
    286a:	faf43c23          	sd	a5,-72(s0)
    286e:	fb843783          	ld	a5,-72(s0)
    2872:	00878713          	addi	a4,a5,8
    2876:	689c                	ld	a5,16(s1)
    2878:	f8f71ee3          	bne	a4,a5,2814 <schedule_dm+0xea>
            }
        }
        r.scheduled_thread_list_member = &thread_dm -> thread_list;
    287c:	fc843783          	ld	a5,-56(s0)
    2880:	02878793          	addi	a5,a5,40
    2884:	f4f43823          	sd	a5,-176(s0)
        r.allocated_time = thread_dm -> remaining_time < next_stop? thread_dm -> remaining_time:next_stop;
    2888:	fc843783          	ld	a5,-56(s0)
    288c:	4bfc                	lw	a5,84(a5)
    288e:	863e                	mv	a2,a5
    2890:	fb442783          	lw	a5,-76(s0)
    2894:	0007869b          	sext.w	a3,a5
    2898:	0006071b          	sext.w	a4,a2
    289c:	00d75363          	bge	a4,a3,28a2 <schedule_dm+0x178>
    28a0:	87b2                	mv	a5,a2
    28a2:	2781                	sext.w	a5,a5
    28a4:	f4f42c23          	sw	a5,-168(s0)
    28a8:	a849                	j	293a <schedule_dm+0x210>
    }
    else {
        int next_stop = INT_MAX;
    28aa:	800007b7          	lui	a5,0x80000
    28ae:	fff7c793          	not	a5,a5
    28b2:	faf42823          	sw	a5,-80(s0)
        r.scheduled_thread_list_member = args.run_queue;
    28b6:	649c                	ld	a5,8(s1)
    28b8:	f4f43823          	sd	a5,-176(s0)
        list_for_each_entry(entry, args.release_queue, thread_list){
    28bc:	689c                	ld	a5,16(s1)
    28be:	639c                	ld	a5,0(a5)
    28c0:	faf43023          	sd	a5,-96(s0)
    28c4:	fa043783          	ld	a5,-96(s0)
    28c8:	17e1                	addi	a5,a5,-8
    28ca:	faf43c23          	sd	a5,-72(s0)
    28ce:	a83d                	j	290c <schedule_dm+0x1e2>
            int next_th = entry -> release_time - args.current_time;
    28d0:	fb843783          	ld	a5,-72(s0)
    28d4:	4f98                	lw	a4,24(a5)
    28d6:	409c                	lw	a5,0(s1)
    28d8:	40f707bb          	subw	a5,a4,a5
    28dc:	f8f42e23          	sw	a5,-100(s0)
            if (next_th < next_stop)
    28e0:	f9c42703          	lw	a4,-100(s0)
    28e4:	fb042783          	lw	a5,-80(s0)
    28e8:	2701                	sext.w	a4,a4
    28ea:	2781                	sext.w	a5,a5
    28ec:	00f75663          	bge	a4,a5,28f8 <schedule_dm+0x1ce>
                next_stop = next_th;
    28f0:	f9c42783          	lw	a5,-100(s0)
    28f4:	faf42823          	sw	a5,-80(s0)
        list_for_each_entry(entry, args.release_queue, thread_list){
    28f8:	fb843783          	ld	a5,-72(s0)
    28fc:	679c                	ld	a5,8(a5)
    28fe:	f8f43823          	sd	a5,-112(s0)
    2902:	f9043783          	ld	a5,-112(s0)
    2906:	17e1                	addi	a5,a5,-8
    2908:	faf43c23          	sd	a5,-72(s0)
    290c:	fb843783          	ld	a5,-72(s0)
    2910:	00878713          	addi	a4,a5,8 # ffffffff80000008 <__global_pointer$+0xffffffff7fffca28>
    2914:	689c                	ld	a5,16(s1)
    2916:	faf71de3          	bne	a4,a5,28d0 <schedule_dm+0x1a6>
        }
        
        r.allocated_time = (next_stop == INT_MAX)?1:next_stop;
    291a:	fb042783          	lw	a5,-80(s0)
    291e:	0007871b          	sext.w	a4,a5
    2922:	800007b7          	lui	a5,0x80000
    2926:	fff7c793          	not	a5,a5
    292a:	00f70563          	beq	a4,a5,2934 <schedule_dm+0x20a>
    292e:	fb042783          	lw	a5,-80(s0)
    2932:	a011                	j	2936 <schedule_dm+0x20c>
    2934:	4785                	li	a5,1
    2936:	f4f42c23          	sw	a5,-168(s0)
    }
    return r;
    293a:	f5043783          	ld	a5,-176(s0)
    293e:	f6f43023          	sd	a5,-160(s0)
    2942:	f5843783          	ld	a5,-168(s0)
    2946:	f6f43423          	sd	a5,-152(s0)
    294a:	4701                	li	a4,0
    294c:	f6043703          	ld	a4,-160(s0)
    2950:	4781                	li	a5,0
    2952:	f6843783          	ld	a5,-152(s0)
    2956:	893a                	mv	s2,a4
    2958:	89be                	mv	s3,a5
    295a:	874a                	mv	a4,s2
    295c:	87ce                	mv	a5,s3
}
    295e:	853a                	mv	a0,a4
    2960:	85be                	mv	a1,a5
    2962:	70aa                	ld	ra,168(sp)
    2964:	740a                	ld	s0,160(sp)
    2966:	64ea                	ld	s1,152(sp)
    2968:	694a                	ld	s2,144(sp)
    296a:	69aa                	ld	s3,136(sp)
    296c:	614d                	addi	sp,sp,176
    296e:	8082                	ret
