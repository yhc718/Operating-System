
user/_oak:     file format elf64-littleriscv


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
  34:	192000ef          	jal	ra,1c6 <strlen>
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
  aa:	346000ef          	jal	ra,3f0 <read>
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

0000000000000102 <main>:
#include "kernel/types.h"
#include "user/user.h"
#include "user/ok.h"

int main(int argc, char *argv[])
{
 102:	df010113          	addi	sp,sp,-528
 106:	20113423          	sd	ra,520(sp)
 10a:	20813023          	sd	s0,512(sp)
 10e:	0c00                	addi	s0,sp,528
  char buf[512];
  int pid_to_kill = 0;

  if (!(argc == 2 && !strcmp(argv[1], "end")))
 110:	4709                	li	a4,2
 112:	00e51b63          	bne	a0,a4,128 <main+0x26>
 116:	87ae                	mv	a5,a1
 118:	00001597          	auipc	a1,0x1
 11c:	87858593          	addi	a1,a1,-1928 # 990 <malloc+0xe4>
 120:	6788                	ld	a0,8(a5)
 122:	078000ef          	jal	ra,19a <strcmp>
 126:	c911                	beqz	a0,13a <main+0x38>
  {
    printf("%d", getpid());
 128:	330000ef          	jal	ra,458 <getpid>
 12c:	85aa                	mv	a1,a0
 12e:	00001517          	auipc	a0,0x1
 132:	86a50513          	addi	a0,a0,-1942 # 998 <malloc+0xec>
 136:	6bc000ef          	jal	ra,7f2 <printf>
  }

  read_until_match("Ok", buf, sizeof(buf));
 13a:	20000613          	li	a2,512
 13e:	df040593          	addi	a1,s0,-528
 142:	00001517          	auipc	a0,0x1
 146:	85e50513          	addi	a0,a0,-1954 # 9a0 <malloc+0xf4>
 14a:	eb7ff0ef          	jal	ra,0 <read_until_match>
  pid_to_kill = atoi(buf);
 14e:	df040513          	addi	a0,s0,-528
 152:	18e000ef          	jal	ra,2e0 <atoi>
  kill(pid_to_kill);
 156:	2b2000ef          	jal	ra,408 <kill>
  printf("Ok");
 15a:	00001517          	auipc	a0,0x1
 15e:	84650513          	addi	a0,a0,-1978 # 9a0 <malloc+0xf4>
 162:	690000ef          	jal	ra,7f2 <printf>

  exit(0);
 166:	4501                	li	a0,0
 168:	270000ef          	jal	ra,3d8 <exit>

000000000000016c <start>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
start()
{
 16c:	1141                	addi	sp,sp,-16
 16e:	e406                	sd	ra,8(sp)
 170:	e022                	sd	s0,0(sp)
 172:	0800                	addi	s0,sp,16
  extern int main();
  main();
 174:	f8fff0ef          	jal	ra,102 <main>
  exit(0);
 178:	4501                	li	a0,0
 17a:	25e000ef          	jal	ra,3d8 <exit>

000000000000017e <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
 17e:	1141                	addi	sp,sp,-16
 180:	e422                	sd	s0,8(sp)
 182:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 184:	87aa                	mv	a5,a0
 186:	0585                	addi	a1,a1,1
 188:	0785                	addi	a5,a5,1
 18a:	fff5c703          	lbu	a4,-1(a1)
 18e:	fee78fa3          	sb	a4,-1(a5)
 192:	fb75                	bnez	a4,186 <strcpy+0x8>
    ;
  return os;
}
 194:	6422                	ld	s0,8(sp)
 196:	0141                	addi	sp,sp,16
 198:	8082                	ret

000000000000019a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 19a:	1141                	addi	sp,sp,-16
 19c:	e422                	sd	s0,8(sp)
 19e:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 1a0:	00054783          	lbu	a5,0(a0)
 1a4:	cb91                	beqz	a5,1b8 <strcmp+0x1e>
 1a6:	0005c703          	lbu	a4,0(a1)
 1aa:	00f71763          	bne	a4,a5,1b8 <strcmp+0x1e>
    p++, q++;
 1ae:	0505                	addi	a0,a0,1
 1b0:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 1b2:	00054783          	lbu	a5,0(a0)
 1b6:	fbe5                	bnez	a5,1a6 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 1b8:	0005c503          	lbu	a0,0(a1)
}
 1bc:	40a7853b          	subw	a0,a5,a0
 1c0:	6422                	ld	s0,8(sp)
 1c2:	0141                	addi	sp,sp,16
 1c4:	8082                	ret

00000000000001c6 <strlen>:

uint
strlen(const char *s)
{
 1c6:	1141                	addi	sp,sp,-16
 1c8:	e422                	sd	s0,8(sp)
 1ca:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 1cc:	00054783          	lbu	a5,0(a0)
 1d0:	cf91                	beqz	a5,1ec <strlen+0x26>
 1d2:	0505                	addi	a0,a0,1
 1d4:	87aa                	mv	a5,a0
 1d6:	4685                	li	a3,1
 1d8:	9e89                	subw	a3,a3,a0
 1da:	00f6853b          	addw	a0,a3,a5
 1de:	0785                	addi	a5,a5,1
 1e0:	fff7c703          	lbu	a4,-1(a5)
 1e4:	fb7d                	bnez	a4,1da <strlen+0x14>
    ;
  return n;
}
 1e6:	6422                	ld	s0,8(sp)
 1e8:	0141                	addi	sp,sp,16
 1ea:	8082                	ret
  for(n = 0; s[n]; n++)
 1ec:	4501                	li	a0,0
 1ee:	bfe5                	j	1e6 <strlen+0x20>

00000000000001f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1f0:	1141                	addi	sp,sp,-16
 1f2:	e422                	sd	s0,8(sp)
 1f4:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 1f6:	ca19                	beqz	a2,20c <memset+0x1c>
 1f8:	87aa                	mv	a5,a0
 1fa:	1602                	slli	a2,a2,0x20
 1fc:	9201                	srli	a2,a2,0x20
 1fe:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 202:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 206:	0785                	addi	a5,a5,1
 208:	fee79de3          	bne	a5,a4,202 <memset+0x12>
  }
  return dst;
}
 20c:	6422                	ld	s0,8(sp)
 20e:	0141                	addi	sp,sp,16
 210:	8082                	ret

