
user/_gah:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <read_until_match>:
 * Store the string from stdin in `buf` before receiving a `match`.
 * @param buf: buffer to store received stdin excluding `match`
 * @param buf_sz: buffer size
 */
void read_until_match(const char *match, char *buf, uint buf_sz)
{
   0:	db010113          	addi	sp,sp,-592
   4:	24113423          	sd	ra,584(sp)
   8:	24813023          	sd	s0,576(sp)
   c:	22913c23          	sd	s1,568(sp)
  10:	23213823          	sd	s2,560(sp)
  14:	23313423          	sd	s3,552(sp)
  18:	23413023          	sd	s4,544(sp)
  1c:	21513c23          	sd	s5,536(sp)
  20:	21613823          	sd	s6,528(sp)
  24:	21713423          	sd	s7,520(sp)
  28:	21813023          	sd	s8,512(sp)
  2c:	0c80                	addi	s0,sp,592
  2e:	89aa                	mv	s3,a0
  30:	8bae                	mv	s7,a1
  32:	8a32                	mv	s4,a2
  uint bi = 0; // buffer index
  const uint tar_len = strlen(match);
  34:	286000ef          	jal	ra,2ba <strlen>
  38:	00050b1b          	sext.w	s6,a0
  char cache[512];
  uint n;
  uint has_read = 0;

  buf[buf_sz - 1] = '\0';
  3c:	fffa079b          	addiw	a5,s4,-1
  40:	1782                	slli	a5,a5,0x20
  42:	9381                	srli	a5,a5,0x20
  44:	97de                	add	a5,a5,s7
  46:	00078023          	sb	zero,0(a5)
  uint has_read = 0;
  4a:	4481                	li	s1,0
  uint bi = 0; // buffer index
  4c:	4901                	li	s2,0

  while ((n = read(0, cache, sizeof(cache))) > 0)
  4e:	4a81                	li	s5,0
      {
        has_read = 0;                    // found not matched, reset read index
        if (cache[i] == match[has_read]) // check from start (for single word matching case)
        {
          ++has_read;
          if (has_read == tar_len)
  50:	4c05                	li	s8,1
  while ((n = read(0, cache, sizeof(cache))) > 0)
  52:	a0b9                	j	a0 <read_until_match+0xa0>
        ++has_read;
  54:	2485                	addiw	s1,s1,1
        if (has_read == tar_len)
  56:	069b0863          	beq	s6,s1,c6 <read_until_match+0xc6>
    for (uint i = 0; i < n; ++i)
  5a:	0785                	addi	a5,a5,1
  5c:	04c78063          	beq	a5,a2,9c <read_until_match+0x9c>
      if (bi < buf_sz)
  60:	01497b63          	bgeu	s2,s4,76 <read_until_match+0x76>
        buf[bi++] = cache[i];          // if the buffer is not full, store char into buf
  64:	02091713          	slli	a4,s2,0x20
  68:	9301                	srli	a4,a4,0x20
  6a:	975e                	add	a4,a4,s7
  6c:	0007c683          	lbu	a3,0(a5)
  70:	00d70023          	sb	a3,0(a4)
  74:	2905                	addiw	s2,s2,1
      if (cache[i] == match[has_read]) // matched
  76:	0007c683          	lbu	a3,0(a5)
  7a:	02049713          	slli	a4,s1,0x20
  7e:	9301                	srli	a4,a4,0x20
  80:	974e                	add	a4,a4,s3
  82:	00074703          	lbu	a4,0(a4)
  86:	fcd707e3          	beq	a4,a3,54 <read_until_match+0x54>
        if (cache[i] == match[has_read]) // check from start (for single word matching case)
  8a:	0009c703          	lbu	a4,0(s3)
        has_read = 0;                    // found not matched, reset read index
  8e:	84d6                	mv	s1,s5
        if (cache[i] == match[has_read]) // check from start (for single word matching case)
  90:	fcd715e3          	bne	a4,a3,5a <read_until_match+0x5a>
          if (has_read == tar_len)
  94:	038b0963          	beq	s6,s8,c6 <read_until_match+0xc6>
          ++has_read;
  98:	84e2                	mv	s1,s8
  9a:	b7c1                	j	5a <read_until_match+0x5a>
            break; // fully matched
        }
      }
    }
    if (has_read == tar_len)
  9c:	03648563          	beq	s1,s6,c6 <read_until_match+0xc6>
  while ((n = read(0, cache, sizeof(cache))) > 0)
  a0:	20000613          	li	a2,512
  a4:	db040593          	addi	a1,s0,-592
  a8:	8556                	mv	a0,s5
  aa:	43a000ef          	jal	ra,4e4 <read>
  ae:	2501                	sext.w	a0,a0
  b0:	c919                	beqz	a0,c6 <read_until_match+0xc6>
  b2:	db040793          	addi	a5,s0,-592
  b6:	fff5061b          	addiw	a2,a0,-1
  ba:	1602                	slli	a2,a2,0x20
  bc:	9201                	srli	a2,a2,0x20
  be:	db140713          	addi	a4,s0,-591
  c2:	963a                	add	a2,a2,a4
  c4:	bf71                	j	60 <read_until_match+0x60>
      break; // fully matched
  }

  buf[bi - tar_len] = '\0';
  c6:	416907bb          	subw	a5,s2,s6
  ca:	1782                	slli	a5,a5,0x20
  cc:	9381                	srli	a5,a5,0x20
  ce:	97de                	add	a5,a5,s7
  d0:	00078023          	sb	zero,0(a5)
}
  d4:	24813083          	ld	ra,584(sp)
  d8:	24013403          	ld	s0,576(sp)
  dc:	23813483          	ld	s1,568(sp)
  e0:	23013903          	ld	s2,560(sp)
  e4:	22813983          	ld	s3,552(sp)
  e8:	22013a03          	ld	s4,544(sp)
  ec:	21813a83          	ld	s5,536(sp)
  f0:	21013b03          	ld	s6,528(sp)
  f4:	20813b83          	ld	s7,520(sp)
  f8:	20013c03          	ld	s8,512(sp)
  fc:	25010113          	addi	sp,sp,592
 100:	8082                	ret

0000000000000102 <gen_and_hold>:
#include "kernel/fcntl.h"
#include "user/user.h"
#include "user/ok.h"

int gen_and_hold(char *filename)
{
 102:	1141                	addi	sp,sp,-16
 104:	e406                	sd	ra,8(sp)
 106:	e022                	sd	s0,0(sp)
 108:	0800                	addi	s0,sp,16
  int fd = open(filename, O_CREATE | O_RDWR);
 10a:	20200593          	li	a1,514
 10e:	3fe000ef          	jal	ra,50c <open>
  return fd;
}
 112:	60a2                	ld	ra,8(sp)
 114:	6402                	ld	s0,0(sp)
 116:	0141                	addi	sp,sp,16
 118:	8082                	ret

000000000000011a <work>:

