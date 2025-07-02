#include "kernel/types.h"
#include "user/user.h"
#include "user/threads.h"

#define ERROR_EXIT(msg) \
    do {                \
        printf(#msg);   \
        printf("\n");   \
        exit(1);        \
    } while (0)

static char buf[5]; // MAX 9999

void f(void *arg)
{
    int id = (int)(uint64)arg;
    printf("thread #%d is running\n", id);
    while (1) {}
}

void hrrn_setup(int tnum)
{
    int burst_time, arrival_time;
    struct thread *t;

    for (int i = 0; i < tnum; ++i) {
        printf("\nThe %d thread\n", i+1);
        printf("burst time [1-64]: ");
        gets(buf, 5);
        burst_time = atoi(buf);
        printf("\n");
        if (burst_time <= 0 || burst_time > 64)
            ERROR_EXIT(wrong burst time);

        printf("arrival time [0-100]: ");
        gets(buf, 5);
        arrival_time = atoi(buf);
        printf("\n");
        if (arrival_time < 0 || arrival_time > 100)
            ERROR_EXIT(wrong arrival time);

        t = thread_create(f, (void *)((uint64) (i+1)), 0, burst_time, -1, 1);
        thread_add_at(t, arrival_time);
    }
}

void prr_setup(int tnum)
{
    int burst_time, priority;
    struct thread *t;

    for (int i = 0; i < tnum; ++i) {
        printf("\nThe %d thread\n", i+1);
        printf("burst time [1-64]: ");
        gets(buf, 5);
        burst_time = atoi(buf);
        printf("\n");
        if (burst_time <= 0 || burst_time > 64)
            ERROR_EXIT(wrong burst time);

        printf("priority [0-4]: ");
        gets(buf, 5);
        priority = atoi(buf);
        printf("\n");
        if (priority < 0 || priority > 4)
            ERROR_EXIT(wrong priority value);

        t = thread_create(f, (void *)((uint64) (i+1)), 0, burst_time, -1, 1);
        thread_set_priority(t, priority);
        thread_add_at(t, 0);
    }
}

void dm_setup(int tnum)
{
    int burst_time, period, repeat_times, arrival_time;
    struct thread *t;

    for (int i = 0; i < tnum; ++i) {
        printf("\nThe %d thread\n", i+1);
        printf("period [1-100]: ");
        gets(buf, 5);
        period = atoi(buf);
        printf("\n");
        if (prr_setup <= 0 || period > 100)
            ERROR_EXIT(wrong period);

        printf("burst time [1-%d]: ", period);
        gets(buf, 5);
        burst_time = atoi(buf);
        printf("\n");
        if (burst_time <= 0 || burst_time > period)
            ERROR_EXIT(wrong burst time);

        printf("n [1-10]: ");
        gets(buf, 5);
        repeat_times = atoi(buf);
        printf("\n");
        if (repeat_times <= 0 || repeat_times > 10)
            ERROR_EXIT(wrong n);
        
        printf("arrival time [0-100]: ");
        gets(buf, 5);
        arrival_time = atoi(buf);
        printf("\n");
        if (arrival_time < 0 || arrival_time > 100)
            ERROR_EXIT(wrong arrival time);

        t = thread_create(f, (void *)((uint64) (i+1)), 1, burst_time, period, repeat_times);
        thread_add_at(t, arrival_time);
    }
}

void edf_cbs_setup(int tnum)
{
    int burst_time, period, repeat_times, arrival_time;
    int budget, is_hard, turn_soft = 0;
    struct thread *t;
    if (tnum > 5) {
        printf("According to spec, the thread num is at most 5\n");
        printf("Now, the thread num is %d\n", tnum);
    }
    for (int i = 0; i < tnum; ++i) {
        printf("\nThe %d thread\n", i+1);
        if (turn_soft) {
            printf("According to spec, this thread shoud be soft rt\n");
        }
        printf("hard real time [0/1]: ");
        gets(buf, 5);
        is_hard = atoi(buf);
        printf("\n");
        if (is_hard != 0 && is_hard != 1)
            ERROR_EXIT(wrong RT type);
        if (!turn_soft && !is_hard)
            turn_soft = 1;

        printf("period [1-100]: ");
        gets(buf, 5);
        period = atoi(buf);
        printf("\n");
        if (prr_setup <= 0 || period > 100)
            ERROR_EXIT(wrong period);

        printf("burst time [1-%d]: ", period);
        gets(buf, 5);
        burst_time = atoi(buf);
        printf("\n");
        if (burst_time <= 0 || burst_time > period)
            ERROR_EXIT(wrong burst time);
    
        printf("cbs budget [%d-9999]: ", burst_time/2 + 1);
        gets(buf, 5);
        budget = atoi(buf);
        printf("\n");
        if (2 * budget <= burst_time)
            ERROR_EXIT(wrong cbs budget);

        printf("n [1-5]: ");
        gets(buf, 5);
        repeat_times = atoi(buf);
        printf("\n");
        if (repeat_times <= 0 || repeat_times > 5)
            ERROR_EXIT(wrong n);
        
        printf("arrival time [0-100]: ");
        gets(buf, 5);
        arrival_time = atoi(buf);
        printf("\n");
        if (arrival_time < 0 || arrival_time > 100)
            ERROR_EXIT(wrong arrival time);

        t = thread_create(f, (void *)((uint64) (i+1)), 1, burst_time, period, repeat_times);
        init_thread_cbs(t, budget, is_hard);
        thread_add_at(t, arrival_time);
    }
}


int main(int argc, char **argv)
{
    printf("The scheduler selected in the thread lib\n");
    printf("0:HRRN, 1:PRR, 2:DM, 3:EDF-CBS: ");
    gets(buf, 5);
    int sched_type = atoi(buf);
    printf("\n");

    if (sched_type >= 4) 
        ERROR_EXIT(scheduling type error);
    
    printf("Note that MAX_THRD_NUM in kernel/proc.h is 16\n");
    printf("# of threads [1-(15)-9999]: ");
    gets(buf, 5);
    int thread_num = atoi(buf);
    printf("\n");

    if (thread_num < 1)
        ERROR_EXIT(thread number error);

    switch (sched_type)
    {
    case 0:
        hrrn_setup(thread_num);
        break;
    case 1:
        prr_setup(thread_num);
        break;
    case 2:
        dm_setup(thread_num);
        break;
    case 3:
        edf_cbs_setup(thread_num);
        break;
    default:
        break;
    }

    thread_start_threading();
    printf("\nexited\n");
    exit(0);
}