0000000000000212 <strchr>:

char*
strchr(const char *s, char c)
{
 212:	1141                	addi	sp,sp,-16
 214:	e422                	sd	s0,8(sp)
 216:	0800                	addi	s0,sp,16
  for(; *s; s++)
 218:	00054783          	lbu	a5,0(a0)
 21c:	cb99                	beqz	a5,232 <strchr+0x20>
    if(*s == c)
 21e:	00f58763          	beq	a1,a5,22c <strchr+0x1a>
  for(; *s; s++)
 222:	0505                	addi	a0,a0,1
 224:	00054783          	lbu	a5,0(a0)
 228:	fbfd                	bnez	a5,21e <strchr+0xc>
      return (char*)s;
  return 0;
 22a:	4501                	li	a0,0
}
 22c:	6422                	ld	s0,8(sp)
 22e:	0141                	addi	sp,sp,16
 230:	8082                	ret
  return 0;
 232:	4501                	li	a0,0
 234:	bfe5                	j	22c <strchr+0x1a>

0000000000000236 <gets>:

char*
gets(char *buf, int max)
{
 236:	711d                	addi	sp,sp,-96
 238:	ec86                	sd	ra,88(sp)
 23a:	e8a2                	sd	s0,80(sp)
 23c:	e4a6                	sd	s1,72(sp)
 23e:	e0ca                	sd	s2,64(sp)
 240:	fc4e                	sd	s3,56(sp)
 242:	f852                	sd	s4,48(sp)
 244:	f456                	sd	s5,40(sp)
 246:	f05a                	sd	s6,32(sp)
 248:	ec5e                	sd	s7,24(sp)
 24a:	1080                	addi	s0,sp,96
 24c:	8baa                	mv	s7,a0
 24e:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 250:	892a                	mv	s2,a0
 252:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 254:	4aa9                	li	s5,10
 256:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 258:	89a6                	mv	s3,s1
 25a:	2485                	addiw	s1,s1,1
 25c:	0344d663          	bge	s1,s4,288 <gets+0x52>
    cc = read(0, &c, 1);
 260:	4605                	li	a2,1
 262:	faf40593          	addi	a1,s0,-81
 266:	4501                	li	a0,0
 268:	188000ef          	jal	ra,3f0 <read>
    if(cc < 1)
 26c:	00a05e63          	blez	a0,288 <gets+0x52>
    buf[i++] = c;
 270:	faf44783          	lbu	a5,-81(s0)
 274:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 278:	01578763          	beq	a5,s5,286 <gets+0x50>
 27c:	0905                	addi	s2,s2,1
 27e:	fd679de3          	bne	a5,s6,258 <gets+0x22>
  for(i=0; i+1 < max; ){
 282:	89a6                	mv	s3,s1
 284:	a011                	j	288 <gets+0x52>
 286:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 288:	99de                	add	s3,s3,s7
 28a:	00098023          	sb	zero,0(s3)
  return buf;
}
 28e:	855e                	mv	a0,s7
 290:	60e6                	ld	ra,88(sp)
 292:	6446                	ld	s0,80(sp)
 294:	64a6                	ld	s1,72(sp)
 296:	6906                	ld	s2,64(sp)
 298:	79e2                	ld	s3,56(sp)
 29a:	7a42                	ld	s4,48(sp)
 29c:	7aa2                	ld	s5,40(sp)
 29e:	7b02                	ld	s6,32(sp)
 2a0:	6be2                	ld	s7,24(sp)
 2a2:	6125                	addi	sp,sp,96
 2a4:	8082                	ret

00000000000002a6 <stat>:

int
stat(const char *n, struct stat *st)
{
 2a6:	1101                	addi	sp,sp,-32
 2a8:	ec06                	sd	ra,24(sp)
 2aa:	e822                	sd	s0,16(sp)
 2ac:	e426                	sd	s1,8(sp)
 2ae:	e04a                	sd	s2,0(sp)
 2b0:	1000                	addi	s0,sp,32
 2b2:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b4:	4581                	li	a1,0
 2b6:	162000ef          	jal	ra,418 <open>
  if(fd < 0)
 2ba:	02054163          	bltz	a0,2dc <stat+0x36>
 2be:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 2c0:	85ca                	mv	a1,s2
 2c2:	16e000ef          	jal	ra,430 <fstat>
 2c6:	892a                	mv	s2,a0
  close(fd);
 2c8:	8526                	mv	a0,s1
 2ca:	136000ef          	jal	ra,400 <close>
  return r;
}
 2ce:	854a                	mv	a0,s2
 2d0:	60e2                	ld	ra,24(sp)
 2d2:	6442                	ld	s0,16(sp)
 2d4:	64a2                	ld	s1,8(sp)
 2d6:	6902                	ld	s2,0(sp)
 2d8:	6105                	addi	sp,sp,32
 2da:	8082                	ret
    return -1;
 2dc:	597d                	li	s2,-1
 2de:	bfc5                	j	2ce <stat+0x28>

00000000000002e0 <atoi>:

int
atoi(const char *s)
{
 2e0:	1141                	addi	sp,sp,-16
 2e2:	e422                	sd	s0,8(sp)
 2e4:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2e6:	00054603          	lbu	a2,0(a0)
 2ea:	fd06079b          	addiw	a5,a2,-48
 2ee:	0ff7f793          	andi	a5,a5,255
 2f2:	4725                	li	a4,9
 2f4:	02f76963          	bltu	a4,a5,326 <atoi+0x46>
 2f8:	86aa                	mv	a3,a0
  n = 0;
 2fa:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 2fc:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 2fe:	0685                	addi	a3,a3,1
 300:	0025179b          	slliw	a5,a0,0x2
 304:	9fa9                	addw	a5,a5,a0
 306:	0017979b          	slliw	a5,a5,0x1
 30a:	9fb1                	addw	a5,a5,a2
 30c:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 310:	0006c603          	lbu	a2,0(a3)
 314:	fd06071b          	addiw	a4,a2,-48
 318:	0ff77713          	andi	a4,a4,255
 31c:	fee5f1e3          	bgeu	a1,a4,2fe <atoi+0x1e>
  return n;
}
 320:	6422                	ld	s0,8(sp)
 322:	0141                	addi	sp,sp,16
 324:	8082                	ret
  n = 0;
 326:	4501                	li	a0,0
 328:	bfe5                	j	320 <atoi+0x40>

000000000000032a <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 32a:	1141                	addi	sp,sp,-16
 32c:	e422                	sd	s0,8(sp)
 32e:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 330:	02b57463          	bgeu	a0,a1,358 <memmove+0x2e>
    while(n-- > 0)
 334:	00c05f63          	blez	a2,352 <memmove+0x28>
 338:	1602                	slli	a2,a2,0x20
 33a:	9201                	srli	a2,a2,0x20
 33c:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 340:	872a                	mv	a4,a0
      *dst++ = *src++;
 342:	0585                	addi	a1,a1,1
 344:	0705                	addi	a4,a4,1
 346:	fff5c683          	lbu	a3,-1(a1)
 34a:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 34e:	fee79ae3          	bne	a5,a4,342 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 352:	6422                	ld	s0,8(sp)
 354:	0141                	addi	sp,sp,16
 356:	8082                	ret
    dst += n;
 358:	00c50733          	add	a4,a0,a2
    src += n;
 35c:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 35e:	fec05ae3          	blez	a2,352 <memmove+0x28>
 362:	fff6079b          	addiw	a5,a2,-1
 366:	1782                	slli	a5,a5,0x20
 368:	9381                	srli	a5,a5,0x20
 36a:	fff7c793          	not	a5,a5
 36e:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 370:	15fd                	addi	a1,a1,-1
 372:	177d                	addi	a4,a4,-1
 374:	0005c683          	lbu	a3,0(a1)
 378:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 37c:	fee79ae3          	bne	a5,a4,370 <memmove+0x46>
 380:	bfc9                	j	352 <memmove+0x28>

0000000000000382 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 382:	1141                	addi	sp,sp,-16
 384:	e422                	sd	s0,8(sp)
 386:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 388:	ca05                	beqz	a2,3b8 <memcmp+0x36>
 38a:	fff6069b          	addiw	a3,a2,-1
 38e:	1682                	slli	a3,a3,0x20
 390:	9281                	srli	a3,a3,0x20
 392:	0685                	addi	a3,a3,1
 394:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 396:	00054783          	lbu	a5,0(a0)
 39a:	0005c703          	lbu	a4,0(a1)
 39e:	00e79863          	bne	a5,a4,3ae <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 3a2:	0505                	addi	a0,a0,1
    p2++;
 3a4:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 3a6:	fed518e3          	bne	a0,a3,396 <memcmp+0x14>
  }
  return 0;
 3aa:	4501                	li	a0,0
 3ac:	a019                	j	3b2 <memcmp+0x30>
      return *p1 - *p2;
 3ae:	40e7853b          	subw	a0,a5,a4
}
 3b2:	6422                	ld	s0,8(sp)
 3b4:	0141                	addi	sp,sp,16
 3b6:	8082                	ret
  return 0;
 3b8:	4501                	li	a0,0
 3ba:	bfe5                	j	3b2 <memcmp+0x30>

