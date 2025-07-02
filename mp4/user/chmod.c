#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "kernel/fs.h"    
#include "kernel/fcntl.h"

#define MAXPATH 128

static void
chmod_recurse(char *path, int recursive, int add, int mask)
{
    struct stat st;
    int fd;

    if ((fd = open(path, O_NOACCESS)) < 0) {
        fprintf(2, "chmod: cannot chmod %s\n", path);
        return;
    }
    if (fstat(fd, &st) < 0) {
        close(fd);
        fprintf(2, "chmod: cannot chmod %s\n", path);
        return;
    }
    close(fd);

    if (st.type == T_SYMLINK){
        if ((fd = open(path, O_FOLLOW)) < 0) {
            fprintf(2, "chmod: cannot chmod %s\n", path);
            return;
        }
        if (fstat(fd, &st) < 0) {
            close(fd);
            fprintf(2, "chmod: cannot chmod %s\n", path);
            return;
        }
        close(fd);
    }

    // pre-order
    if (!(recursive && !add && (mask & M_READ) && st.type == T_DIR)) {
        if (chmod(path, add, mask) < 0) {
            fprintf(2, "chmod: cannot chmod %s\n", path);
            return;
        }
    }

    if ((fd = open(path, O_NOACCESS)) < 0) {
        fprintf(2, "chmod: cannot chmod %s\n", path);
        return;
    }
    if (fstat(fd, &st) < 0) {
        close(fd);
        fprintf(2, "chmod: cannot chmod %s\n", path);
        return;
    }
    close(fd);

    if (st.type == T_SYMLINK){
        if ((fd = open(path, O_FOLLOW)) < 0) {
            fprintf(2, "chmod: cannot chmod %s\n", path);
            return;
        }
        if (fstat(fd, &st) < 0) {
            close(fd);
            fprintf(2, "chmod: cannot chmod %s\n", path);
            return;
        }
        close(fd);
    }

    // recurse
    if (recursive && st.type == T_DIR) {
        // check read bit
        if (!(st.mode & M_READ)) {
            fprintf(2, "chmod: cannot chmod %s\n", path);
        } else {
            // read entries
            char buf[DIRSIZ+1], child[MAXPATH];
            struct dirent de;
            int dfd;

            if ((dfd = open(path, 0)) < 0) {
                fprintf(2, "chmod: cannot chmod %s\n", path);
                return;
            }
            while (read(dfd, &de, sizeof(de)) == sizeof(de)) {
                if (de.inum == 0)
                    continue;
                // skip "." and ".."
                memmove(buf, de.name, DIRSIZ);
                buf[DIRSIZ] = '\0';
                if (strcmp(buf, ".")==0 || strcmp(buf, "..")==0)
                    continue;
                // build child path
                strcpy(child, path);
                char *p = child + strlen(child);
                *p = '/';
                p++;
                strcpy(p, buf);        
                chmod_recurse(child, recursive, add, mask);
            }
            close(dfd);
        }
    }

    //post-order
    if (recursive && !add && (mask & M_READ) && st.type == T_DIR) {
        if (chmod(path, add, mask) < 0)
            fprintf(2, "chmod: cannot chmod %s\n", path);
    }
}

int
main(int argc, char *argv[])
{
    int recursive = 0, add, mask = 0;
    char *perm;
    int firstArg = 1;

    if (argc < 3 || argc > 4) {
        fprintf(2, "Usage: chmod [-R] (+|-)(r|w|rw|wr) file_name|dir_name\n");
        exit(1);
    }
    if (argc == 4) {
        if (strcmp(argv[1], "-R") != 0) {
            fprintf(2, "Usage: chmod [-R] (+|-)(r|w|rw|wr) file_name|dir_name\n");
            exit(1);
        }
        recursive = 1;
        firstArg = 2;
    }
    perm = argv[firstArg];
    if (perm[0] != '+' && perm[0] != '-') {
        fprintf(2, "Usage: chmod [-R] (+|-)(r|w|rw|wr) file_name|dir_name\n");
        exit(1);
    }
    add = (perm[0] == '+');

    for (int i = 1; perm[i]; i++) {
        if (perm[i] == 'r') 
            mask |= M_READ;
        else if (perm[i] == 'w') 
            mask |= M_WRITE;
        else {
            fprintf(2, "Usage: chmod [-R] (+|-)(r|w|rw|wr) file_name|dir_name\n");
            exit(1);
        }
    }
    if (mask == 0) {
        fprintf(2, "Usage: chmod [-R] (+|-)(r|w|rw|wr) file_name|dir_name\n");
        exit(1);
    }

    chmod_recurse(argv[firstArg + 1], recursive, add, mask);
    exit(0);
    
}