void work(const char *dir, int gen_cnt)
{
 11a:	7159                	addi	sp,sp,-112
 11c:	f486                	sd	ra,104(sp)
 11e:	f0a2                	sd	s0,96(sp)
 120:	eca6                	sd	s1,88(sp)
 122:	e8ca                	sd	s2,80(sp)
 124:	e4ce                	sd	s3,72(sp)
 126:	e0d2                	sd	s4,64(sp)
 128:	fc56                	sd	s5,56(sp)
 12a:	f85a                	sd	s6,48(sp)
 12c:	f45e                	sd	s7,40(sp)
 12e:	1880                	addi	s0,sp,112
 130:	84aa                	mv	s1,a0
 132:	8b2e                	mv	s6,a1
  char filename[20];
  memset(filename, 20, sizeof(char));
 134:	4605                	li	a2,1
 136:	45d1                	li	a1,20
 138:	f9840513          	addi	a0,s0,-104
 13c:	1a8000ef          	jal	ra,2e4 <memset>
  strcpy(filename, dir);
 140:	85a6                	mv	a1,s1
 142:	f9840513          	addi	a0,s0,-104
 146:	12c000ef          	jal	ra,272 <strcpy>
  uint len = strlen(filename);
 14a:	f9840513          	addi	a0,s0,-104
 14e:	16c000ef          	jal	ra,2ba <strlen>
 152:	0005099b          	sext.w	s3,a0
  filename[len] = '/';
 156:	1502                	slli	a0,a0,0x20
 158:	9101                	srli	a0,a0,0x20
 15a:	fb040793          	addi	a5,s0,-80
 15e:	953e                	add	a0,a0,a5
 160:	02f00793          	li	a5,47
 164:	fef50423          	sb	a5,-24(a0)

  for (int i = 0; i < gen_cnt; ++i)
 168:	07605663          	blez	s6,1d4 <work+0xba>
 16c:	4481                	li	s1,0
  {
    filename[len + 1] = '0' + (i / 100) % 10;
 16e:	00198a9b          	addiw	s5,s3,1
 172:	1a82                	slli	s5,s5,0x20
 174:	020ada93          	srli	s5,s5,0x20
 178:	fb040793          	addi	a5,s0,-80
 17c:	9abe                	add	s5,s5,a5
 17e:	06400b93          	li	s7,100
 182:	4929                	li	s2,10
    filename[len + 2] = '0' + (i / 10) % 10;
 184:	00298a1b          	addiw	s4,s3,2
 188:	1a02                	slli	s4,s4,0x20
 18a:	020a5a13          	srli	s4,s4,0x20
 18e:	9a3e                	add	s4,s4,a5
    filename[len + 3] = '0' + i % 10;
 190:	298d                	addiw	s3,s3,3
 192:	1982                	slli	s3,s3,0x20
 194:	0209d993          	srli	s3,s3,0x20
 198:	99be                	add	s3,s3,a5
    filename[len + 1] = '0' + (i / 100) % 10;
 19a:	0374c7bb          	divw	a5,s1,s7
 19e:	0327e7bb          	remw	a5,a5,s2
 1a2:	0307879b          	addiw	a5,a5,48
 1a6:	fefa8423          	sb	a5,-24(s5)
    filename[len + 2] = '0' + (i / 10) % 10;
 1aa:	0324c7bb          	divw	a5,s1,s2
 1ae:	0327e7bb          	remw	a5,a5,s2
 1b2:	0307879b          	addiw	a5,a5,48
 1b6:	fefa0423          	sb	a5,-24(s4)
    filename[len + 3] = '0' + i % 10;
 1ba:	0324e7bb          	remw	a5,s1,s2
 1be:	0307879b          	addiw	a5,a5,48
 1c2:	fef98423          	sb	a5,-24(s3)
    gen_and_hold(filename);
 1c6:	f9840513          	addi	a0,s0,-104
 1ca:	f39ff0ef          	jal	ra,102 <gen_and_hold>
  for (int i = 0; i < gen_cnt; ++i)
 1ce:	2485                	addiw	s1,s1,1
 1d0:	fc9b15e3          	bne	s6,s1,19a <work+0x80>
  }
}
 1d4:	70a6                	ld	ra,104(sp)
 1d6:	7406                	ld	s0,96(sp)
 1d8:	64e6                	ld	s1,88(sp)
 1da:	6946                	ld	s2,80(sp)
 1dc:	69a6                	ld	s3,72(sp)
 1de:	6a06                	ld	s4,64(sp)
 1e0:	7ae2                	ld	s5,56(sp)
 1e2:	7b42                	ld	s6,48(sp)
 1e4:	7ba2                	ld	s7,40(sp)
 1e6:	6165                	addi	sp,sp,112
 1e8:	8082                	ret

00000000000001ea <main>:

int main(int argc, char *argv[])
{
 1ea:	de010113          	addi	sp,sp,-544
 1ee:	20113c23          	sd	ra,536(sp)
 1f2:	20813823          	sd	s0,528(sp)
 1f6:	20913423          	sd	s1,520(sp)
 1fa:	21213023          	sd	s2,512(sp)
 1fe:	1400                	addi	s0,sp,544
  if (argc != 3)
 200:	478d                	li	a5,3
 202:	00f50b63          	beq	a0,a5,218 <main+0x2e>
  {
    printf("gen_and_hold <dir> <num> - generate and hold files\n");
 206:	00001517          	auipc	a0,0x1
 20a:	87a50513          	addi	a0,a0,-1926 # a80 <malloc+0xe0>
 20e:	6d8000ef          	jal	ra,8e6 <printf>
    exit(0);
 212:	4501                	li	a0,0
 214:	2b8000ef          	jal	ra,4cc <exit>
 218:	84ae                	mv	s1,a1
  }

  printf("%d", getpid());
 21a:	332000ef          	jal	ra,54c <getpid>
 21e:	85aa                	mv	a1,a0
 220:	00001517          	auipc	a0,0x1
 224:	89850513          	addi	a0,a0,-1896 # ab8 <malloc+0x118>
 228:	6be000ef          	jal	ra,8e6 <printf>

  char buf[512];
  read_until_match("Ok", buf, sizeof(buf));
 22c:	20000613          	li	a2,512
 230:	de040593          	addi	a1,s0,-544
 234:	00001517          	auipc	a0,0x1
 238:	88c50513          	addi	a0,a0,-1908 # ac0 <malloc+0x120>
 23c:	dc5ff0ef          	jal	ra,0 <read_until_match>
  work(argv[1], atoi(argv[2]));
 240:	0084b903          	ld	s2,8(s1)
 244:	6888                	ld	a0,16(s1)
 246:	18e000ef          	jal	ra,3d4 <atoi>
 24a:	85aa                	mv	a1,a0
 24c:	854a                	mv	a0,s2
 24e:	ecdff0ef          	jal	ra,11a <work>
  printf("Ok");
 252:	00001517          	auipc	a0,0x1
 256:	86e50513          	addi	a0,a0,-1938 # ac0 <malloc+0x120>
 25a:	68c000ef          	jal	ra,8e6 <printf>

  while (1)
 25e:	a001                	j	25e <main+0x74>

0000000000000260 <start>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
start()
{
 260:	1141                	addi	sp,sp,-16
 262:	e406                	sd	ra,8(sp)
 264:	e022                	sd	s0,0(sp)
 266:	0800                	addi	s0,sp,16
  extern int main();
  main();
 268:	f83ff0ef          	jal	ra,1ea <main>
  exit(0);
 26c:	4501                	li	a0,0
 26e:	25e000ef          	jal	ra,4cc <exit>

0000000000000272 <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
 272:	1141                	addi	sp,sp,-16
 274:	e422                	sd	s0,8(sp)
 276:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 278:	87aa                	mv	a5,a0
 27a:	0585                	addi	a1,a1,1
 27c:	0785                	addi	a5,a5,1
 27e:	fff5c703          	lbu	a4,-1(a1)
 282:	fee78fa3          	sb	a4,-1(a5)
 286:	fb75                	bnez	a4,27a <strcpy+0x8>
    ;
  return os;
}
 288:	6422                	ld	s0,8(sp)
 28a:	0141                	addi	sp,sp,16
 28c:	8082                	ret

000000000000028e <strcmp>:

int
strcmp(const char *p, const char *q)
{
 28e:	1141                	addi	sp,sp,-16
 290:	e422                	sd	s0,8(sp)
 292:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 294:	00054783          	lbu	a5,0(a0)
 298:	cb91                	beqz	a5,2ac <strcmp+0x1e>
 29a:	0005c703          	lbu	a4,0(a1)
 29e:	00f71763          	bne	a4,a5,2ac <strcmp+0x1e>
    p++, q++;
 2a2:	0505                	addi	a0,a0,1
 2a4:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 2a6:	00054783          	lbu	a5,0(a0)
 2aa:	fbe5                	bnez	a5,29a <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 2ac:	0005c503          	lbu	a0,0(a1)
}
 2b0:	40a7853b          	subw	a0,a5,a0
 2b4:	6422                	ld	s0,8(sp)
 2b6:	0141                	addi	sp,sp,16
 2b8:	8082                	ret

00000000000002ba <strlen>:

uint
strlen(const char *s)
{
 2ba:	1141                	addi	sp,sp,-16
 2bc:	e422                	sd	s0,8(sp)
 2be:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 2c0:	00054783          	lbu	a5,0(a0)
 2c4:	cf91                	beqz	a5,2e0 <strlen+0x26>
 2c6:	0505                	addi	a0,a0,1
 2c8:	87aa                	mv	a5,a0
 2ca:	4685                	li	a3,1
 2cc:	9e89                	subw	a3,a3,a0
 2ce:	00f6853b          	addw	a0,a3,a5
 2d2:	0785                	addi	a5,a5,1
 2d4:	fff7c703          	lbu	a4,-1(a5)
 2d8:	fb7d                	bnez	a4,2ce <strlen+0x14>
    ;
  return n;
}
 2da:	6422                	ld	s0,8(sp)
 2dc:	0141                	addi	sp,sp,16
 2de:	8082                	ret
  for(n = 0; s[n]; n++)
 2e0:	4501                	li	a0,0
 2e2:	bfe5                	j	2da <strlen+0x20>

00000000000002e4 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2e4:	1141                	addi	sp,sp,-16
 2e6:	e422                	sd	s0,8(sp)
 2e8:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 2ea:	ca19                	beqz	a2,300 <memset+0x1c>
 2ec:	87aa                	mv	a5,a0
 2ee:	1602                	slli	a2,a2,0x20
 2f0:	9201                	srli	a2,a2,0x20
 2f2:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 2f6:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 2fa:	0785                	addi	a5,a5,1
 2fc:	fee79de3          	bne	a5,a4,2f6 <memset+0x12>
  }
  return dst;
}
 300:	6422                	ld	s0,8(sp)
 302:	0141                	addi	sp,sp,16
 304:	8082                	ret

