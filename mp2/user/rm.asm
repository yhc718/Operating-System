
user/_rm:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/stat.h"
#include "user/user.h"

int
main(int argc, char *argv[])
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	e84a                	sd	s2,16(sp)
   a:	e44e                	sd	s3,8(sp)
   c:	1800                	addi	s0,sp,48
  int i;

  if(argc < 2){
   e:	4785                	li	a5,1
  10:	02a7d563          	bge	a5,a0,3a <main+0x3a>
  14:	00858493          	addi	s1,a1,8
  18:	ffe5091b          	addiw	s2,a0,-2
  1c:	1902                	slli	s2,s2,0x20
  1e:	02095913          	srli	s2,s2,0x20
  22:	090e                	slli	s2,s2,0x3
  24:	05c1                	addi	a1,a1,16
  26:	992e                	add	s2,s2,a1
    fprintf(2, "Usage: rm files...\n");
    exit(1);
  }

  for(i = 1; i < argc; i++){
    if(unlink(argv[i]) < 0){
  28:	6088                	ld	a0,0(s1)
  2a:	2f6000ef          	jal	ra,320 <unlink>
  2e:	02054063          	bltz	a0,4e <main+0x4e>
  for(i = 1; i < argc; i++){
  32:	04a1                	addi	s1,s1,8
  34:	ff249ae3          	bne	s1,s2,28 <main+0x28>
  38:	a01d                	j	5e <main+0x5e>
    fprintf(2, "Usage: rm files...\n");
  3a:	00001597          	auipc	a1,0x1
  3e:	84658593          	addi	a1,a1,-1978 # 880 <malloc+0xdc>
  42:	4509                	li	a0,2
  44:	67c000ef          	jal	ra,6c0 <fprintf>
    exit(1);
  48:	4505                	li	a0,1
  4a:	286000ef          	jal	ra,2d0 <exit>
      fprintf(2, "rm: %s failed to delete\n", argv[i]);
  4e:	6090                	ld	a2,0(s1)
  50:	00001597          	auipc	a1,0x1
  54:	84858593          	addi	a1,a1,-1976 # 898 <malloc+0xf4>
  58:	4509                	li	a0,2
  5a:	666000ef          	jal	ra,6c0 <fprintf>
      break;
    }
  }

  exit(0);
  5e:	4501                	li	a0,0
  60:	270000ef          	jal	ra,2d0 <exit>

0000000000000064 <start>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
start()
{
  64:	1141                	addi	sp,sp,-16
  66:	e406                	sd	ra,8(sp)
  68:	e022                	sd	s0,0(sp)
  6a:	0800                	addi	s0,sp,16
  extern int main();
  main();
  6c:	f95ff0ef          	jal	ra,0 <main>
  exit(0);
  70:	4501                	li	a0,0
  72:	25e000ef          	jal	ra,2d0 <exit>

0000000000000076 <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
  76:	1141                	addi	sp,sp,-16
  78:	e422                	sd	s0,8(sp)
  7a:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  7c:	87aa                	mv	a5,a0
  7e:	0585                	addi	a1,a1,1
  80:	0785                	addi	a5,a5,1
  82:	fff5c703          	lbu	a4,-1(a1)
  86:	fee78fa3          	sb	a4,-1(a5)
  8a:	fb75                	bnez	a4,7e <strcpy+0x8>
    ;
  return os;
}
  8c:	6422                	ld	s0,8(sp)
  8e:	0141                	addi	sp,sp,16
  90:	8082                	ret

0000000000000092 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  92:	1141                	addi	sp,sp,-16
  94:	e422                	sd	s0,8(sp)
  96:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
  98:	00054783          	lbu	a5,0(a0)
  9c:	cb91                	beqz	a5,b0 <strcmp+0x1e>
  9e:	0005c703          	lbu	a4,0(a1)
  a2:	00f71763          	bne	a4,a5,b0 <strcmp+0x1e>
    p++, q++;
  a6:	0505                	addi	a0,a0,1
  a8:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
  aa:	00054783          	lbu	a5,0(a0)
  ae:	fbe5                	bnez	a5,9e <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
  b0:	0005c503          	lbu	a0,0(a1)
}
  b4:	40a7853b          	subw	a0,a5,a0
  b8:	6422                	ld	s0,8(sp)
  ba:	0141                	addi	sp,sp,16
  bc:	8082                	ret

00000000000000be <strlen>:

uint
strlen(const char *s)
{
  be:	1141                	addi	sp,sp,-16
  c0:	e422                	sd	s0,8(sp)
  c2:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
  c4:	00054783          	lbu	a5,0(a0)
  c8:	cf91                	beqz	a5,e4 <strlen+0x26>
  ca:	0505                	addi	a0,a0,1
  cc:	87aa                	mv	a5,a0
  ce:	4685                	li	a3,1
  d0:	9e89                	subw	a3,a3,a0
  d2:	00f6853b          	addw	a0,a3,a5
  d6:	0785                	addi	a5,a5,1
  d8:	fff7c703          	lbu	a4,-1(a5)
  dc:	fb7d                	bnez	a4,d2 <strlen+0x14>
    ;
  return n;
}
  de:	6422                	ld	s0,8(sp)
  e0:	0141                	addi	sp,sp,16
  e2:	8082                	ret
  for(n = 0; s[n]; n++)
  e4:	4501                	li	a0,0
  e6:	bfe5                	j	de <strlen+0x20>

00000000000000e8 <memset>:

void*
memset(void *dst, int c, uint n)
{
  e8:	1141                	addi	sp,sp,-16
  ea:	e422                	sd	s0,8(sp)
  ec:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
  ee:	ca19                	beqz	a2,104 <memset+0x1c>
  f0:	87aa                	mv	a5,a0
  f2:	1602                	slli	a2,a2,0x20
  f4:	9201                	srli	a2,a2,0x20
  f6:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
  fa:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
  fe:	0785                	addi	a5,a5,1
 100:	fee79de3          	bne	a5,a4,fa <memset+0x12>
  }
  return dst;
}
 104:	6422                	ld	s0,8(sp)
 106:	0141                	addi	sp,sp,16
 108:	8082                	ret