00000000000003bc <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 3bc:	1141                	addi	sp,sp,-16
 3be:	e406                	sd	ra,8(sp)
 3c0:	e022                	sd	s0,0(sp)
 3c2:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 3c4:	f67ff0ef          	jal	ra,32a <memmove>
}
 3c8:	60a2                	ld	ra,8(sp)
 3ca:	6402                	ld	s0,0(sp)
 3cc:	0141                	addi	sp,sp,16
 3ce:	8082                	ret

00000000000003d0 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 3d0:	4885                	li	a7,1
 ecall
 3d2:	00000073          	ecall
 ret
 3d6:	8082                	ret

00000000000003d8 <exit>:
.global exit
exit:
 li a7, SYS_exit
 3d8:	4889                	li	a7,2
 ecall
 3da:	00000073          	ecall
 ret
 3de:	8082                	ret

00000000000003e0 <wait>:
.global wait
wait:
 li a7, SYS_wait
 3e0:	488d                	li	a7,3
 ecall
 3e2:	00000073          	ecall
 ret
 3e6:	8082                	ret

00000000000003e8 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 3e8:	4891                	li	a7,4
 ecall
 3ea:	00000073          	ecall
 ret
 3ee:	8082                	ret

00000000000003f0 <read>:
.global read
read:
 li a7, SYS_read
 3f0:	4895                	li	a7,5
 ecall
 3f2:	00000073          	ecall
 ret
 3f6:	8082                	ret

00000000000003f8 <write>:
.global write
write:
 li a7, SYS_write
 3f8:	48c1                	li	a7,16
 ecall
 3fa:	00000073          	ecall
 ret
 3fe:	8082                	ret

0000000000000400 <close>:
.global close
close:
 li a7, SYS_close
 400:	48d5                	li	a7,21
 ecall
 402:	00000073          	ecall
 ret
 406:	8082                	ret

0000000000000408 <kill>:
.global kill
kill:
 li a7, SYS_kill
 408:	4899                	li	a7,6
 ecall
 40a:	00000073          	ecall
 ret
 40e:	8082                	ret

0000000000000410 <exec>:
.global exec
exec:
 li a7, SYS_exec
 410:	489d                	li	a7,7
 ecall
 412:	00000073          	ecall
 ret
 416:	8082                	ret

0000000000000418 <open>:
.global open
open:
 li a7, SYS_open
 418:	48bd                	li	a7,15
 ecall
 41a:	00000073          	ecall
 ret
 41e:	8082                	ret

0000000000000420 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 420:	48c5                	li	a7,17
 ecall
 422:	00000073          	ecall
 ret
 426:	8082                	ret

0000000000000428 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 428:	48c9                	li	a7,18
 ecall
 42a:	00000073          	ecall
 ret
 42e:	8082                	ret

0000000000000430 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 430:	48a1                	li	a7,8
 ecall
 432:	00000073          	ecall
 ret
 436:	8082                	ret