0000000000000306 <strchr>:

char*
strchr(const char *s, char c)
{
 306:	1141                	addi	sp,sp,-16
 308:	e422                	sd	s0,8(sp)
 30a:	0800                	addi	s0,sp,16
  for(; *s; s++)
 30c:	00054783          	lbu	a5,0(a0)
 310:	cb99                	beqz	a5,326 <strchr+0x20>
    if(*s == c)
 312:	00f58763          	beq	a1,a5,320 <strchr+0x1a>
  for(; *s; s++)
 316:	0505                	addi	a0,a0,1
 318:	00054783          	lbu	a5,0(a0)
 31c:	fbfd                	bnez	a5,312 <strchr+0xc>
      return (char*)s;
  return 0;
 31e:	4501                	li	a0,0
}
 320:	6422                	ld	s0,8(sp)
 322:	0141                	addi	sp,sp,16
 324:	8082                	ret
  return 0;
 326:	4501                	li	a0,0
 328:	bfe5                	j	320 <strchr+0x1a>

000000000000032a <gets>:

char*
gets(char *buf, int max)
{
 32a:	711d                	addi	sp,sp,-96
 32c:	ec86                	sd	ra,88(sp)
 32e:	e8a2                	sd	s0,80(sp)
 330:	e4a6                	sd	s1,72(sp)
 332:	e0ca                	sd	s2,64(sp)
 334:	fc4e                	sd	s3,56(sp)
 336:	f852                	sd	s4,48(sp)
 338:	f456                	sd	s5,40(sp)
 33a:	f05a                	sd	s6,32(sp)
 33c:	ec5e                	sd	s7,24(sp)
 33e:	1080                	addi	s0,sp,96
 340:	8baa                	mv	s7,a0
 342:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 344:	892a                	mv	s2,a0
 346:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 348:	4aa9                	li	s5,10
 34a:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 34c:	89a6                	mv	s3,s1
 34e:	2485                	addiw	s1,s1,1
 350:	0344d663          	bge	s1,s4,37c <gets+0x52>
    cc = read(0, &c, 1);
 354:	4605                	li	a2,1
 356:	faf40593          	addi	a1,s0,-81
 35a:	4501                	li	a0,0
 35c:	188000ef          	jal	ra,4e4 <read>
    if(cc < 1)
 360:	00a05e63          	blez	a0,37c <gets+0x52>
    buf[i++] = c;
 364:	faf44783          	lbu	a5,-81(s0)
 368:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 36c:	01578763          	beq	a5,s5,37a <gets+0x50>
 370:	0905                	addi	s2,s2,1
 372:	fd679de3          	bne	a5,s6,34c <gets+0x22>
  for(i=0; i+1 < max; ){
 376:	89a6                	mv	s3,s1
 378:	a011                	j	37c <gets+0x52>
 37a:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 37c:	99de                	add	s3,s3,s7
 37e:	00098023          	sb	zero,0(s3)
  return buf;
}
 382:	855e                	mv	a0,s7
 384:	60e6                	ld	ra,88(sp)
 386:	6446                	ld	s0,80(sp)
 388:	64a6                	ld	s1,72(sp)
 38a:	6906                	ld	s2,64(sp)
 38c:	79e2                	ld	s3,56(sp)
 38e:	7a42                	ld	s4,48(sp)
 390:	7aa2                	ld	s5,40(sp)
 392:	7b02                	ld	s6,32(sp)
 394:	6be2                	ld	s7,24(sp)
 396:	6125                	addi	sp,sp,96
 398:	8082                	ret

000000000000039a <stat>:

int
stat(const char *n, struct stat *st)
{
 39a:	1101                	addi	sp,sp,-32
 39c:	ec06                	sd	ra,24(sp)
 39e:	e822                	sd	s0,16(sp)
 3a0:	e426                	sd	s1,8(sp)
 3a2:	e04a                	sd	s2,0(sp)
 3a4:	1000                	addi	s0,sp,32
 3a6:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3a8:	4581                	li	a1,0
 3aa:	162000ef          	jal	ra,50c <open>
  if(fd < 0)
 3ae:	02054163          	bltz	a0,3d0 <stat+0x36>
 3b2:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 3b4:	85ca                	mv	a1,s2
 3b6:	16e000ef          	jal	ra,524 <fstat>
 3ba:	892a                	mv	s2,a0
  close(fd);
 3bc:	8526                	mv	a0,s1
 3be:	136000ef          	jal	ra,4f4 <close>
  return r;
}
 3c2:	854a                	mv	a0,s2
 3c4:	60e2                	ld	ra,24(sp)
 3c6:	6442                	ld	s0,16(sp)
 3c8:	64a2                	ld	s1,8(sp)
 3ca:	6902                	ld	s2,0(sp)
 3cc:	6105                	addi	sp,sp,32
 3ce:	8082                	ret
    return -1;
 3d0:	597d                	li	s2,-1
 3d2:	bfc5                	j	3c2 <stat+0x28>

00000000000003d4 <atoi>:

int
atoi(const char *s)
{
 3d4:	1141                	addi	sp,sp,-16
 3d6:	e422                	sd	s0,8(sp)
 3d8:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3da:	00054603          	lbu	a2,0(a0)
 3de:	fd06079b          	addiw	a5,a2,-48
 3e2:	0ff7f793          	andi	a5,a5,255
 3e6:	4725                	li	a4,9
 3e8:	02f76963          	bltu	a4,a5,41a <atoi+0x46>
 3ec:	86aa                	mv	a3,a0
  n = 0;
 3ee:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 3f0:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 3f2:	0685                	addi	a3,a3,1
 3f4:	0025179b          	slliw	a5,a0,0x2
 3f8:	9fa9                	addw	a5,a5,a0
 3fa:	0017979b          	slliw	a5,a5,0x1
 3fe:	9fb1                	addw	a5,a5,a2
 400:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 404:	0006c603          	lbu	a2,0(a3)
 408:	fd06071b          	addiw	a4,a2,-48
 40c:	0ff77713          	andi	a4,a4,255
 410:	fee5f1e3          	bgeu	a1,a4,3f2 <atoi+0x1e>
  return n;
}
 414:	6422                	ld	s0,8(sp)
 416:	0141                	addi	sp,sp,16
 418:	8082                	ret
  n = 0;
 41a:	4501                	li	a0,0
 41c:	bfe5                	j	414 <atoi+0x40>

000000000000041e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 41e:	1141                	addi	sp,sp,-16
 420:	e422                	sd	s0,8(sp)
 422:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 424:	02b57463          	bgeu	a0,a1,44c <memmove+0x2e>
    while(n-- > 0)
 428:	00c05f63          	blez	a2,446 <memmove+0x28>
 42c:	1602                	slli	a2,a2,0x20
 42e:	9201                	srli	a2,a2,0x20
 430:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 434:	872a                	mv	a4,a0
      *dst++ = *src++;
 436:	0585                	addi	a1,a1,1
 438:	0705                	addi	a4,a4,1
 43a:	fff5c683          	lbu	a3,-1(a1)
 43e:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 442:	fee79ae3          	bne	a5,a4,436 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 446:	6422                	ld	s0,8(sp)
 448:	0141                	addi	sp,sp,16
 44a:	8082                	ret
    dst += n;
 44c:	00c50733          	add	a4,a0,a2
    src += n;
 450:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 452:	fec05ae3          	blez	a2,446 <memmove+0x28>
 456:	fff6079b          	addiw	a5,a2,-1
 45a:	1782                	slli	a5,a5,0x20
 45c:	9381                	srli	a5,a5,0x20
 45e:	fff7c793          	not	a5,a5
 462:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 464:	15fd                	addi	a1,a1,-1
 466:	177d                	addi	a4,a4,-1
 468:	0005c683          	lbu	a3,0(a1)
 46c:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 470:	fee79ae3          	bne	a5,a4,464 <memmove+0x46>
 474:	bfc9                	j	446 <memmove+0x28>

0000000000000476 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 476:	1141                	addi	sp,sp,-16
 478:	e422                	sd	s0,8(sp)
 47a:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 47c:	ca05                	beqz	a2,4ac <memcmp+0x36>
 47e:	fff6069b          	addiw	a3,a2,-1
 482:	1682                	slli	a3,a3,0x20
 484:	9281                	srli	a3,a3,0x20
 486:	0685                	addi	a3,a3,1
 488:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 48a:	00054783          	lbu	a5,0(a0)
 48e:	0005c703          	lbu	a4,0(a1)
 492:	00e79863          	bne	a5,a4,4a2 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 496:	0505                	addi	a0,a0,1
    p2++;
 498:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 49a:	fed518e3          	bne	a0,a3,48a <memcmp+0x14>
  }
  return 0;
 49e:	4501                	li	a0,0
 4a0:	a019                	j	4a6 <memcmp+0x30>
      return *p1 - *p2;
 4a2:	40e7853b          	subw	a0,a5,a4
}
 4a6:	6422                	ld	s0,8(sp)
 4a8:	0141                	addi	sp,sp,16
 4aa:	8082                	ret
  return 0;
 4ac:	4501                	li	a0,0
 4ae:	bfe5                	j	4a6 <memcmp+0x30>