000000000000010a <strchr>:

char*
strchr(const char *s, char c)
{
 10a:	1141                	addi	sp,sp,-16
 10c:	e422                	sd	s0,8(sp)
 10e:	0800                	addi	s0,sp,16
  for(; *s; s++)
 110:	00054783          	lbu	a5,0(a0)
 114:	cb99                	beqz	a5,12a <strchr+0x20>
    if(*s == c)
 116:	00f58763          	beq	a1,a5,124 <strchr+0x1a>
  for(; *s; s++)
 11a:	0505                	addi	a0,a0,1
 11c:	00054783          	lbu	a5,0(a0)
 120:	fbfd                	bnez	a5,116 <strchr+0xc>
      return (char*)s;
  return 0;
 122:	4501                	li	a0,0
}
 124:	6422                	ld	s0,8(sp)
 126:	0141                	addi	sp,sp,16
 128:	8082                	ret
  return 0;
 12a:	4501                	li	a0,0
 12c:	bfe5                	j	124 <strchr+0x1a>

000000000000012e <gets>:

char*
gets(char *buf, int max)
{
 12e:	711d                	addi	sp,sp,-96
 130:	ec86                	sd	ra,88(sp)
 132:	e8a2                	sd	s0,80(sp)
 134:	e4a6                	sd	s1,72(sp)
 136:	e0ca                	sd	s2,64(sp)
 138:	fc4e                	sd	s3,56(sp)
 13a:	f852                	sd	s4,48(sp)
 13c:	f456                	sd	s5,40(sp)
 13e:	f05a                	sd	s6,32(sp)
 140:	ec5e                	sd	s7,24(sp)
 142:	1080                	addi	s0,sp,96
 144:	8baa                	mv	s7,a0
 146:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 148:	892a                	mv	s2,a0
 14a:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 14c:	4aa9                	li	s5,10
 14e:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 150:	89a6                	mv	s3,s1
 152:	2485                	addiw	s1,s1,1
 154:	0344d663          	bge	s1,s4,180 <gets+0x52>
    cc = read(0, &c, 1);
 158:	4605                	li	a2,1
 15a:	faf40593          	addi	a1,s0,-81
 15e:	4501                	li	a0,0
 160:	188000ef          	jal	ra,2e8 <read>
    if(cc < 1)
 164:	00a05e63          	blez	a0,180 <gets+0x52>
    buf[i++] = c;
 168:	faf44783          	lbu	a5,-81(s0)
 16c:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 170:	01578763          	beq	a5,s5,17e <gets+0x50>
 174:	0905                	addi	s2,s2,1
 176:	fd679de3          	bne	a5,s6,150 <gets+0x22>
  for(i=0; i+1 < max; ){
 17a:	89a6                	mv	s3,s1
 17c:	a011                	j	180 <gets+0x52>
 17e:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 180:	99de                	add	s3,s3,s7
 182:	00098023          	sb	zero,0(s3)
  return buf;
}
 186:	855e                	mv	a0,s7
 188:	60e6                	ld	ra,88(sp)
 18a:	6446                	ld	s0,80(sp)
 18c:	64a6                	ld	s1,72(sp)
 18e:	6906                	ld	s2,64(sp)
 190:	79e2                	ld	s3,56(sp)
 192:	7a42                	ld	s4,48(sp)
 194:	7aa2                	ld	s5,40(sp)
 196:	7b02                	ld	s6,32(sp)
 198:	6be2                	ld	s7,24(sp)
 19a:	6125                	addi	sp,sp,96
 19c:	8082                	ret

000000000000019e <stat>:

int
stat(const char *n, struct stat *st)
{
 19e:	1101                	addi	sp,sp,-32
 1a0:	ec06                	sd	ra,24(sp)
 1a2:	e822                	sd	s0,16(sp)
 1a4:	e426                	sd	s1,8(sp)
 1a6:	e04a                	sd	s2,0(sp)
 1a8:	1000                	addi	s0,sp,32
 1aa:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1ac:	4581                	li	a1,0
 1ae:	162000ef          	jal	ra,310 <open>
  if(fd < 0)
 1b2:	02054163          	bltz	a0,1d4 <stat+0x36>
 1b6:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 1b8:	85ca                	mv	a1,s2
 1ba:	16e000ef          	jal	ra,328 <fstat>
 1be:	892a                	mv	s2,a0
  close(fd);
 1c0:	8526                	mv	a0,s1
 1c2:	136000ef          	jal	ra,2f8 <close>
  return r;
}
 1c6:	854a                	mv	a0,s2
 1c8:	60e2                	ld	ra,24(sp)
 1ca:	6442                	ld	s0,16(sp)
 1cc:	64a2                	ld	s1,8(sp)
 1ce:	6902                	ld	s2,0(sp)
 1d0:	6105                	addi	sp,sp,32
 1d2:	8082                	ret
    return -1;
 1d4:	597d                	li	s2,-1
 1d6:	bfc5                	j	1c6 <stat+0x28>

00000000000001d8 <atoi>:

int
atoi(const char *s)
{
 1d8:	1141                	addi	sp,sp,-16
 1da:	e422                	sd	s0,8(sp)
 1dc:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 1de:	00054603          	lbu	a2,0(a0)
 1e2:	fd06079b          	addiw	a5,a2,-48
 1e6:	0ff7f793          	andi	a5,a5,255
 1ea:	4725                	li	a4,9
 1ec:	02f76963          	bltu	a4,a5,21e <atoi+0x46>
 1f0:	86aa                	mv	a3,a0
  n = 0;
 1f2:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 1f4:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 1f6:	0685                	addi	a3,a3,1
 1f8:	0025179b          	slliw	a5,a0,0x2
 1fc:	9fa9                	addw	a5,a5,a0
 1fe:	0017979b          	slliw	a5,a5,0x1
 202:	9fb1                	addw	a5,a5,a2
 204:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 208:	0006c603          	lbu	a2,0(a3)
 20c:	fd06071b          	addiw	a4,a2,-48
 210:	0ff77713          	andi	a4,a4,255
 214:	fee5f1e3          	bgeu	a1,a4,1f6 <atoi+0x1e>
  return n;
}
 218:	6422                	ld	s0,8(sp)
 21a:	0141                	addi	sp,sp,16
 21c:	8082                	ret
  n = 0;
 21e:	4501                	li	a0,0
 220:	bfe5                	j	218 <atoi+0x40>

0000000000000222 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 222:	1141                	addi	sp,sp,-16
 224:	e422                	sd	s0,8(sp)
 226:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 228:	02b57463          	bgeu	a0,a1,250 <memmove+0x2e>
    while(n-- > 0)
 22c:	00c05f63          	blez	a2,24a <memmove+0x28>
 230:	1602                	slli	a2,a2,0x20
 232:	9201                	srli	a2,a2,0x20
 234:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 238:	872a                	mv	a4,a0
      *dst++ = *src++;
 23a:	0585                	addi	a1,a1,1
 23c:	0705                	addi	a4,a4,1
 23e:	fff5c683          	lbu	a3,-1(a1)
 242:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 246:	fee79ae3          	bne	a5,a4,23a <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 24a:	6422                	ld	s0,8(sp)
 24c:	0141                	addi	sp,sp,16
 24e:	8082                	ret
    dst += n;
 250:	00c50733          	add	a4,a0,a2
    src += n;
 254:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 256:	fec05ae3          	blez	a2,24a <memmove+0x28>
 25a:	fff6079b          	addiw	a5,a2,-1
 25e:	1782                	slli	a5,a5,0x20
 260:	9381                	srli	a5,a5,0x20
 262:	fff7c793          	not	a5,a5
 266:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 268:	15fd                	addi	a1,a1,-1
 26a:	177d                	addi	a4,a4,-1
 26c:	0005c683          	lbu	a3,0(a1)
 270:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 274:	fee79ae3          	bne	a5,a4,268 <memmove+0x46>
 278:	bfc9                	j	24a <memmove+0x28>

000000000000027a <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 27a:	1141                	addi	sp,sp,-16
 27c:	e422                	sd	s0,8(sp)
 27e:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 280:	ca05                	beqz	a2,2b0 <memcmp+0x36>
 282:	fff6069b          	addiw	a3,a2,-1
 286:	1682                	slli	a3,a3,0x20
 288:	9281                	srli	a3,a3,0x20
 28a:	0685                	addi	a3,a3,1
 28c:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 28e:	00054783          	lbu	a5,0(a0)
 292:	0005c703          	lbu	a4,0(a1)
 296:	00e79863          	bne	a5,a4,2a6 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 29a:	0505                	addi	a0,a0,1
    p2++;
 29c:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 29e:	fed518e3          	bne	a0,a3,28e <memcmp+0x14>
  }
  return 0;
 2a2:	4501                	li	a0,0
 2a4:	a019                	j	2aa <memcmp+0x30>
      return *p1 - *p2;
 2a6:	40e7853b          	subw	a0,a5,a4
}
 2aa:	6422                	ld	s0,8(sp)
 2ac:	0141                	addi	sp,sp,16
 2ae:	8082                	ret
  return 0;
 2b0:	4501                	li	a0,0
 2b2:	bfe5                	j	2aa <memcmp+0x30>