0000000000000438 <link>:
.global link
link:
 li a7, SYS_link
 438:	48cd                	li	a7,19
 ecall
 43a:	00000073          	ecall
 ret
 43e:	8082                	ret

0000000000000440 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 440:	48d1                	li	a7,20
 ecall
 442:	00000073          	ecall
 ret
 446:	8082                	ret

0000000000000448 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 448:	48a5                	li	a7,9
 ecall
 44a:	00000073          	ecall
 ret
 44e:	8082                	ret

0000000000000450 <dup>:
.global dup
dup:
 li a7, SYS_dup
 450:	48a9                	li	a7,10
 ecall
 452:	00000073          	ecall
 ret
 456:	8082                	ret

0000000000000458 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 458:	48ad                	li	a7,11
 ecall
 45a:	00000073          	ecall
 ret
 45e:	8082                	ret

0000000000000460 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 460:	48b1                	li	a7,12
 ecall
 462:	00000073          	ecall
 ret
 466:	8082                	ret

0000000000000468 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 468:	48b5                	li	a7,13
 ecall
 46a:	00000073          	ecall
 ret
 46e:	8082                	ret

0000000000000470 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 470:	48b9                	li	a7,14
 ecall
 472:	00000073          	ecall
 ret
 476:	8082                	ret

0000000000000478 <debugswitch>:
.global debugswitch
debugswitch:
 li a7, SYS_debugswitch
 478:	48d9                	li	a7,22
 ecall
 47a:	00000073          	ecall
 ret
 47e:	8082                	ret

0000000000000480 <printfslab>:
.global printfslab
printfslab:
 li a7, SYS_printfslab
 480:	48dd                	li	a7,23
 ecall
 482:	00000073          	ecall
 ret
 486:	8082                	ret

0000000000000488 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 488:	1101                	addi	sp,sp,-32
 48a:	ec06                	sd	ra,24(sp)
 48c:	e822                	sd	s0,16(sp)
 48e:	1000                	addi	s0,sp,32
 490:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 494:	4605                	li	a2,1
 496:	fef40593          	addi	a1,s0,-17
 49a:	f5fff0ef          	jal	ra,3f8 <write>
}
 49e:	60e2                	ld	ra,24(sp)
 4a0:	6442                	ld	s0,16(sp)
 4a2:	6105                	addi	sp,sp,32
 4a4:	8082                	ret

00000000000004a6 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4a6:	7139                	addi	sp,sp,-64
 4a8:	fc06                	sd	ra,56(sp)
 4aa:	f822                	sd	s0,48(sp)
 4ac:	f426                	sd	s1,40(sp)
 4ae:	f04a                	sd	s2,32(sp)
 4b0:	ec4e                	sd	s3,24(sp)
 4b2:	0080                	addi	s0,sp,64
 4b4:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4b6:	c299                	beqz	a3,4bc <printint+0x16>
 4b8:	0805c663          	bltz	a1,544 <printint+0x9e>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4bc:	2581                	sext.w	a1,a1
  neg = 0;
 4be:	4881                	li	a7,0
 4c0:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 4c4:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 4c6:	2601                	sext.w	a2,a2
 4c8:	00000517          	auipc	a0,0x0
 4cc:	4e850513          	addi	a0,a0,1256 # 9b0 <digits>
 4d0:	883a                	mv	a6,a4
 4d2:	2705                	addiw	a4,a4,1
 4d4:	02c5f7bb          	remuw	a5,a1,a2
 4d8:	1782                	slli	a5,a5,0x20
 4da:	9381                	srli	a5,a5,0x20
 4dc:	97aa                	add	a5,a5,a0
 4de:	0007c783          	lbu	a5,0(a5)
 4e2:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 4e6:	0005879b          	sext.w	a5,a1
 4ea:	02c5d5bb          	divuw	a1,a1,a2
 4ee:	0685                	addi	a3,a3,1
 4f0:	fec7f0e3          	bgeu	a5,a2,4d0 <printint+0x2a>
  if(neg)
 4f4:	00088b63          	beqz	a7,50a <printint+0x64>
    buf[i++] = '-';
 4f8:	fd040793          	addi	a5,s0,-48
 4fc:	973e                	add	a4,a4,a5
 4fe:	02d00793          	li	a5,45
 502:	fef70823          	sb	a5,-16(a4)
 506:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 50a:	02e05663          	blez	a4,536 <printint+0x90>
 50e:	fc040793          	addi	a5,s0,-64
 512:	00e78933          	add	s2,a5,a4
 516:	fff78993          	addi	s3,a5,-1
 51a:	99ba                	add	s3,s3,a4
 51c:	377d                	addiw	a4,a4,-1
 51e:	1702                	slli	a4,a4,0x20
 520:	9301                	srli	a4,a4,0x20
 522:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 526:	fff94583          	lbu	a1,-1(s2)
 52a:	8526                	mv	a0,s1
 52c:	f5dff0ef          	jal	ra,488 <putc>
  while(--i >= 0)
 530:	197d                	addi	s2,s2,-1
 532:	ff391ae3          	bne	s2,s3,526 <printint+0x80>
}
 536:	70e2                	ld	ra,56(sp)
 538:	7442                	ld	s0,48(sp)
 53a:	74a2                	ld	s1,40(sp)
 53c:	7902                	ld	s2,32(sp)
 53e:	69e2                	ld	s3,24(sp)
 540:	6121                	addi	sp,sp,64
 542:	8082                	ret
    x = -xx;
 544:	40b005bb          	negw	a1,a1
    neg = 1;
 548:	4885                	li	a7,1
    x = -xx;
 54a:	bf9d                	j	4c0 <printint+0x1a>