00000000000004b0 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 4b0:	1141                	addi	sp,sp,-16
 4b2:	e406                	sd	ra,8(sp)
 4b4:	e022                	sd	s0,0(sp)
 4b6:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 4b8:	f67ff0ef          	jal	ra,41e <memmove>
}
 4bc:	60a2                	ld	ra,8(sp)
 4be:	6402                	ld	s0,0(sp)
 4c0:	0141                	addi	sp,sp,16
 4c2:	8082                	ret

00000000000004c4 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 4c4:	4885                	li	a7,1
 ecall
 4c6:	00000073          	ecall
 ret
 4ca:	8082                	ret

00000000000004cc <exit>:
.global exit
exit:
 li a7, SYS_exit
 4cc:	4889                	li	a7,2
 ecall
 4ce:	00000073          	ecall
 ret
 4d2:	8082                	ret

00000000000004d4 <wait>:
.global wait
wait:
 li a7, SYS_wait
 4d4:	488d                	li	a7,3
 ecall
 4d6:	00000073          	ecall
 ret
 4da:	8082                	ret

00000000000004dc <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 4dc:	4891                	li	a7,4
 ecall
 4de:	00000073          	ecall
 ret
 4e2:	8082                	ret

00000000000004e4 <read>:
.global read
read:
 li a7, SYS_read
 4e4:	4895                	li	a7,5
 ecall
 4e6:	00000073          	ecall
 ret
 4ea:	8082                	ret

00000000000004ec <write>:
.global write
write:
 li a7, SYS_write
 4ec:	48c1                	li	a7,16
 ecall
 4ee:	00000073          	ecall
 ret
 4f2:	8082                	ret

00000000000004f4 <close>:
.global close
close:
 li a7, SYS_close
 4f4:	48d5                	li	a7,21
 ecall
 4f6:	00000073          	ecall
 ret
 4fa:	8082                	ret

00000000000004fc <kill>:
.global kill
kill:
 li a7, SYS_kill
 4fc:	4899                	li	a7,6
 ecall
 4fe:	00000073          	ecall
 ret
 502:	8082                	ret

0000000000000504 <exec>:
.global exec
exec:
 li a7, SYS_exec
 504:	489d                	li	a7,7
 ecall
 506:	00000073          	ecall
 ret
 50a:	8082                	ret

000000000000050c <open>:
.global open
open:
 li a7, SYS_open
 50c:	48bd                	li	a7,15
 ecall
 50e:	00000073          	ecall
 ret
 512:	8082                	ret

0000000000000514 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 514:	48c5                	li	a7,17
 ecall
 516:	00000073          	ecall
 ret
 51a:	8082                	ret

000000000000051c <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 51c:	48c9                	li	a7,18
 ecall
 51e:	00000073          	ecall
 ret
 522:	8082                	ret

0000000000000524 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 524:	48a1                	li	a7,8
 ecall
 526:	00000073          	ecall
 ret
 52a:	8082                	ret

000000000000052c <link>:
.global link
link:
 li a7, SYS_link
 52c:	48cd                	li	a7,19
 ecall
 52e:	00000073          	ecall
 ret
 532:	8082                	ret

0000000000000534 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 534:	48d1                	li	a7,20
 ecall
 536:	00000073          	ecall
 ret
 53a:	8082                	ret