00000000000002b4 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 2b4:	1141                	addi	sp,sp,-16
 2b6:	e406                	sd	ra,8(sp)
 2b8:	e022                	sd	s0,0(sp)
 2ba:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 2bc:	f67ff0ef          	jal	ra,222 <memmove>
}
 2c0:	60a2                	ld	ra,8(sp)
 2c2:	6402                	ld	s0,0(sp)
 2c4:	0141                	addi	sp,sp,16
 2c6:	8082                	ret

00000000000002c8 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 2c8:	4885                	li	a7,1
 ecall
 2ca:	00000073          	ecall
 ret
 2ce:	8082                	ret

00000000000002d0 <exit>:
.global exit
exit:
 li a7, SYS_exit
 2d0:	4889                	li	a7,2
 ecall
 2d2:	00000073          	ecall
 ret
 2d6:	8082                	ret

00000000000002d8 <wait>:
.global wait
wait:
 li a7, SYS_wait
 2d8:	488d                	li	a7,3
 ecall
 2da:	00000073          	ecall
 ret
 2de:	8082                	ret

00000000000002e0 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 2e0:	4891                	li	a7,4
 ecall
 2e2:	00000073          	ecall
 ret
 2e6:	8082                	ret

00000000000002e8 <read>:
.global read
read:
 li a7, SYS_read
 2e8:	4895                	li	a7,5
 ecall
 2ea:	00000073          	ecall
 ret
 2ee:	8082                	ret

00000000000002f0 <write>:
.global write
write:
 li a7, SYS_write
 2f0:	48c1                	li	a7,16
 ecall
 2f2:	00000073          	ecall
 ret
 2f6:	8082                	ret

00000000000002f8 <close>:
.global close
close:
 li a7, SYS_close
 2f8:	48d5                	li	a7,21
 ecall
 2fa:	00000073          	ecall
 ret
 2fe:	8082                	ret

0000000000000300 <kill>:
.global kill
kill:
 li a7, SYS_kill
 300:	4899                	li	a7,6
 ecall
 302:	00000073          	ecall
 ret
 306:	8082                	ret

0000000000000308 <exec>:
.global exec
exec:
 li a7, SYS_exec
 308:	489d                	li	a7,7
 ecall
 30a:	00000073          	ecall
 ret
 30e:	8082                	ret

0000000000000310 <open>:
.global open
open:
 li a7, SYS_open
 310:	48bd                	li	a7,15
 ecall
 312:	00000073          	ecall
 ret
 316:	8082                	ret

0000000000000318 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 318:	48c5                	li	a7,17
 ecall
 31a:	00000073          	ecall
 ret
 31e:	8082                	ret

0000000000000320 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 320:	48c9                	li	a7,18
 ecall
 322:	00000073          	ecall
 ret
 326:	8082                	ret

0000000000000328 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 328:	48a1                	li	a7,8
 ecall
 32a:	00000073          	ecall
 ret
 32e:	8082                	ret