000000000000054c <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 54c:	7119                	addi	sp,sp,-128
 54e:	fc86                	sd	ra,120(sp)
 550:	f8a2                	sd	s0,112(sp)
 552:	f4a6                	sd	s1,104(sp)
 554:	f0ca                	sd	s2,96(sp)
 556:	ecce                	sd	s3,88(sp)
 558:	e8d2                	sd	s4,80(sp)
 55a:	e4d6                	sd	s5,72(sp)
 55c:	e0da                	sd	s6,64(sp)
 55e:	fc5e                	sd	s7,56(sp)
 560:	f862                	sd	s8,48(sp)
 562:	f466                	sd	s9,40(sp)
 564:	f06a                	sd	s10,32(sp)
 566:	ec6e                	sd	s11,24(sp)
 568:	0100                	addi	s0,sp,128
  char *s;
  int c0, c1, c2, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 56a:	0005c903          	lbu	s2,0(a1)
 56e:	22090e63          	beqz	s2,7aa <vprintf+0x25e>
 572:	8b2a                	mv	s6,a0
 574:	8a2e                	mv	s4,a1
 576:	8bb2                	mv	s7,a2
  state = 0;
 578:	4981                	li	s3,0
  for(i = 0; fmt[i]; i++){
 57a:	4481                	li	s1,0
 57c:	4701                	li	a4,0
      if(c0 == '%'){
        state = '%';
      } else {
        putc(fd, c0);
      }
    } else if(state == '%'){
 57e:	02500a93          	li	s5,37
      c1 = c2 = 0;
      if(c0) c1 = fmt[i+1] & 0xff;
      if(c1) c2 = fmt[i+2] & 0xff;
      if(c0 == 'd'){
 582:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c0 == 'l' && c1 == 'd'){
 586:	06c00d13          	li	s10,108
        printint(fd, va_arg(ap, uint64), 10, 1);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
        printint(fd, va_arg(ap, uint64), 10, 1);
        i += 2;
      } else if(c0 == 'u'){
 58a:	07500d93          	li	s11,117
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 58e:	00000c97          	auipc	s9,0x0
 592:	422c8c93          	addi	s9,s9,1058 # 9b0 <digits>
 596:	a005                	j	5b6 <vprintf+0x6a>
        putc(fd, c0);
 598:	85ca                	mv	a1,s2
 59a:	855a                	mv	a0,s6
 59c:	eedff0ef          	jal	ra,488 <putc>
 5a0:	a019                	j	5a6 <vprintf+0x5a>
    } else if(state == '%'){
 5a2:	03598263          	beq	s3,s5,5c6 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 5a6:	2485                	addiw	s1,s1,1
 5a8:	8726                	mv	a4,s1
 5aa:	009a07b3          	add	a5,s4,s1
 5ae:	0007c903          	lbu	s2,0(a5)
 5b2:	1e090c63          	beqz	s2,7aa <vprintf+0x25e>
    c0 = fmt[i] & 0xff;
 5b6:	0009079b          	sext.w	a5,s2
    if(state == 0){
 5ba:	fe0994e3          	bnez	s3,5a2 <vprintf+0x56>
      if(c0 == '%'){
 5be:	fd579de3          	bne	a5,s5,598 <vprintf+0x4c>
        state = '%';
 5c2:	89be                	mv	s3,a5
 5c4:	b7cd                	j	5a6 <vprintf+0x5a>
      if(c0) c1 = fmt[i+1] & 0xff;
 5c6:	cfa5                	beqz	a5,63e <vprintf+0xf2>
 5c8:	00ea06b3          	add	a3,s4,a4
 5cc:	0016c683          	lbu	a3,1(a3)
      c1 = c2 = 0;
 5d0:	8636                	mv	a2,a3
      if(c1) c2 = fmt[i+2] & 0xff;
 5d2:	c681                	beqz	a3,5da <vprintf+0x8e>
 5d4:	9752                	add	a4,a4,s4
 5d6:	00274603          	lbu	a2,2(a4)
      if(c0 == 'd'){
 5da:	03878a63          	beq	a5,s8,60e <vprintf+0xc2>
      } else if(c0 == 'l' && c1 == 'd'){
 5de:	05a78463          	beq	a5,s10,626 <vprintf+0xda>
      } else if(c0 == 'u'){
 5e2:	0db78763          	beq	a5,s11,6b0 <vprintf+0x164>
        printint(fd, va_arg(ap, uint64), 10, 0);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
        printint(fd, va_arg(ap, uint64), 10, 0);
        i += 2;
      } else if(c0 == 'x'){
 5e6:	07800713          	li	a4,120
 5ea:	10e78963          	beq	a5,a4,6fc <vprintf+0x1b0>
        printint(fd, va_arg(ap, uint64), 16, 0);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'x'){
        printint(fd, va_arg(ap, uint64), 16, 0);
        i += 2;
      } else if(c0 == 'p'){
 5ee:	07000713          	li	a4,112
 5f2:	12e78e63          	beq	a5,a4,72e <vprintf+0x1e2>
        printptr(fd, va_arg(ap, uint64));
      } else if(c0 == 's'){
 5f6:	07300713          	li	a4,115
 5fa:	16e78b63          	beq	a5,a4,770 <vprintf+0x224>
        if((s = va_arg(ap, char*)) == 0)
          s = "(null)";
        for(; *s; s++)
          putc(fd, *s);
      } else if(c0 == '%'){
 5fe:	05579063          	bne	a5,s5,63e <vprintf+0xf2>
        putc(fd, '%');
 602:	85d6                	mv	a1,s5
 604:	855a                	mv	a0,s6
 606:	e83ff0ef          	jal	ra,488 <putc>
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
#endif
      state = 0;
 60a:	4981                	li	s3,0
 60c:	bf69                	j	5a6 <vprintf+0x5a>
        printint(fd, va_arg(ap, int), 10, 1);
 60e:	008b8913          	addi	s2,s7,8
 612:	4685                	li	a3,1
 614:	4629                	li	a2,10
 616:	000ba583          	lw	a1,0(s7)
 61a:	855a                	mv	a0,s6
 61c:	e8bff0ef          	jal	ra,4a6 <printint>
 620:	8bca                	mv	s7,s2
      state = 0;
 622:	4981                	li	s3,0
 624:	b749                	j	5a6 <vprintf+0x5a>
      } else if(c0 == 'l' && c1 == 'd'){
 626:	03868663          	beq	a3,s8,652 <vprintf+0x106>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
 62a:	05a68163          	beq	a3,s10,66c <vprintf+0x120>
      } else if(c0 == 'l' && c1 == 'u'){
 62e:	09b68d63          	beq	a3,s11,6c8 <vprintf+0x17c>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
 632:	03a68f63          	beq	a3,s10,670 <vprintf+0x124>
      } else if(c0 == 'l' && c1 == 'x'){
 636:	07800793          	li	a5,120
 63a:	0cf68d63          	beq	a3,a5,714 <vprintf+0x1c8>
        putc(fd, '%');
 63e:	85d6                	mv	a1,s5
 640:	855a                	mv	a0,s6
 642:	e47ff0ef          	jal	ra,488 <putc>
        putc(fd, c0);
 646:	85ca                	mv	a1,s2
 648:	855a                	mv	a0,s6
 64a:	e3fff0ef          	jal	ra,488 <putc>
      state = 0;
 64e:	4981                	li	s3,0
 650:	bf99                	j	5a6 <vprintf+0x5a>
        printint(fd, va_arg(ap, uint64), 10, 1);
 652:	008b8913          	addi	s2,s7,8
 656:	4685                	li	a3,1
 658:	4629                	li	a2,10
 65a:	000ba583          	lw	a1,0(s7)
 65e:	855a                	mv	a0,s6
 660:	e47ff0ef          	jal	ra,4a6 <printint>
        i += 1;
 664:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 10, 1);
 666:	8bca                	mv	s7,s2
      state = 0;
 668:	4981                	li	s3,0
        i += 1;
 66a:	bf35                	j	5a6 <vprintf+0x5a>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
 66c:	03860563          	beq	a2,s8,696 <vprintf+0x14a>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
 670:	07b60963          	beq	a2,s11,6e2 <vprintf+0x196>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'x'){
 674:	07800793          	li	a5,120
 678:	fcf613e3          	bne	a2,a5,63e <vprintf+0xf2>
        printint(fd, va_arg(ap, uint64), 16, 0);
 67c:	008b8913          	addi	s2,s7,8
 680:	4681                	li	a3,0
 682:	4641                	li	a2,16
 684:	000ba583          	lw	a1,0(s7)
 688:	855a                	mv	a0,s6
 68a:	e1dff0ef          	jal	ra,4a6 <printint>
        i += 2;
 68e:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 16, 0);
 690:	8bca                	mv	s7,s2
      state = 0;
 692:	4981                	li	s3,0
        i += 2;
 694:	bf09                	j	5a6 <vprintf+0x5a>
        printint(fd, va_arg(ap, uint64), 10, 1);
 696:	008b8913          	addi	s2,s7,8
 69a:	4685                	li	a3,1
 69c:	4629                	li	a2,10
 69e:	000ba583          	lw	a1,0(s7)
 6a2:	855a                	mv	a0,s6
 6a4:	e03ff0ef          	jal	ra,4a6 <printint>
        i += 2;
 6a8:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 10, 1);
 6aa:	8bca                	mv	s7,s2
      state = 0;
 6ac:	4981                	li	s3,0
        i += 2;
 6ae:	bde5                	j	5a6 <vprintf+0x5a>
        printint(fd, va_arg(ap, int), 10, 0);
 6b0:	008b8913          	addi	s2,s7,8
 6b4:	4681                	li	a3,0
 6b6:	4629                	li	a2,10
 6b8:	000ba583          	lw	a1,0(s7)
 6bc:	855a                	mv	a0,s6
 6be:	de9ff0ef          	jal	ra,4a6 <printint>
 6c2:	8bca                	mv	s7,s2
      state = 0;
 6c4:	4981                	li	s3,0
 6c6:	b5c5                	j	5a6 <vprintf+0x5a>
        printint(fd, va_arg(ap, uint64), 10, 0);
 6c8:	008b8913          	addi	s2,s7,8
 6cc:	4681                	li	a3,0
 6ce:	4629                	li	a2,10
 6d0:	000ba583          	lw	a1,0(s7)
 6d4:	855a                	mv	a0,s6
 6d6:	dd1ff0ef          	jal	ra,4a6 <printint>
        i += 1;
 6da:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 10, 0);
 6dc:	8bca                	mv	s7,s2
      state = 0;
 6de:	4981                	li	s3,0
        i += 1;
 6e0:	b5d9                	j	5a6 <vprintf+0x5a>
        printint(fd, va_arg(ap, uint64), 10, 0);
 6e2:	008b8913          	addi	s2,s7,8
 6e6:	4681                	li	a3,0
 6e8:	4629                	li	a2,10
 6ea:	000ba583          	lw	a1,0(s7)
 6ee:	855a                	mv	a0,s6
 6f0:	db7ff0ef          	jal	ra,4a6 <printint>
        i += 2;
 6f4:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 10, 0);
 6f6:	8bca                	mv	s7,s2
      state = 0;
 6f8:	4981                	li	s3,0
        i += 2;
 6fa:	b575                	j	5a6 <vprintf+0x5a>
        printint(fd, va_arg(ap, int), 16, 0);
 6fc:	008b8913          	addi	s2,s7,8
 700:	4681                	li	a3,0
 702:	4641                	li	a2,16
 704:	000ba583          	lw	a1,0(s7)
 708:	855a                	mv	a0,s6
 70a:	d9dff0ef          	jal	ra,4a6 <printint>
 70e:	8bca                	mv	s7,s2
      state = 0;
 710:	4981                	li	s3,0
 712:	bd51                	j	5a6 <vprintf+0x5a>
        printint(fd, va_arg(ap, uint64), 16, 0);
 714:	008b8913          	addi	s2,s7,8
 718:	4681                	li	a3,0
 71a:	4641                	li	a2,16
 71c:	000ba583          	lw	a1,0(s7)
 720:	855a                	mv	a0,s6
 722:	d85ff0ef          	jal	ra,4a6 <printint>
        i += 1;
 726:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 16, 0);
 728:	8bca                	mv	s7,s2
      state = 0;
 72a:	4981                	li	s3,0
        i += 1;
 72c:	bdad                	j	5a6 <vprintf+0x5a>
        printptr(fd, va_arg(ap, uint64));
 72e:	008b8793          	addi	a5,s7,8
 732:	f8f43423          	sd	a5,-120(s0)
 736:	000bb983          	ld	s3,0(s7)
  putc(fd, '0');
 73a:	03000593          	li	a1,48
 73e:	855a                	mv	a0,s6
 740:	d49ff0ef          	jal	ra,488 <putc>
  putc(fd, 'x');
 744:	07800593          	li	a1,120
 748:	855a                	mv	a0,s6
 74a:	d3fff0ef          	jal	ra,488 <putc>
 74e:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 750:	03c9d793          	srli	a5,s3,0x3c
 754:	97e6                	add	a5,a5,s9
 756:	0007c583          	lbu	a1,0(a5)
 75a:	855a                	mv	a0,s6
 75c:	d2dff0ef          	jal	ra,488 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 760:	0992                	slli	s3,s3,0x4
 762:	397d                	addiw	s2,s2,-1
 764:	fe0916e3          	bnez	s2,750 <vprintf+0x204>
        printptr(fd, va_arg(ap, uint64));
 768:	f8843b83          	ld	s7,-120(s0)
      state = 0;
 76c:	4981                	li	s3,0
 76e:	bd25                	j	5a6 <vprintf+0x5a>
        if((s = va_arg(ap, char*)) == 0)
 770:	008b8993          	addi	s3,s7,8
 774:	000bb903          	ld	s2,0(s7)
 778:	00090f63          	beqz	s2,796 <vprintf+0x24a>
        for(; *s; s++)
 77c:	00094583          	lbu	a1,0(s2)
 780:	c195                	beqz	a1,7a4 <vprintf+0x258>
          putc(fd, *s);
 782:	855a                	mv	a0,s6
 784:	d05ff0ef          	jal	ra,488 <putc>
        for(; *s; s++)
 788:	0905                	addi	s2,s2,1
 78a:	00094583          	lbu	a1,0(s2)
 78e:	f9f5                	bnez	a1,782 <vprintf+0x236>
        if((s = va_arg(ap, char*)) == 0)
 790:	8bce                	mv	s7,s3
      state = 0;
 792:	4981                	li	s3,0
 794:	bd09                	j	5a6 <vprintf+0x5a>
          s = "(null)";
 796:	00000917          	auipc	s2,0x0
 79a:	21290913          	addi	s2,s2,530 # 9a8 <malloc+0xfc>
        for(; *s; s++)
 79e:	02800593          	li	a1,40
 7a2:	b7c5                	j	782 <vprintf+0x236>
        if((s = va_arg(ap, char*)) == 0)
 7a4:	8bce                	mv	s7,s3
      state = 0;
 7a6:	4981                	li	s3,0
 7a8:	bbfd                	j	5a6 <vprintf+0x5a>
    }
  }
}
 7aa:	70e6                	ld	ra,120(sp)
 7ac:	7446                	ld	s0,112(sp)
 7ae:	74a6                	ld	s1,104(sp)
 7b0:	7906                	ld	s2,96(sp)
 7b2:	69e6                	ld	s3,88(sp)
 7b4:	6a46                	ld	s4,80(sp)
 7b6:	6aa6                	ld	s5,72(sp)
 7b8:	6b06                	ld	s6,64(sp)
 7ba:	7be2                	ld	s7,56(sp)
 7bc:	7c42                	ld	s8,48(sp)
 7be:	7ca2                	ld	s9,40(sp)
 7c0:	7d02                	ld	s10,32(sp)
 7c2:	6de2                	ld	s11,24(sp)
 7c4:	6109                	addi	sp,sp,128
 7c6:	8082                	ret