000000000000053c <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 53c:	48a5                	li	a7,9
 ecall
 53e:	00000073          	ecall
 ret
 542:	8082                	ret

0000000000000544 <dup>:
.global dup
dup:
 li a7, SYS_dup
 544:	48a9                	li	a7,10
 ecall
 546:	00000073          	ecall
 ret
 54a:	8082                	ret

000000000000054c <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 54c:	48ad                	li	a7,11
 ecall
 54e:	00000073          	ecall
 ret
 552:	8082                	ret

0000000000000554 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 554:	48b1                	li	a7,12
 ecall
 556:	00000073          	ecall
 ret
 55a:	8082                	ret

000000000000055c <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 55c:	48b5                	li	a7,13
 ecall
 55e:	00000073          	ecall
 ret
 562:	8082                	ret

0000000000000564 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 564:	48b9                	li	a7,14
 ecall
 566:	00000073          	ecall
 ret
 56a:	8082                	ret

000000000000056c <debugswitch>:
.global debugswitch
debugswitch:
 li a7, SYS_debugswitch
 56c:	48d9                	li	a7,22
 ecall
 56e:	00000073          	ecall
 ret
 572:	8082                	ret

0000000000000574 <printfslab>:
.global printfslab
printfslab:
 li a7, SYS_printfslab
 574:	48dd                	li	a7,23
 ecall
 576:	00000073          	ecall
 ret
 57a:	8082                	ret

000000000000057c <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 57c:	1101                	addi	sp,sp,-32
 57e:	ec06                	sd	ra,24(sp)
 580:	e822                	sd	s0,16(sp)
 582:	1000                	addi	s0,sp,32
 584:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 588:	4605                	li	a2,1
 58a:	fef40593          	addi	a1,s0,-17
 58e:	f5fff0ef          	jal	ra,4ec <write>
}
 592:	60e2                	ld	ra,24(sp)
 594:	6442                	ld	s0,16(sp)
 596:	6105                	addi	sp,sp,32
 598:	8082                	ret

000000000000059a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 59a:	7139                	addi	sp,sp,-64
 59c:	fc06                	sd	ra,56(sp)
 59e:	f822                	sd	s0,48(sp)
 5a0:	f426                	sd	s1,40(sp)
 5a2:	f04a                	sd	s2,32(sp)
 5a4:	ec4e                	sd	s3,24(sp)
 5a6:	0080                	addi	s0,sp,64
 5a8:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5aa:	c299                	beqz	a3,5b0 <printint+0x16>
 5ac:	0805c663          	bltz	a1,638 <printint+0x9e>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 5b0:	2581                	sext.w	a1,a1
  neg = 0;
 5b2:	4881                	li	a7,0
 5b4:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 5b8:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 5ba:	2601                	sext.w	a2,a2
 5bc:	00000517          	auipc	a0,0x0
 5c0:	51450513          	addi	a0,a0,1300 # ad0 <digits>
 5c4:	883a                	mv	a6,a4
 5c6:	2705                	addiw	a4,a4,1
 5c8:	02c5f7bb          	remuw	a5,a1,a2
 5cc:	1782                	slli	a5,a5,0x20
 5ce:	9381                	srli	a5,a5,0x20
 5d0:	97aa                	add	a5,a5,a0
 5d2:	0007c783          	lbu	a5,0(a5)
 5d6:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 5da:	0005879b          	sext.w	a5,a1
 5de:	02c5d5bb          	divuw	a1,a1,a2
 5e2:	0685                	addi	a3,a3,1
 5e4:	fec7f0e3          	bgeu	a5,a2,5c4 <printint+0x2a>
  if(neg)
 5e8:	00088b63          	beqz	a7,5fe <printint+0x64>
    buf[i++] = '-';
 5ec:	fd040793          	addi	a5,s0,-48
 5f0:	973e                	add	a4,a4,a5
 5f2:	02d00793          	li	a5,45
 5f6:	fef70823          	sb	a5,-16(a4)
 5fa:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 5fe:	02e05663          	blez	a4,62a <printint+0x90>
 602:	fc040793          	addi	a5,s0,-64
 606:	00e78933          	add	s2,a5,a4
 60a:	fff78993          	addi	s3,a5,-1
 60e:	99ba                	add	s3,s3,a4
 610:	377d                	addiw	a4,a4,-1
 612:	1702                	slli	a4,a4,0x20
 614:	9301                	srli	a4,a4,0x20
 616:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 61a:	fff94583          	lbu	a1,-1(s2)
 61e:	8526                	mv	a0,s1
 620:	f5dff0ef          	jal	ra,57c <putc>
  while(--i >= 0)
 624:	197d                	addi	s2,s2,-1
 626:	ff391ae3          	bne	s2,s3,61a <printint+0x80>
}
 62a:	70e2                	ld	ra,56(sp)
 62c:	7442                	ld	s0,48(sp)
 62e:	74a2                	ld	s1,40(sp)
 630:	7902                	ld	s2,32(sp)
 632:	69e2                	ld	s3,24(sp)
 634:	6121                	addi	sp,sp,64
 636:	8082                	ret
    x = -xx;
 638:	40b005bb          	negw	a1,a1
    neg = 1;
 63c:	4885                	li	a7,1
    x = -xx;
 63e:	bf9d                	j	5b4 <printint+0x1a>