0000000000000330 <link>:
.global link
link:
 li a7, SYS_link
 330:	48cd                	li	a7,19
 ecall
 332:	00000073          	ecall
 ret
 336:	8082                	ret

0000000000000338 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 338:	48d1                	li	a7,20
 ecall
 33a:	00000073          	ecall
 ret
 33e:	8082                	ret

0000000000000340 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 340:	48a5                	li	a7,9
 ecall
 342:	00000073          	ecall
 ret
 346:	8082                	ret

0000000000000348 <dup>:
.global dup
dup:
 li a7, SYS_dup
 348:	48a9                	li	a7,10
 ecall
 34a:	00000073          	ecall
 ret
 34e:	8082                	ret

0000000000000350 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 350:	48ad                	li	a7,11
 ecall
 352:	00000073          	ecall
 ret
 356:	8082                	ret

0000000000000358 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 358:	48b1                	li	a7,12
 ecall
 35a:	00000073          	ecall
 ret
 35e:	8082                	ret

0000000000000360 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 360:	48b5                	li	a7,13
 ecall
 362:	00000073          	ecall
 ret
 366:	8082                	ret

0000000000000368 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 368:	48b9                	li	a7,14
 ecall
 36a:	00000073          	ecall
 ret
 36e:	8082                	ret

0000000000000370 <debugswitch>:
.global debugswitch
debugswitch:
 li a7, SYS_debugswitch
 370:	48d9                	li	a7,22
 ecall
 372:	00000073          	ecall
 ret
 376:	8082                	ret

0000000000000378 <printfslab>:
.global printfslab
printfslab:
 li a7, SYS_printfslab
 378:	48dd                	li	a7,23
 ecall
 37a:	00000073          	ecall
 ret
 37e:	8082                	ret

0000000000000380 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 380:	1101                	addi	sp,sp,-32
 382:	ec06                	sd	ra,24(sp)
 384:	e822                	sd	s0,16(sp)
 386:	1000                	addi	s0,sp,32
 388:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 38c:	4605                	li	a2,1
 38e:	fef40593          	addi	a1,s0,-17
 392:	f5fff0ef          	jal	ra,2f0 <write>
}
 396:	60e2                	ld	ra,24(sp)
 398:	6442                	ld	s0,16(sp)
 39a:	6105                	addi	sp,sp,32
 39c:	8082                	ret

000000000000039e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 39e:	7139                	addi	sp,sp,-64
 3a0:	fc06                	sd	ra,56(sp)
 3a2:	f822                	sd	s0,48(sp)
 3a4:	f426                	sd	s1,40(sp)
 3a6:	f04a                	sd	s2,32(sp)
 3a8:	ec4e                	sd	s3,24(sp)
 3aa:	0080                	addi	s0,sp,64
 3ac:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3ae:	c299                	beqz	a3,3b4 <printint+0x16>
 3b0:	0805c663          	bltz	a1,43c <printint+0x9e>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 3b4:	2581                	sext.w	a1,a1
  neg = 0;
 3b6:	4881                	li	a7,0
 3b8:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 3bc:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 3be:	2601                	sext.w	a2,a2
 3c0:	00000517          	auipc	a0,0x0
 3c4:	50050513          	addi	a0,a0,1280 # 8c0 <digits>
 3c8:	883a                	mv	a6,a4
 3ca:	2705                	addiw	a4,a4,1
 3cc:	02c5f7bb          	remuw	a5,a1,a2
 3d0:	1782                	slli	a5,a5,0x20
 3d2:	9381                	srli	a5,a5,0x20
 3d4:	97aa                	add	a5,a5,a0
 3d6:	0007c783          	lbu	a5,0(a5)
 3da:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 3de:	0005879b          	sext.w	a5,a1
 3e2:	02c5d5bb          	divuw	a1,a1,a2
 3e6:	0685                	addi	a3,a3,1
 3e8:	fec7f0e3          	bgeu	a5,a2,3c8 <printint+0x2a>
  if(neg)
 3ec:	00088b63          	beqz	a7,402 <printint+0x64>
    buf[i++] = '-';
 3f0:	fd040793          	addi	a5,s0,-48
 3f4:	973e                	add	a4,a4,a5
 3f6:	02d00793          	li	a5,45
 3fa:	fef70823          	sb	a5,-16(a4)
 3fe:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 402:	02e05663          	blez	a4,42e <printint+0x90>
 406:	fc040793          	addi	a5,s0,-64
 40a:	00e78933          	add	s2,a5,a4
 40e:	fff78993          	addi	s3,a5,-1
 412:	99ba                	add	s3,s3,a4
 414:	377d                	addiw	a4,a4,-1
 416:	1702                	slli	a4,a4,0x20
 418:	9301                	srli	a4,a4,0x20
 41a:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 41e:	fff94583          	lbu	a1,-1(s2)
 422:	8526                	mv	a0,s1
 424:	f5dff0ef          	jal	ra,380 <putc>
  while(--i >= 0)
 428:	197d                	addi	s2,s2,-1
 42a:	ff391ae3          	bne	s2,s3,41e <printint+0x80>
}
 42e:	70e2                	ld	ra,56(sp)
 430:	7442                	ld	s0,48(sp)
 432:	74a2                	ld	s1,40(sp)
 434:	7902                	ld	s2,32(sp)
 436:	69e2                	ld	s3,24(sp)
 438:	6121                	addi	sp,sp,64
 43a:	8082                	ret
    x = -xx;
 43c:	40b005bb          	negw	a1,a1
    neg = 1;
 440:	4885                	li	a7,1
    x = -xx;
 442:	bf9d                	j	3b8 <printint+0x1a>