00000000000007c8 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 7c8:	715d                	addi	sp,sp,-80
 7ca:	ec06                	sd	ra,24(sp)
 7cc:	e822                	sd	s0,16(sp)
 7ce:	1000                	addi	s0,sp,32
 7d0:	e010                	sd	a2,0(s0)
 7d2:	e414                	sd	a3,8(s0)
 7d4:	e818                	sd	a4,16(s0)
 7d6:	ec1c                	sd	a5,24(s0)
 7d8:	03043023          	sd	a6,32(s0)
 7dc:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 7e0:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 7e4:	8622                	mv	a2,s0
 7e6:	d67ff0ef          	jal	ra,54c <vprintf>
}
 7ea:	60e2                	ld	ra,24(sp)
 7ec:	6442                	ld	s0,16(sp)
 7ee:	6161                	addi	sp,sp,80
 7f0:	8082                	ret

00000000000007f2 <printf>:

void
printf(const char *fmt, ...)
{
 7f2:	711d                	addi	sp,sp,-96
 7f4:	ec06                	sd	ra,24(sp)
 7f6:	e822                	sd	s0,16(sp)
 7f8:	1000                	addi	s0,sp,32
 7fa:	e40c                	sd	a1,8(s0)
 7fc:	e810                	sd	a2,16(s0)
 7fe:	ec14                	sd	a3,24(s0)
 800:	f018                	sd	a4,32(s0)
 802:	f41c                	sd	a5,40(s0)
 804:	03043823          	sd	a6,48(s0)
 808:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 80c:	00840613          	addi	a2,s0,8
 810:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 814:	85aa                	mv	a1,a0
 816:	4505                	li	a0,1
 818:	d35ff0ef          	jal	ra,54c <vprintf>
}
 81c:	60e2                	ld	ra,24(sp)
 81e:	6442                	ld	s0,16(sp)
 820:	6125                	addi	sp,sp,96
 822:	8082                	ret