0000000000000640 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 640:	7119                	addi	sp,sp,-128
 642:	fc86                	sd	ra,120(sp)
 644:	f8a2                	sd	s0,112(sp)
 646:	f4a6                	sd	s1,104(sp)
 648:	f0ca                	sd	s2,96(sp)
 64a:	ecce                	sd	s3,88(sp)
 64c:	e8d2                	sd	s4,80(sp)
 64e:	e4d6                	sd	s5,72(sp)
 650:	e0da                	sd	s6,64(sp)
 652:	fc5e                	sd	s7,56(sp)
 654:	f862                	sd	s8,48(sp)
 656:	f466                	sd	s9,40(sp)
 658:	f06a                	sd	s10,32(sp)
 65a:	ec6e                	sd	s11,24(sp)
 65c:	0100                	addi	s0,sp,128
  char *s;
  int c0, c1, c2, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 65e:	0005c903          	lbu	s2,0(a1)
 662:	22090e63          	beqz	s2,89e <vprintf+0x25e>
 666:	8b2a                	mv	s6,a0
 668:	8a2e                	mv	s4,a1
 66a:	8bb2                	mv	s7,a2
  state = 0;
 66c:	4981                	li	s3,0
  for(i = 0; fmt[i]; i++){
 66e:	4481                	li	s1,0
 670:	4701                	li	a4,0
      if(c0 == '%'){
        state = '%';
      } else {
        putc(fd, c0);
      }
    } else if(state == '%'){
 672:	02500a93          	li	s5,37
      c1 = c2 = 0;
      if(c0) c1 = fmt[i+1] & 0xff;
      if(c1) c2 = fmt[i+2] & 0xff;
      if(c0 == 'd'){
 676:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c0 == 'l' && c1 == 'd'){
 67a:	06c00d13          	li	s10,108
        printint(fd, va_arg(ap, uint64), 10, 1);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
        printint(fd, va_arg(ap, uint64), 10, 1);
        i += 2;
      } else if(c0 == 'u'){
 67e:	07500d93          	li	s11,117
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 682:	00000c97          	auipc	s9,0x0
 686:	44ec8c93          	addi	s9,s9,1102 # ad0 <digits>
 68a:	a005                	j	6aa <vprintf+0x6a>
        putc(fd, c0);
 68c:	85ca                	mv	a1,s2
 68e:	855a                	mv	a0,s6
 690:	eedff0ef          	jal	ra,57c <putc>
 694:	a019                	j	69a <vprintf+0x5a>
    } else if(state == '%'){
 696:	03598263          	beq	s3,s5,6ba <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 69a:	2485                	addiw	s1,s1,1
 69c:	8726                	mv	a4,s1
 69e:	009a07b3          	add	a5,s4,s1
 6a2:	0007c903          	lbu	s2,0(a5)
 6a6:	1e090c63          	beqz	s2,89e <vprintf+0x25e>
    c0 = fmt[i] & 0xff;
 6aa:	0009079b          	sext.w	a5,s2
    if(state == 0){
 6ae:	fe0994e3          	bnez	s3,696 <vprintf+0x56>
      if(c0 == '%'){
 6b2:	fd579de3          	bne	a5,s5,68c <vprintf+0x4c>
        state = '%';
 6b6:	89be                	mv	s3,a5
 6b8:	b7cd                	j	69a <vprintf+0x5a>
      if(c0) c1 = fmt[i+1] & 0xff;
 6ba:	cfa5                	beqz	a5,732 <vprintf+0xf2>
 6bc:	00ea06b3          	add	a3,s4,a4
 6c0:	0016c683          	lbu	a3,1(a3)
      c1 = c2 = 0;
 6c4:	8636                	mv	a2,a3
      if(c1) c2 = fmt[i+2] & 0xff;
 6c6:	c681                	beqz	a3,6ce <vprintf+0x8e>
 6c8:	9752                	add	a4,a4,s4
 6ca:	00274603          	lbu	a2,2(a4)
      if(c0 == 'd'){
 6ce:	03878a63          	beq	a5,s8,702 <vprintf+0xc2>
      } else if(c0 == 'l' && c1 == 'd'){
 6d2:	05a78463          	beq	a5,s10,71a <vprintf+0xda>
      } else if(c0 == 'u'){
 6d6:	0db78763          	beq	a5,s11,7a4 <vprintf+0x164>
        printint(fd, va_arg(ap, uint64), 10, 0);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
        printint(fd, va_arg(ap, uint64), 10, 0);
        i += 2;
      } else if(c0 == 'x'){
 6da:	07800713          	li	a4,120
 6de:	10e78963          	beq	a5,a4,7f0 <vprintf+0x1b0>
        printint(fd, va_arg(ap, uint64), 16, 0);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'x'){
        printint(fd, va_arg(ap, uint64), 16, 0);
        i += 2;
      } else if(c0 == 'p'){
 6e2:	07000713          	li	a4,112
 6e6:	12e78e63          	beq	a5,a4,822 <vprintf+0x1e2>
        printptr(fd, va_arg(ap, uint64));
      } else if(c0 == 's'){
 6ea:	07300713          	li	a4,115
 6ee:	16e78b63          	beq	a5,a4,864 <vprintf+0x224>
        if((s = va_arg(ap, char*)) == 0)
          s = "(null)";
        for(; *s; s++)
          putc(fd, *s);
      } else if(c0 == '%'){
 6f2:	05579063          	bne	a5,s5,732 <vprintf+0xf2>
        putc(fd, '%');
 6f6:	85d6                	mv	a1,s5
 6f8:	855a                	mv	a0,s6
 6fa:	e83ff0ef          	jal	ra,57c <putc>
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
#endif
      state = 0;
 6fe:	4981                	li	s3,0
 700:	bf69                	j	69a <vprintf+0x5a>
        printint(fd, va_arg(ap, int), 10, 1);
 702:	008b8913          	addi	s2,s7,8
 706:	4685                	li	a3,1
 708:	4629                	li	a2,10
 70a:	000ba583          	lw	a1,0(s7)
 70e:	855a                	mv	a0,s6
 710:	e8bff0ef          	jal	ra,59a <printint>
 714:	8bca                	mv	s7,s2
      state = 0;
 716:	4981                	li	s3,0
 718:	b749                	j	69a <vprintf+0x5a>
      } else if(c0 == 'l' && c1 == 'd'){
 71a:	03868663          	beq	a3,s8,746 <vprintf+0x106>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
 71e:	05a68163          	beq	a3,s10,760 <vprintf+0x120>
      } else if(c0 == 'l' && c1 == 'u'){
 722:	09b68d63          	beq	a3,s11,7bc <vprintf+0x17c>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
 726:	03a68f63          	beq	a3,s10,764 <vprintf+0x124>
      } else if(c0 == 'l' && c1 == 'x'){
 72a:	07800793          	li	a5,120
 72e:	0cf68d63          	beq	a3,a5,808 <vprintf+0x1c8>
        putc(fd, '%');
 732:	85d6                	mv	a1,s5
 734:	855a                	mv	a0,s6
 736:	e47ff0ef          	jal	ra,57c <putc>
        putc(fd, c0);
 73a:	85ca                	mv	a1,s2
 73c:	855a                	mv	a0,s6
 73e:	e3fff0ef          	jal	ra,57c <putc>
      state = 0;
 742:	4981                	li	s3,0
 744:	bf99                	j	69a <vprintf+0x5a>
        printint(fd, va_arg(ap, uint64), 10, 1);
 746:	008b8913          	addi	s2,s7,8
 74a:	4685                	li	a3,1
 74c:	4629                	li	a2,10
 74e:	000ba583          	lw	a1,0(s7)
 752:	855a                	mv	a0,s6
 754:	e47ff0ef          	jal	ra,59a <printint>
        i += 1;
 758:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 10, 1);
 75a:	8bca                	mv	s7,s2
      state = 0;
 75c:	4981                	li	s3,0
        i += 1;
 75e:	bf35                	j	69a <vprintf+0x5a>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
 760:	03860563          	beq	a2,s8,78a <vprintf+0x14a>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
 764:	07b60963          	beq	a2,s11,7d6 <vprintf+0x196>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'x'){
 768:	07800793          	li	a5,120
 76c:	fcf613e3          	bne	a2,a5,732 <vprintf+0xf2>
        printint(fd, va_arg(ap, uint64), 16, 0);
 770:	008b8913          	addi	s2,s7,8
 774:	4681                	li	a3,0
 776:	4641                	li	a2,16
 778:	000ba583          	lw	a1,0(s7)
 77c:	855a                	mv	a0,s6
 77e:	e1dff0ef          	jal	ra,59a <printint>
        i += 2;
 782:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 16, 0);
 784:	8bca                	mv	s7,s2
      state = 0;
 786:	4981                	li	s3,0
        i += 2;
 788:	bf09                	j	69a <vprintf+0x5a>
        printint(fd, va_arg(ap, uint64), 10, 1);
 78a:	008b8913          	addi	s2,s7,8
 78e:	4685                	li	a3,1
 790:	4629                	li	a2,10
 792:	000ba583          	lw	a1,0(s7)
 796:	855a                	mv	a0,s6
 798:	e03ff0ef          	jal	ra,59a <printint>
        i += 2;
 79c:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 10, 1);
 79e:	8bca                	mv	s7,s2
      state = 0;
 7a0:	4981                	li	s3,0
        i += 2;
 7a2:	bde5                	j	69a <vprintf+0x5a>
        printint(fd, va_arg(ap, int), 10, 0);
 7a4:	008b8913          	addi	s2,s7,8
 7a8:	4681                	li	a3,0
 7aa:	4629                	li	a2,10
 7ac:	000ba583          	lw	a1,0(s7)
 7b0:	855a                	mv	a0,s6
 7b2:	de9ff0ef          	jal	ra,59a <printint>
 7b6:	8bca                	mv	s7,s2
      state = 0;
 7b8:	4981                	li	s3,0
 7ba:	b5c5                	j	69a <vprintf+0x5a>
        printint(fd, va_arg(ap, uint64), 10, 0);
 7bc:	008b8913          	addi	s2,s7,8
 7c0:	4681                	li	a3,0
 7c2:	4629                	li	a2,10
 7c4:	000ba583          	lw	a1,0(s7)
 7c8:	855a                	mv	a0,s6
 7ca:	dd1ff0ef          	jal	ra,59a <printint>
        i += 1;
 7ce:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 10, 0);
 7d0:	8bca                	mv	s7,s2
      state = 0;
 7d2:	4981                	li	s3,0
        i += 1;
 7d4:	b5d9                	j	69a <vprintf+0x5a>
        printint(fd, va_arg(ap, uint64), 10, 0);
 7d6:	008b8913          	addi	s2,s7,8
 7da:	4681                	li	a3,0
 7dc:	4629                	li	a2,10
 7de:	000ba583          	lw	a1,0(s7)
 7e2:	855a                	mv	a0,s6
 7e4:	db7ff0ef          	jal	ra,59a <printint>
        i += 2;
 7e8:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 10, 0);
 7ea:	8bca                	mv	s7,s2
      state = 0;
 7ec:	4981                	li	s3,0
        i += 2;
 7ee:	b575                	j	69a <vprintf+0x5a>
        printint(fd, va_arg(ap, int), 16, 0);
 7f0:	008b8913          	addi	s2,s7,8
 7f4:	4681                	li	a3,0
 7f6:	4641                	li	a2,16
 7f8:	000ba583          	lw	a1,0(s7)
 7fc:	855a                	mv	a0,s6
 7fe:	d9dff0ef          	jal	ra,59a <printint>
 802:	8bca                	mv	s7,s2
      state = 0;
 804:	4981                	li	s3,0
 806:	bd51                	j	69a <vprintf+0x5a>
        printint(fd, va_arg(ap, uint64), 16, 0);
 808:	008b8913          	addi	s2,s7,8
 80c:	4681                	li	a3,0
 80e:	4641                	li	a2,16
 810:	000ba583          	lw	a1,0(s7)
 814:	855a                	mv	a0,s6
 816:	d85ff0ef          	jal	ra,59a <printint>
        i += 1;
 81a:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 16, 0);
 81c:	8bca                	mv	s7,s2
      state = 0;
 81e:	4981                	li	s3,0
        i += 1;
 820:	bdad                	j	69a <vprintf+0x5a>
        printptr(fd, va_arg(ap, uint64));
 822:	008b8793          	addi	a5,s7,8
 826:	f8f43423          	sd	a5,-120(s0)
 82a:	000bb983          	ld	s3,0(s7)
  putc(fd, '0');
 82e:	03000593          	li	a1,48
 832:	855a                	mv	a0,s6
 834:	d49ff0ef          	jal	ra,57c <putc>
  putc(fd, 'x');
 838:	07800593          	li	a1,120
 83c:	855a                	mv	a0,s6
 83e:	d3fff0ef          	jal	ra,57c <putc>
 842:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 844:	03c9d793          	srli	a5,s3,0x3c
 848:	97e6                	add	a5,a5,s9
 84a:	0007c583          	lbu	a1,0(a5)
 84e:	855a                	mv	a0,s6
 850:	d2dff0ef          	jal	ra,57c <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 854:	0992                	slli	s3,s3,0x4
 856:	397d                	addiw	s2,s2,-1
 858:	fe0916e3          	bnez	s2,844 <vprintf+0x204>
        printptr(fd, va_arg(ap, uint64));
 85c:	f8843b83          	ld	s7,-120(s0)
      state = 0;
 860:	4981                	li	s3,0
 862:	bd25                	j	69a <vprintf+0x5a>
        if((s = va_arg(ap, char*)) == 0)
 864:	008b8993          	addi	s3,s7,8
 868:	000bb903          	ld	s2,0(s7)
 86c:	00090f63          	beqz	s2,88a <vprintf+0x24a>
        for(; *s; s++)
 870:	00094583          	lbu	a1,0(s2)
 874:	c195                	beqz	a1,898 <vprintf+0x258>
          putc(fd, *s);
 876:	855a                	mv	a0,s6
 878:	d05ff0ef          	jal	ra,57c <putc>
        for(; *s; s++)
 87c:	0905                	addi	s2,s2,1
 87e:	00094583          	lbu	a1,0(s2)
 882:	f9f5                	bnez	a1,876 <vprintf+0x236>
        if((s = va_arg(ap, char*)) == 0)
 884:	8bce                	mv	s7,s3
      state = 0;
 886:	4981                	li	s3,0
 888:	bd09                	j	69a <vprintf+0x5a>
          s = "(null)";
 88a:	00000917          	auipc	s2,0x0
 88e:	23e90913          	addi	s2,s2,574 # ac8 <malloc+0x128>
        for(; *s; s++)
 892:	02800593          	li	a1,40
 896:	b7c5                	j	876 <vprintf+0x236>
        if((s = va_arg(ap, char*)) == 0)
 898:	8bce                	mv	s7,s3
      state = 0;
 89a:	4981                	li	s3,0
 89c:	bbfd                	j	69a <vprintf+0x5a>
    }
  }
}
 89e:	70e6                	ld	ra,120(sp)
 8a0:	7446                	ld	s0,112(sp)
 8a2:	74a6                	ld	s1,104(sp)
 8a4:	7906                	ld	s2,96(sp)
 8a6:	69e6                	ld	s3,88(sp)
 8a8:	6a46                	ld	s4,80(sp)
 8aa:	6aa6                	ld	s5,72(sp)
 8ac:	6b06                	ld	s6,64(sp)
 8ae:	7be2                	ld	s7,56(sp)
 8b0:	7c42                	ld	s8,48(sp)
 8b2:	7ca2                	ld	s9,40(sp)
 8b4:	7d02                	ld	s10,32(sp)
 8b6:	6de2                	ld	s11,24(sp)
 8b8:	6109                	addi	sp,sp,128
 8ba:	8082                	ret