0000000000000444 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 444:	7119                	addi	sp,sp,-128
 446:	fc86                	sd	ra,120(sp)
 448:	f8a2                	sd	s0,112(sp)
 44a:	f4a6                	sd	s1,104(sp)
 44c:	f0ca                	sd	s2,96(sp)
 44e:	ecce                	sd	s3,88(sp)
 450:	e8d2                	sd	s4,80(sp)
 452:	e4d6                	sd	s5,72(sp)
 454:	e0da                	sd	s6,64(sp)
 456:	fc5e                	sd	s7,56(sp)
 458:	f862                	sd	s8,48(sp)
 45a:	f466                	sd	s9,40(sp)
 45c:	f06a                	sd	s10,32(sp)
 45e:	ec6e                	sd	s11,24(sp)
 460:	0100                	addi	s0,sp,128
  char *s;
  int c0, c1, c2, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 462:	0005c903          	lbu	s2,0(a1)
 466:	22090e63          	beqz	s2,6a2 <vprintf+0x25e>
 46a:	8b2a                	mv	s6,a0
 46c:	8a2e                	mv	s4,a1
 46e:	8bb2                	mv	s7,a2
  state = 0;
 470:	4981                	li	s3,0
  for(i = 0; fmt[i]; i++){
 472:	4481                	li	s1,0
 474:	4701                	li	a4,0
      if(c0 == '%'){
        state = '%';
      } else {
        putc(fd, c0);
      }
    } else if(state == '%'){
 476:	02500a93          	li	s5,37
      c1 = c2 = 0;
      if(c0) c1 = fmt[i+1] & 0xff;
      if(c1) c2 = fmt[i+2] & 0xff;
      if(c0 == 'd'){
 47a:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c0 == 'l' && c1 == 'd'){
 47e:	06c00d13          	li	s10,108
        printint(fd, va_arg(ap, uint64), 10, 1);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
        printint(fd, va_arg(ap, uint64), 10, 1);
        i += 2;
      } else if(c0 == 'u'){
 482:	07500d93          	li	s11,117
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 486:	00000c97          	auipc	s9,0x0
 48a:	43ac8c93          	addi	s9,s9,1082 # 8c0 <digits>
 48e:	a005                	j	4ae <vprintf+0x6a>
        putc(fd, c0);
 490:	85ca                	mv	a1,s2
 492:	855a                	mv	a0,s6
 494:	eedff0ef          	jal	ra,380 <putc>
 498:	a019                	j	49e <vprintf+0x5a>
    } else if(state == '%'){
 49a:	03598263          	beq	s3,s5,4be <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 49e:	2485                	addiw	s1,s1,1
 4a0:	8726                	mv	a4,s1
 4a2:	009a07b3          	add	a5,s4,s1
 4a6:	0007c903          	lbu	s2,0(a5)
 4aa:	1e090c63          	beqz	s2,6a2 <vprintf+0x25e>
    c0 = fmt[i] & 0xff;
 4ae:	0009079b          	sext.w	a5,s2
    if(state == 0){
 4b2:	fe0994e3          	bnez	s3,49a <vprintf+0x56>
      if(c0 == '%'){
 4b6:	fd579de3          	bne	a5,s5,490 <vprintf+0x4c>
        state = '%';
 4ba:	89be                	mv	s3,a5
 4bc:	b7cd                	j	49e <vprintf+0x5a>
      if(c0) c1 = fmt[i+1] & 0xff;
 4be:	cfa5                	beqz	a5,536 <vprintf+0xf2>
 4c0:	00ea06b3          	add	a3,s4,a4
 4c4:	0016c683          	lbu	a3,1(a3)
      c1 = c2 = 0;
 4c8:	8636                	mv	a2,a3
      if(c1) c2 = fmt[i+2] & 0xff;
 4ca:	c681                	beqz	a3,4d2 <vprintf+0x8e>
 4cc:	9752                	add	a4,a4,s4
 4ce:	00274603          	lbu	a2,2(a4)
      if(c0 == 'd'){
 4d2:	03878a63          	beq	a5,s8,506 <vprintf+0xc2>
      } else if(c0 == 'l' && c1 == 'd'){
 4d6:	05a78463          	beq	a5,s10,51e <vprintf+0xda>
      } else if(c0 == 'u'){
 4da:	0db78763          	beq	a5,s11,5a8 <vprintf+0x164>
        printint(fd, va_arg(ap, uint64), 10, 0);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
        printint(fd, va_arg(ap, uint64), 10, 0);
        i += 2;
      } else if(c0 == 'x'){
 4de:	07800713          	li	a4,120
 4e2:	10e78963          	beq	a5,a4,5f4 <vprintf+0x1b0>
        printint(fd, va_arg(ap, uint64), 16, 0);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'x'){
        printint(fd, va_arg(ap, uint64), 16, 0);
        i += 2;
      } else if(c0 == 'p'){
 4e6:	07000713          	li	a4,112
 4ea:	12e78e63          	beq	a5,a4,626 <vprintf+0x1e2>
        printptr(fd, va_arg(ap, uint64));
      } else if(c0 == 's'){
 4ee:	07300713          	li	a4,115
 4f2:	16e78b63          	beq	a5,a4,668 <vprintf+0x224>
        if((s = va_arg(ap, char*)) == 0)
          s = "(null)";
        for(; *s; s++)
          putc(fd, *s);
      } else if(c0 == '%'){
 4f6:	05579063          	bne	a5,s5,536 <vprintf+0xf2>
        putc(fd, '%');
 4fa:	85d6                	mv	a1,s5
 4fc:	855a                	mv	a0,s6
 4fe:	e83ff0ef          	jal	ra,380 <putc>
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
#endif
      state = 0;
 502:	4981                	li	s3,0
 504:	bf69                	j	49e <vprintf+0x5a>
        printint(fd, va_arg(ap, int), 10, 1);
 506:	008b8913          	addi	s2,s7,8
 50a:	4685                	li	a3,1
 50c:	4629                	li	a2,10
 50e:	000ba583          	lw	a1,0(s7)
 512:	855a                	mv	a0,s6
 514:	e8bff0ef          	jal	ra,39e <printint>
 518:	8bca                	mv	s7,s2
      state = 0;
 51a:	4981                	li	s3,0
 51c:	b749                	j	49e <vprintf+0x5a>
      } else if(c0 == 'l' && c1 == 'd'){
 51e:	03868663          	beq	a3,s8,54a <vprintf+0x106>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
 522:	05a68163          	beq	a3,s10,564 <vprintf+0x120>
      } else if(c0 == 'l' && c1 == 'u'){
 526:	09b68d63          	beq	a3,s11,5c0 <vprintf+0x17c>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
 52a:	03a68f63          	beq	a3,s10,568 <vprintf+0x124>
      } else if(c0 == 'l' && c1 == 'x'){
 52e:	07800793          	li	a5,120
 532:	0cf68d63          	beq	a3,a5,60c <vprintf+0x1c8>
        putc(fd, '%');
 536:	85d6                	mv	a1,s5
 538:	855a                	mv	a0,s6
 53a:	e47ff0ef          	jal	ra,380 <putc>
        putc(fd, c0);
 53e:	85ca                	mv	a1,s2
 540:	855a                	mv	a0,s6
 542:	e3fff0ef          	jal	ra,380 <putc>
      state = 0;
 546:	4981                	li	s3,0
 548:	bf99                	j	49e <vprintf+0x5a>
        printint(fd, va_arg(ap, uint64), 10, 1);
 54a:	008b8913          	addi	s2,s7,8
 54e:	4685                	li	a3,1
 550:	4629                	li	a2,10
 552:	000ba583          	lw	a1,0(s7)
 556:	855a                	mv	a0,s6
 558:	e47ff0ef          	jal	ra,39e <printint>
        i += 1;
 55c:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 10, 1);
 55e:	8bca                	mv	s7,s2
      state = 0;
 560:	4981                	li	s3,0
        i += 1;
 562:	bf35                	j	49e <vprintf+0x5a>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
 564:	03860563          	beq	a2,s8,58e <vprintf+0x14a>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
 568:	07b60963          	beq	a2,s11,5da <vprintf+0x196>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'x'){
 56c:	07800793          	li	a5,120
 570:	fcf613e3          	bne	a2,a5,536 <vprintf+0xf2>
        printint(fd, va_arg(ap, uint64), 16, 0);
 574:	008b8913          	addi	s2,s7,8
 578:	4681                	li	a3,0
 57a:	4641                	li	a2,16
 57c:	000ba583          	lw	a1,0(s7)
 580:	855a                	mv	a0,s6
 582:	e1dff0ef          	jal	ra,39e <printint>
        i += 2;
 586:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 16, 0);
 588:	8bca                	mv	s7,s2
      state = 0;
 58a:	4981                	li	s3,0
        i += 2;
 58c:	bf09                	j	49e <vprintf+0x5a>
        printint(fd, va_arg(ap, uint64), 10, 1);
 58e:	008b8913          	addi	s2,s7,8
 592:	4685                	li	a3,1
 594:	4629                	li	a2,10
 596:	000ba583          	lw	a1,0(s7)
 59a:	855a                	mv	a0,s6
 59c:	e03ff0ef          	jal	ra,39e <printint>
        i += 2;
 5a0:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 10, 1);
 5a2:	8bca                	mv	s7,s2
      state = 0;
 5a4:	4981                	li	s3,0
        i += 2;
 5a6:	bde5                	j	49e <vprintf+0x5a>
        printint(fd, va_arg(ap, int), 10, 0);
 5a8:	008b8913          	addi	s2,s7,8
 5ac:	4681                	li	a3,0
 5ae:	4629                	li	a2,10
 5b0:	000ba583          	lw	a1,0(s7)
 5b4:	855a                	mv	a0,s6
 5b6:	de9ff0ef          	jal	ra,39e <printint>
 5ba:	8bca                	mv	s7,s2
      state = 0;
 5bc:	4981                	li	s3,0
 5be:	b5c5                	j	49e <vprintf+0x5a>
        printint(fd, va_arg(ap, uint64), 10, 0);
 5c0:	008b8913          	addi	s2,s7,8
 5c4:	4681                	li	a3,0
 5c6:	4629                	li	a2,10
 5c8:	000ba583          	lw	a1,0(s7)
 5cc:	855a                	mv	a0,s6
 5ce:	dd1ff0ef          	jal	ra,39e <printint>
        i += 1;
 5d2:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 10, 0);
 5d4:	8bca                	mv	s7,s2
      state = 0;
 5d6:	4981                	li	s3,0
        i += 1;
 5d8:	b5d9                	j	49e <vprintf+0x5a>
        printint(fd, va_arg(ap, uint64), 10, 0);
 5da:	008b8913          	addi	s2,s7,8
 5de:	4681                	li	a3,0
 5e0:	4629                	li	a2,10
 5e2:	000ba583          	lw	a1,0(s7)
 5e6:	855a                	mv	a0,s6
 5e8:	db7ff0ef          	jal	ra,39e <printint>
        i += 2;
 5ec:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 10, 0);
 5ee:	8bca                	mv	s7,s2
      state = 0;
 5f0:	4981                	li	s3,0
        i += 2;
 5f2:	b575                	j	49e <vprintf+0x5a>
        printint(fd, va_arg(ap, int), 16, 0);
 5f4:	008b8913          	addi	s2,s7,8
 5f8:	4681                	li	a3,0
 5fa:	4641                	li	a2,16
 5fc:	000ba583          	lw	a1,0(s7)
 600:	855a                	mv	a0,s6
 602:	d9dff0ef          	jal	ra,39e <printint>
 606:	8bca                	mv	s7,s2
      state = 0;
 608:	4981                	li	s3,0
 60a:	bd51                	j	49e <vprintf+0x5a>
        printint(fd, va_arg(ap, uint64), 16, 0);
 60c:	008b8913          	addi	s2,s7,8
 610:	4681                	li	a3,0
 612:	4641                	li	a2,16
 614:	000ba583          	lw	a1,0(s7)
 618:	855a                	mv	a0,s6
 61a:	d85ff0ef          	jal	ra,39e <printint>
        i += 1;
 61e:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 16, 0);
 620:	8bca                	mv	s7,s2
      state = 0;
 622:	4981                	li	s3,0
        i += 1;
 624:	bdad                	j	49e <vprintf+0x5a>
        printptr(fd, va_arg(ap, uint64));
 626:	008b8793          	addi	a5,s7,8
 62a:	f8f43423          	sd	a5,-120(s0)
 62e:	000bb983          	ld	s3,0(s7)
  putc(fd, '0');
 632:	03000593          	li	a1,48
 636:	855a                	mv	a0,s6
 638:	d49ff0ef          	jal	ra,380 <putc>
  putc(fd, 'x');
 63c:	07800593          	li	a1,120
 640:	855a                	mv	a0,s6
 642:	d3fff0ef          	jal	ra,380 <putc>
 646:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 648:	03c9d793          	srli	a5,s3,0x3c
 64c:	97e6                	add	a5,a5,s9
 64e:	0007c583          	lbu	a1,0(a5)
 652:	855a                	mv	a0,s6
 654:	d2dff0ef          	jal	ra,380 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 658:	0992                	slli	s3,s3,0x4
 65a:	397d                	addiw	s2,s2,-1
 65c:	fe0916e3          	bnez	s2,648 <vprintf+0x204>
        printptr(fd, va_arg(ap, uint64));
 660:	f8843b83          	ld	s7,-120(s0)
      state = 0;
 664:	4981                	li	s3,0
 666:	bd25                	j	49e <vprintf+0x5a>
        if((s = va_arg(ap, char*)) == 0)
 668:	008b8993          	addi	s3,s7,8
 66c:	000bb903          	ld	s2,0(s7)
 670:	00090f63          	beqz	s2,68e <vprintf+0x24a>
        for(; *s; s++)
 674:	00094583          	lbu	a1,0(s2)
 678:	c195                	beqz	a1,69c <vprintf+0x258>
          putc(fd, *s);
 67a:	855a                	mv	a0,s6
 67c:	d05ff0ef          	jal	ra,380 <putc>
        for(; *s; s++)
 680:	0905                	addi	s2,s2,1
 682:	00094583          	lbu	a1,0(s2)
 686:	f9f5                	bnez	a1,67a <vprintf+0x236>
        if((s = va_arg(ap, char*)) == 0)
 688:	8bce                	mv	s7,s3
      state = 0;
 68a:	4981                	li	s3,0
 68c:	bd09                	j	49e <vprintf+0x5a>
          s = "(null)";
 68e:	00000917          	auipc	s2,0x0
 692:	22a90913          	addi	s2,s2,554 # 8b8 <malloc+0x114>
        for(; *s; s++)
 696:	02800593          	li	a1,40
 69a:	b7c5                	j	67a <vprintf+0x236>
        if((s = va_arg(ap, char*)) == 0)
 69c:	8bce                	mv	s7,s3
      state = 0;
 69e:	4981                	li	s3,0
 6a0:	bbfd                	j	49e <vprintf+0x5a>
    }
  }
}
 6a2:	70e6                	ld	ra,120(sp)
 6a4:	7446                	ld	s0,112(sp)
 6a6:	74a6                	ld	s1,104(sp)
 6a8:	7906                	ld	s2,96(sp)
 6aa:	69e6                	ld	s3,88(sp)
 6ac:	6a46                	ld	s4,80(sp)
 6ae:	6aa6                	ld	s5,72(sp)
 6b0:	6b06                	ld	s6,64(sp)
 6b2:	7be2                	ld	s7,56(sp)
 6b4:	7c42                	ld	s8,48(sp)
 6b6:	7ca2                	ld	s9,40(sp)
 6b8:	7d02                	ld	s10,32(sp)
 6ba:	6de2                	ld	s11,24(sp)
 6bc:	6109                	addi	sp,sp,128
 6be:	8082                	ret