0000000000000824 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 824:	1141                	addi	sp,sp,-16
 826:	e422                	sd	s0,8(sp)
 828:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 82a:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 82e:	00000797          	auipc	a5,0x0
 832:	7d27b783          	ld	a5,2002(a5) # 1000 <freep>
 836:	a805                	j	866 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 838:	4618                	lw	a4,8(a2)
 83a:	9db9                	addw	a1,a1,a4
 83c:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 840:	6398                	ld	a4,0(a5)
 842:	6318                	ld	a4,0(a4)
 844:	fee53823          	sd	a4,-16(a0)
 848:	a091                	j	88c <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 84a:	ff852703          	lw	a4,-8(a0)
 84e:	9e39                	addw	a2,a2,a4
 850:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 852:	ff053703          	ld	a4,-16(a0)
 856:	e398                	sd	a4,0(a5)
 858:	a099                	j	89e <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 85a:	6398                	ld	a4,0(a5)
 85c:	00e7e463          	bltu	a5,a4,864 <free+0x40>
 860:	00e6ea63          	bltu	a3,a4,874 <free+0x50>
{
 864:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 866:	fed7fae3          	bgeu	a5,a3,85a <free+0x36>
 86a:	6398                	ld	a4,0(a5)
 86c:	00e6e463          	bltu	a3,a4,874 <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 870:	fee7eae3          	bltu	a5,a4,864 <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 874:	ff852583          	lw	a1,-8(a0)
 878:	6390                	ld	a2,0(a5)
 87a:	02059713          	slli	a4,a1,0x20
 87e:	9301                	srli	a4,a4,0x20
 880:	0712                	slli	a4,a4,0x4
 882:	9736                	add	a4,a4,a3
 884:	fae60ae3          	beq	a2,a4,838 <free+0x14>
    bp->s.ptr = p->s.ptr;
 888:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 88c:	4790                	lw	a2,8(a5)
 88e:	02061713          	slli	a4,a2,0x20
 892:	9301                	srli	a4,a4,0x20
 894:	0712                	slli	a4,a4,0x4
 896:	973e                	add	a4,a4,a5
 898:	fae689e3          	beq	a3,a4,84a <free+0x26>
  } else
    p->s.ptr = bp;
 89c:	e394                	sd	a3,0(a5)
  freep = p;
 89e:	00000717          	auipc	a4,0x0
 8a2:	76f73123          	sd	a5,1890(a4) # 1000 <freep>
}
 8a6:	6422                	ld	s0,8(sp)
 8a8:	0141                	addi	sp,sp,16
 8aa:	8082                	ret