00000000000008bc <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 8bc:	715d                	addi	sp,sp,-80
 8be:	ec06                	sd	ra,24(sp)
 8c0:	e822                	sd	s0,16(sp)
 8c2:	1000                	addi	s0,sp,32
 8c4:	e010                	sd	a2,0(s0)
 8c6:	e414                	sd	a3,8(s0)
 8c8:	e818                	sd	a4,16(s0)
 8ca:	ec1c                	sd	a5,24(s0)
 8cc:	03043023          	sd	a6,32(s0)
 8d0:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 8d4:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 8d8:	8622                	mv	a2,s0
 8da:	d67ff0ef          	jal	ra,640 <vprintf>
}
 8de:	60e2                	ld	ra,24(sp)
 8e0:	6442                	ld	s0,16(sp)
 8e2:	6161                	addi	sp,sp,80
 8e4:	8082                	ret

00000000000008e6 <printf>:

void
printf(const char *fmt, ...)
{
 8e6:	711d                	addi	sp,sp,-96
 8e8:	ec06                	sd	ra,24(sp)
 8ea:	e822                	sd	s0,16(sp)
 8ec:	1000                	addi	s0,sp,32
 8ee:	e40c                	sd	a1,8(s0)
 8f0:	e810                	sd	a2,16(s0)
 8f2:	ec14                	sd	a3,24(s0)
 8f4:	f018                	sd	a4,32(s0)
 8f6:	f41c                	sd	a5,40(s0)
 8f8:	03043823          	sd	a6,48(s0)
 8fc:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 900:	00840613          	addi	a2,s0,8
 904:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 908:	85aa                	mv	a1,a0
 90a:	4505                	li	a0,1
 90c:	d35ff0ef          	jal	ra,640 <vprintf>
}
 910:	60e2                	ld	ra,24(sp)
 912:	6442                	ld	s0,16(sp)
 914:	6125                	addi	sp,sp,96
 916:	8082                	ret