00000000000006c0 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 6c0:	715d                	addi	sp,sp,-80
 6c2:	ec06                	sd	ra,24(sp)
 6c4:	e822                	sd	s0,16(sp)
 6c6:	1000                	addi	s0,sp,32
 6c8:	e010                	sd	a2,0(s0)
 6ca:	e414                	sd	a3,8(s0)
 6cc:	e818                	sd	a4,16(s0)
 6ce:	ec1c                	sd	a5,24(s0)
 6d0:	03043023          	sd	a6,32(s0)
 6d4:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 6d8:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 6dc:	8622                	mv	a2,s0
 6de:	d67ff0ef          	jal	ra,444 <vprintf>
}
 6e2:	60e2                	ld	ra,24(sp)
 6e4:	6442                	ld	s0,16(sp)
 6e6:	6161                	addi	sp,sp,80
 6e8:	8082                	ret

00000000000006ea <printf>:

void
printf(const char *fmt, ...)
{
 6ea:	711d                	addi	sp,sp,-96
 6ec:	ec06                	sd	ra,24(sp)
 6ee:	e822                	sd	s0,16(sp)
 6f0:	1000                	addi	s0,sp,32
 6f2:	e40c                	sd	a1,8(s0)
 6f4:	e810                	sd	a2,16(s0)
 6f6:	ec14                	sd	a3,24(s0)
 6f8:	f018                	sd	a4,32(s0)
 6fa:	f41c                	sd	a5,40(s0)
 6fc:	03043823          	sd	a6,48(s0)
 700:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 704:	00840613          	addi	a2,s0,8
 708:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 70c:	85aa                	mv	a1,a0
 70e:	4505                	li	a0,1
 710:	d35ff0ef          	jal	ra,444 <vprintf>
}
 714:	60e2                	ld	ra,24(sp)
 716:	6442                	ld	s0,16(sp)
 718:	6125                	addi	sp,sp,96
 71a:	8082                	ret

