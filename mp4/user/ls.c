#include "kernel/types.h"
#include "kernel/stat.h"
#include "kernel/fcntl.h"
#include "user/user.h"
#include "kernel/fs.h"

char *fmtname(char *path)
{
    static char buf[DIRSIZ + 1];
    char *p;

    // Find first character after last slash.
    for (p = path + strlen(path); p >= path && *p != '/'; p--)
        ;
    p++;

    // Return blank-padded name.
    if (strlen(p) >= DIRSIZ)
        return p;
    memmove(buf, p, strlen(p));
    memset(buf + strlen(p), ' ', DIRSIZ - strlen(p));
    return buf;
}

/* TODO: Access Control & Symbolic Link */
void ls(char *path)
{
    char buf[512], *p;
    int fd;
    struct dirent de;
    struct stat st, tst;

    if ((fd = open(path, O_NOACCESS)) < 0)
    {
        fprintf(2, "ls: cannot open %s\n", path);
        return;
    }

    if (fstat(fd, &st) < 0)
    {
        fprintf(2, "ls: cannot stat %s\n", path);
        close(fd);
        return;
    }
    close(fd);

    // char linkbuf[512];
    char md[4] = {0};

    switch (st.type)
    {
    case T_SYMLINK:
        fd = open(path, O_FOLLOW); 
        
        if (fd < 0) {
            fprintf(2, "ls: cannot open %s\n", path);
            return;
        }
        if (fstat(fd, &tst) < 0){
            fprintf(2, "ls: cannot stat %s\n", path);
            close(fd);
            return;
        }
        close(fd);
        

        /*
        int n = read(fd, linkbuf, sizeof(linkbuf)-1);
        linkbuf[n] = '\0';
        close(fd);

        while(1){
            int lfd = open(linkbuf, O_NOACCESS);
            if (lfd < 0) {
                fprintf(2, "ls: cannot open %s\n", path);
                return;
            }
            if (fstat(lfd, &tstat) < 0){
                fprintf(2, "ls: cannot stat %s\n", path);
                close(lfd);
                return;
            }
            close(lfd);
            if (tstat.type != T_SYMLINK)
                break;
            lfd = open(linkbuf, O_RDONLY);
            n = read(lfd, linkbuf, sizeof(linkbuf)-1);
            close(lfd);
        }
        */

        if (tst.type == T_FILE){
            if (st.mode == M_ALL)
                strcpy(md, "rw");
            else if (st.mode == M_READ)
                strcpy(md, "r-");
            else if (st.mode == M_WRITE)
                strcpy(md, "-w");
            else 
                strcpy(md, "--");
            printf("%s %d %d %d %s\n", fmtname(path), st.type, st.ino, st.size, md);
            break;
        }
        else if (tst.type == T_DIR){
            /*
            int dfd = open(linkbuf, O_RDONLY);
            if (dfd < 0) {
                fprintf(2, "ls: cannot open %s\n", path);
                return;
            }
            */
            fd = open(path, O_RDONLY); 
            if (fd < 0) {
                fprintf(2, "ls: cannot open %s\n", path);
                return;
            }

            if (strlen(path) + 1 + DIRSIZ + 1 > sizeof buf)
            {
                printf("ls: path too long\n");
                break;
            }
            strcpy(buf, path);
            p = buf + strlen(buf);
            *p++ = '/';
            
            while (read(fd, &de, sizeof(de)) == sizeof(de))
            {
                if (de.inum == 0)
                    continue;
                memmove(p, de.name, DIRSIZ);
                p[DIRSIZ] = 0;
                if (stat(buf, &st) < 0)
                {
                    printf("ls: cannot stat %s\n", buf);
                    continue;
                }
                if (st.mode == M_ALL)
                    strcpy(md, "rw");
                else if (st.mode == M_READ)
                    strcpy(md, "r-");
                else if (st.mode == M_WRITE)
                    strcpy(md, "-w");
                else 
                    strcpy(md, "--");
                printf("%s %d %d %d %s\n", fmtname(buf), st.type, st.ino, st.size, md);
            }
            close(fd);
            break;
        }


    case T_FILE:
        if (st.mode == M_ALL)
            strcpy(md, "rw");
        else if (st.mode == M_READ)
            strcpy(md, "r-");
        else if (st.mode == M_WRITE)
            strcpy(md, "-w");
        else 
            strcpy(md, "--");
        printf("%s %d %d %d %s\n", fmtname(path), st.type, st.ino, st.size, md);
        break;

    case T_DIR:
        fd = open(path, O_RDONLY);
        if (fd < 0) {
            fprintf(2, "ls: cannot open %s\n", path);
            return;
        }

        if (strlen(path) + 1 + DIRSIZ + 1 > sizeof buf)
        {
            printf("ls: path too long\n");
            break;
        }
        strcpy(buf, path);
        p = buf + strlen(buf);
        *p++ = '/';
        while (read(fd, &de, sizeof(de)) == sizeof(de))
        {
            if (de.inum == 0)
                continue;
            memmove(p, de.name, DIRSIZ);
            p[DIRSIZ] = 0;
            if (stat(buf, &st) < 0)
            {
                printf("ls: cannot stat %s\n", buf);
                continue;
            }
            if (st.mode == M_ALL)
                strcpy(md, "rw");
            else if (st.mode == M_READ)
                strcpy(md, "r-");
            else if (st.mode == M_WRITE)
                strcpy(md, "-w");
            else 
                strcpy(md, "--");
            printf("%s %d %d %d %s\n", fmtname(buf), st.type, st.ino, st.size, md);
        }
        break;
    }

    close(fd);
}

int main(int argc, char *argv[])
{
    int i;

    if (argc < 2)
    {
        ls(".");
        exit(0);
    }
    for (i = 1; i < argc; i++)
        ls(argv[i]);
    exit(0);
}