00000000000008ac <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8ac:	7139                	addi	sp,sp,-64
 8ae:	fc06                	sd	ra,56(sp)
 8b0:	f822                	sd	s0,48(sp)
 8b2:	f426                	sd	s1,40(sp)
 8b4:	f04a                	sd	s2,32(sp)
 8b6:	ec4e                	sd	s3,24(sp)
 8b8:	e852                	sd	s4,16(sp)
 8ba:	e456                	sd	s5,8(sp)
 8bc:	e05a                	sd	s6,0(sp)
 8be:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8c0:	02051493          	slli	s1,a0,0x20
 8c4:	9081                	srli	s1,s1,0x20
 8c6:	04bd                	addi	s1,s1,15
 8c8:	8091                	srli	s1,s1,0x4
 8ca:	0014899b          	addiw	s3,s1,1
 8ce:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 8d0:	00000517          	auipc	a0,0x0
 8d4:	73053503          	ld	a0,1840(a0) # 1000 <freep>
 8d8:	c515                	beqz	a0,904 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8da:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 8dc:	4798                	lw	a4,8(a5)
 8de:	02977f63          	bgeu	a4,s1,91c <malloc+0x70>
 8e2:	8a4e                	mv	s4,s3
 8e4:	0009871b          	sext.w	a4,s3
 8e8:	6685                	lui	a3,0x1
 8ea:	00d77363          	bgeu	a4,a3,8f0 <malloc+0x44>
 8ee:	6a05                	lui	s4,0x1
 8f0:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 8f4:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8f8:	00000917          	auipc	s2,0x0
 8fc:	70890913          	addi	s2,s2,1800 # 1000 <freep>
  if(p == (char*)-1)
 900:	5afd                	li	s5,-1
 902:	a0bd                	j	970 <malloc+0xc4>
    base.s.ptr = freep = prevp = &base;
 904:	00000797          	auipc	a5,0x0
 908:	70c78793          	addi	a5,a5,1804 # 1010 <base>
 90c:	00000717          	auipc	a4,0x0
 910:	6ef73a23          	sd	a5,1780(a4) # 1000 <freep>
 914:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 916:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 91a:	b7e1                	j	8e2 <malloc+0x36>
      if(p->s.size == nunits)
 91c:	02e48b63          	beq	s1,a4,952 <malloc+0xa6>
        p->s.size -= nunits;
 920:	4137073b          	subw	a4,a4,s3
 924:	c798                	sw	a4,8(a5)
        p += p->s.size;
 926:	1702                	slli	a4,a4,0x20
 928:	9301                	srli	a4,a4,0x20
 92a:	0712                	slli	a4,a4,0x4
 92c:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 92e:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 932:	00000717          	auipc	a4,0x0
 936:	6ca73723          	sd	a0,1742(a4) # 1000 <freep>
      return (void*)(p + 1);
 93a:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 93e:	70e2                	ld	ra,56(sp)
 940:	7442                	ld	s0,48(sp)
 942:	74a2                	ld	s1,40(sp)
 944:	7902                	ld	s2,32(sp)
 946:	69e2                	ld	s3,24(sp)
 948:	6a42                	ld	s4,16(sp)
 94a:	6aa2                	ld	s5,8(sp)
 94c:	6b02                	ld	s6,0(sp)
 94e:	6121                	addi	sp,sp,64
 950:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 952:	6398                	ld	a4,0(a5)
 954:	e118                	sd	a4,0(a0)
 956:	bff1                	j	932 <malloc+0x86>
  hp->s.size = nu;
 958:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 95c:	0541                	addi	a0,a0,16
 95e:	ec7ff0ef          	jal	ra,824 <free>
  return freep;
 962:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 966:	dd61                	beqz	a0,93e <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 968:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 96a:	4798                	lw	a4,8(a5)
 96c:	fa9778e3          	bgeu	a4,s1,91c <malloc+0x70>
    if(p == freep)
 970:	00093703          	ld	a4,0(s2)
 974:	853e                	mv	a0,a5
 976:	fef719e3          	bne	a4,a5,968 <malloc+0xbc>
  p = sbrk(nu * sizeof(Header));
 97a:	8552                	mv	a0,s4
 97c:	ae5ff0ef          	jal	ra,460 <sbrk>
  if(p == (char*)-1)
 980:	fd551ce3          	bne	a0,s5,958 <malloc+0xac>
        return 0;
 984:	4501                	li	a0,0
 986:	bf65                	j	93e <malloc+0x92>