000000000000071c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 71c:	1141                	addi	sp,sp,-16
 71e:	e422                	sd	s0,8(sp)
 720:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 722:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 726:	00001797          	auipc	a5,0x1
 72a:	8da7b783          	ld	a5,-1830(a5) # 1000 <freep>
 72e:	a805                	j	75e <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 730:	4618                	lw	a4,8(a2)
 732:	9db9                	addw	a1,a1,a4
 734:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 738:	6398                	ld	a4,0(a5)
 73a:	6318                	ld	a4,0(a4)
 73c:	fee53823          	sd	a4,-16(a0)
 740:	a091                	j	784 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 742:	ff852703          	lw	a4,-8(a0)
 746:	9e39                	addw	a2,a2,a4
 748:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 74a:	ff053703          	ld	a4,-16(a0)
 74e:	e398                	sd	a4,0(a5)
 750:	a099                	j	796 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 752:	6398                	ld	a4,0(a5)
 754:	00e7e463          	bltu	a5,a4,75c <free+0x40>
 758:	00e6ea63          	bltu	a3,a4,76c <free+0x50>
{
 75c:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 75e:	fed7fae3          	bgeu	a5,a3,752 <free+0x36>
 762:	6398                	ld	a4,0(a5)
 764:	00e6e463          	bltu	a3,a4,76c <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 768:	fee7eae3          	bltu	a5,a4,75c <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 76c:	ff852583          	lw	a1,-8(a0)
 770:	6390                	ld	a2,0(a5)
 772:	02059713          	slli	a4,a1,0x20
 776:	9301                	srli	a4,a4,0x20
 778:	0712                	slli	a4,a4,0x4
 77a:	9736                	add	a4,a4,a3
 77c:	fae60ae3          	beq	a2,a4,730 <free+0x14>
    bp->s.ptr = p->s.ptr;
 780:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 784:	4790                	lw	a2,8(a5)
 786:	02061713          	slli	a4,a2,0x20
 78a:	9301                	srli	a4,a4,0x20
 78c:	0712                	slli	a4,a4,0x4
 78e:	973e                	add	a4,a4,a5
 790:	fae689e3          	beq	a3,a4,742 <free+0x26>
  } else
    p->s.ptr = bp;
 794:	e394                	sd	a3,0(a5)
  freep = p;
 796:	00001717          	auipc	a4,0x1
 79a:	86f73523          	sd	a5,-1942(a4) # 1000 <freep>
}
 79e:	6422                	ld	s0,8(sp)
 7a0:	0141                	addi	sp,sp,16
 7a2:	8082                	ret