0000000000000918 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 918:	1141                	addi	sp,sp,-16
 91a:	e422                	sd	s0,8(sp)
 91c:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 91e:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 922:	00000797          	auipc	a5,0x0
 926:	6de7b783          	ld	a5,1758(a5) # 1000 <freep>
 92a:	a805                	j	95a <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 92c:	4618                	lw	a4,8(a2)
 92e:	9db9                	addw	a1,a1,a4
 930:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 934:	6398                	ld	a4,0(a5)
 936:	6318                	ld	a4,0(a4)
 938:	fee53823          	sd	a4,-16(a0)
 93c:	a091                	j	980 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 93e:	ff852703          	lw	a4,-8(a0)
 942:	9e39                	addw	a2,a2,a4
 944:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 946:	ff053703          	ld	a4,-16(a0)
 94a:	e398                	sd	a4,0(a5)
 94c:	a099                	j	992 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 94e:	6398                	ld	a4,0(a5)
 950:	00e7e463          	bltu	a5,a4,958 <free+0x40>
 954:	00e6ea63          	bltu	a3,a4,968 <free+0x50>
{
 958:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 95a:	fed7fae3          	bgeu	a5,a3,94e <free+0x36>
 95e:	6398                	ld	a4,0(a5)
 960:	00e6e463          	bltu	a3,a4,968 <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 964:	fee7eae3          	bltu	a5,a4,958 <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 968:	ff852583          	lw	a1,-8(a0)
 96c:	6390                	ld	a2,0(a5)
 96e:	02059713          	slli	a4,a1,0x20
 972:	9301                	srli	a4,a4,0x20
 974:	0712                	slli	a4,a4,0x4
 976:	9736                	add	a4,a4,a3
 978:	fae60ae3          	beq	a2,a4,92c <free+0x14>
    bp->s.ptr = p->s.ptr;
 97c:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 980:	4790                	lw	a2,8(a5)
 982:	02061713          	slli	a4,a2,0x20
 986:	9301                	srli	a4,a4,0x20
 988:	0712                	slli	a4,a4,0x4
 98a:	973e                	add	a4,a4,a5
 98c:	fae689e3          	beq	a3,a4,93e <free+0x26>
  } else
    p->s.ptr = bp;
 990:	e394                	sd	a3,0(a5)
  freep = p;
 992:	00000717          	auipc	a4,0x0
 996:	66f73723          	sd	a5,1646(a4) # 1000 <freep>
}
 99a:	6422                	ld	s0,8(sp)
 99c:	0141                	addi	sp,sp,16
 99e:	8082                	ret

00000000000009a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9a0:	7139                	addi	sp,sp,-64
 9a2:	fc06                	sd	ra,56(sp)
 9a4:	f822                	sd	s0,48(sp)
 9a6:	f426                	sd	s1,40(sp)
 9a8:	f04a                	sd	s2,32(sp)
 9aa:	ec4e                	sd	s3,24(sp)
 9ac:	e852                	sd	s4,16(sp)
 9ae:	e456                	sd	s5,8(sp)
 9b0:	e05a                	sd	s6,0(sp)
 9b2:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9b4:	02051493          	slli	s1,a0,0x20
 9b8:	9081                	srli	s1,s1,0x20
 9ba:	04bd                	addi	s1,s1,15
 9bc:	8091                	srli	s1,s1,0x4
 9be:	0014899b          	addiw	s3,s1,1
 9c2:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 9c4:	00000517          	auipc	a0,0x0
 9c8:	63c53503          	ld	a0,1596(a0) # 1000 <freep>
 9cc:	c515                	beqz	a0,9f8 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9ce:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 9d0:	4798                	lw	a4,8(a5)
 9d2:	02977f63          	bgeu	a4,s1,a10 <malloc+0x70>
 9d6:	8a4e                	mv	s4,s3
 9d8:	0009871b          	sext.w	a4,s3
 9dc:	6685                	lui	a3,0x1
 9de:	00d77363          	bgeu	a4,a3,9e4 <malloc+0x44>
 9e2:	6a05                	lui	s4,0x1
 9e4:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 9e8:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9ec:	00000917          	auipc	s2,0x0
 9f0:	61490913          	addi	s2,s2,1556 # 1000 <freep>
  if(p == (char*)-1)
 9f4:	5afd                	li	s5,-1
 9f6:	a0bd                	j	a64 <malloc+0xc4>
    base.s.ptr = freep = prevp = &base;
 9f8:	00000797          	auipc	a5,0x0
 9fc:	61878793          	addi	a5,a5,1560 # 1010 <base>
 a00:	00000717          	auipc	a4,0x0
 a04:	60f73023          	sd	a5,1536(a4) # 1000 <freep>
 a08:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 a0a:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 a0e:	b7e1                	j	9d6 <malloc+0x36>
      if(p->s.size == nunits)
 a10:	02e48b63          	beq	s1,a4,a46 <malloc+0xa6>
        p->s.size -= nunits;
 a14:	4137073b          	subw	a4,a4,s3
 a18:	c798                	sw	a4,8(a5)
        p += p->s.size;
 a1a:	1702                	slli	a4,a4,0x20
 a1c:	9301                	srli	a4,a4,0x20
 a1e:	0712                	slli	a4,a4,0x4
 a20:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 a22:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 a26:	00000717          	auipc	a4,0x0
 a2a:	5ca73d23          	sd	a0,1498(a4) # 1000 <freep>
      return (void*)(p + 1);
 a2e:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a32:	70e2                	ld	ra,56(sp)
 a34:	7442                	ld	s0,48(sp)
 a36:	74a2                	ld	s1,40(sp)
 a38:	7902                	ld	s2,32(sp)
 a3a:	69e2                	ld	s3,24(sp)
 a3c:	6a42                	ld	s4,16(sp)
 a3e:	6aa2                	ld	s5,8(sp)
 a40:	6b02                	ld	s6,0(sp)
 a42:	6121                	addi	sp,sp,64
 a44:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 a46:	6398                	ld	a4,0(a5)
 a48:	e118                	sd	a4,0(a0)
 a4a:	bff1                	j	a26 <malloc+0x86>
  hp->s.size = nu;
 a4c:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 a50:	0541                	addi	a0,a0,16
 a52:	ec7ff0ef          	jal	ra,918 <free>
  return freep;
 a56:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 a5a:	dd61                	beqz	a0,a32 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a5c:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 a5e:	4798                	lw	a4,8(a5)
 a60:	fa9778e3          	bgeu	a4,s1,a10 <malloc+0x70>
    if(p == freep)
 a64:	00093703          	ld	a4,0(s2)
 a68:	853e                	mv	a0,a5
 a6a:	fef719e3          	bne	a4,a5,a5c <malloc+0xbc>
  p = sbrk(nu * sizeof(Header));
 a6e:	8552                	mv	a0,s4
 a70:	ae5ff0ef          	jal	ra,554 <sbrk>
  if(p == (char*)-1)
 a74:	fd551ce3          	bne	a0,s5,a4c <malloc+0xac>
        return 0;
 a78:	4501                	li	a0,0
 a7a:	bf65                	j	a32 <malloc+0x92>