00000000000007a4 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7a4:	7139                	addi	sp,sp,-64
 7a6:	fc06                	sd	ra,56(sp)
 7a8:	f822                	sd	s0,48(sp)
 7aa:	f426                	sd	s1,40(sp)
 7ac:	f04a                	sd	s2,32(sp)
 7ae:	ec4e                	sd	s3,24(sp)
 7b0:	e852                	sd	s4,16(sp)
 7b2:	e456                	sd	s5,8(sp)
 7b4:	e05a                	sd	s6,0(sp)
 7b6:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7b8:	02051493          	slli	s1,a0,0x20
 7bc:	9081                	srli	s1,s1,0x20
 7be:	04bd                	addi	s1,s1,15
 7c0:	8091                	srli	s1,s1,0x4
 7c2:	0014899b          	addiw	s3,s1,1
 7c6:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 7c8:	00001517          	auipc	a0,0x1
 7cc:	83853503          	ld	a0,-1992(a0) # 1000 <freep>
 7d0:	c515                	beqz	a0,7fc <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d2:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 7d4:	4798                	lw	a4,8(a5)
 7d6:	02977f63          	bgeu	a4,s1,814 <malloc+0x70>
 7da:	8a4e                	mv	s4,s3
 7dc:	0009871b          	sext.w	a4,s3
 7e0:	6685                	lui	a3,0x1
 7e2:	00d77363          	bgeu	a4,a3,7e8 <malloc+0x44>
 7e6:	6a05                	lui	s4,0x1
 7e8:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 7ec:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7f0:	00001917          	auipc	s2,0x1
 7f4:	81090913          	addi	s2,s2,-2032 # 1000 <freep>
  if(p == (char*)-1)
 7f8:	5afd                	li	s5,-1
 7fa:	a0bd                	j	868 <malloc+0xc4>
    base.s.ptr = freep = prevp = &base;
 7fc:	00001797          	auipc	a5,0x1
 800:	81478793          	addi	a5,a5,-2028 # 1010 <base>
 804:	00000717          	auipc	a4,0x0
 808:	7ef73e23          	sd	a5,2044(a4) # 1000 <freep>
 80c:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 80e:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 812:	b7e1                	j	7da <malloc+0x36>
      if(p->s.size == nunits)
 814:	02e48b63          	beq	s1,a4,84a <malloc+0xa6>
        p->s.size -= nunits;
 818:	4137073b          	subw	a4,a4,s3
 81c:	c798                	sw	a4,8(a5)
        p += p->s.size;
 81e:	1702                	slli	a4,a4,0x20
 820:	9301                	srli	a4,a4,0x20
 822:	0712                	slli	a4,a4,0x4
 824:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 826:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 82a:	00000717          	auipc	a4,0x0
 82e:	7ca73b23          	sd	a0,2006(a4) # 1000 <freep>
      return (void*)(p + 1);
 832:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 836:	70e2                	ld	ra,56(sp)
 838:	7442                	ld	s0,48(sp)
 83a:	74a2                	ld	s1,40(sp)
 83c:	7902                	ld	s2,32(sp)
 83e:	69e2                	ld	s3,24(sp)
 840:	6a42                	ld	s4,16(sp)
 842:	6aa2                	ld	s5,8(sp)
 844:	6b02                	ld	s6,0(sp)
 846:	6121                	addi	sp,sp,64
 848:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 84a:	6398                	ld	a4,0(a5)
 84c:	e118                	sd	a4,0(a0)
 84e:	bff1                	j	82a <malloc+0x86>
  hp->s.size = nu;
 850:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 854:	0541                	addi	a0,a0,16
 856:	ec7ff0ef          	jal	ra,71c <free>
  return freep;
 85a:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 85e:	dd61                	beqz	a0,836 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 860:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 862:	4798                	lw	a4,8(a5)
 864:	fa9778e3          	bgeu	a4,s1,814 <malloc+0x70>
    if(p == freep)
 868:	00093703          	ld	a4,0(s2)
 86c:	853e                	mv	a0,a5
 86e:	fef719e3          	bne	a4,a5,860 <malloc+0xbc>
  p = sbrk(nu * sizeof(Header));
 872:	8552                	mv	a0,s4
 874:	ae5ff0ef          	jal	ra,358 <sbrk>
  if(p == (char*)-1)
 878:	fd551ce3          	bne	a0,s5,850 <malloc+0xac>
        return 0;
 87c:	4501                	li	a0,0
 87e:	bf65                	j	836 <malloc+0x92>
