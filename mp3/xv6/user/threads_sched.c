#include "kernel/types.h"
#include "user/user.h"
#include "user/list.h"
#include "user/threads.h"
#include "user/threads_sched.h"
#include <limits.h>
#define NULL 0

/* default scheduling algorithm */
#ifdef THREAD_SCHEDULER_DEFAULT
struct threads_sched_result schedule_default(struct threads_sched_args args)
{
    struct thread *thread_with_smallest_id = NULL;
    struct thread *th = NULL;
    list_for_each_entry(th, args.run_queue, thread_list) {
        if (thread_with_smallest_id == NULL || th->ID < thread_with_smallest_id->ID)
            thread_with_smallest_id = th;
    }

    struct threads_sched_result r;
    if (thread_with_smallest_id != NULL) {
        r.scheduled_thread_list_member = &thread_with_smallest_id->thread_list;
        r.allocated_time = thread_with_smallest_id->remaining_time;
    } else {
        r.scheduled_thread_list_member = args.run_queue;
        r.allocated_time = 1;
    }

    return r;
}
#endif

/* MP3 Part 1 - Non-Real-Time Scheduling */

// HRRN
#ifdef THREAD_SCHEDULER_HRRN
struct threads_sched_result schedule_hrrn(struct threads_sched_args args)
{
    struct threads_sched_result r;
    // TO DO
    struct thread *thread_hrrn = NULL;
    struct thread *th = NULL;
    list_for_each_entry(th, args.run_queue, thread_list){
        if (thread_hrrn == NULL)
            thread_hrrn = th;
        else {
            int waiting_time_th = args.current_time - th -> arrival_time;
            int waiting_time_hrrn = args.current_time - thread_hrrn -> arrival_time;
            int th_rate = (waiting_time_th + th -> processing_time) * thread_hrrn -> processing_time;
            int hrrn_rate = (waiting_time_hrrn + thread_hrrn -> processing_time) * th -> processing_time;
            if (th_rate > hrrn_rate || (th_rate == hrrn_rate && th -> ID < thread_hrrn -> ID))
                thread_hrrn = th;
        }
    }

    if (thread_hrrn != NULL) {
        r.scheduled_thread_list_member = &thread_hrrn -> thread_list;
        r.allocated_time = thread_hrrn -> processing_time;
    } 
    else {
        r.scheduled_thread_list_member = args.run_queue;
        int next_stop = INT_MAX;
        struct release_queue_entry *entry = NULL;
        list_for_each_entry(entry, args.release_queue, thread_list){
            int next_th = entry -> release_time - args.current_time;
            if (next_th < next_stop)
                next_stop = next_th;
        }
        r.allocated_time = (next_stop == INT_MAX)?1:next_stop;
    }
    return r;
}
#endif

#ifdef THREAD_SCHEDULER_PRIORITY_RR
// priority Round-Robin(RR)
struct threads_sched_result schedule_priority_rr(struct threads_sched_args args) 
{
    struct threads_sched_result r;
    // TO DO
    struct thread *thread_rr = NULL;
    struct thread *th = NULL;
    int same_priority = 0;
    list_for_each_entry(th, args.run_queue, thread_list){
        if (thread_rr == NULL)
            thread_rr = th;
        else {
            if (th -> priority < thread_rr -> priority)
                thread_rr = th;
            else if (th -> priority == thread_rr -> priority){
                int runtime_th = th -> processing_time - th -> remaining_time;
                int runtime_rr = thread_rr -> processing_time - thread_rr -> remaining_time;
                if (runtime_th < runtime_rr)
                    thread_rr = th;
                else if ((runtime_th == runtime_rr) && (th -> ID < thread_rr -> ID))
                    thread_rr = th;
            }
        }
    }
    list_for_each_entry(th, args.run_queue, thread_list){
        if (th -> priority == thread_rr -> priority && th -> ID != thread_rr -> ID)
            same_priority = 1;
    }

    if (thread_rr != NULL) {
        r.scheduled_thread_list_member = &thread_rr -> thread_list;
        if (same_priority == 1)
            r.allocated_time = thread_rr -> remaining_time < args.time_quantum? thread_rr -> remaining_time:args.time_quantum;
        else 
            r.allocated_time = thread_rr -> remaining_time;
    } 
    else {
        r.scheduled_thread_list_member = args.run_queue;
        r.allocated_time = 1;
    }
    return r;
}
#endif

/* MP3 Part 2 - Real-Time Scheduling*/

#if defined(THREAD_SCHEDULER_EDF_CBS) || defined(THREAD_SCHEDULER_DM)
static struct thread *__check_deadline_miss(struct list_head *run_queue, int current_time)
{
    struct thread *th = NULL;
    struct thread *thread_missing_deadline = NULL;
    list_for_each_entry(th, run_queue, thread_list) {
        if (th->current_deadline <= current_time) {
            if (thread_missing_deadline == NULL)
                thread_missing_deadline = th;
            else if (th->ID < thread_missing_deadline->ID)
                thread_missing_deadline = th;
        }
    }
    return thread_missing_deadline;
}
#endif

#ifdef THREAD_SCHEDULER_DM
/* Deadline-Monotonic Scheduling */
static int __dm_thread_cmp(struct thread *a, struct thread *b)
{
    //To DO
    if (a -> deadline < b -> deadline)
        return 1;
    else if (a -> deadline > b -> deadline)
        return 0;
    else if (a -> ID < b -> ID)
        return 1;
    else 
        return 0;
}

struct threads_sched_result schedule_dm(struct threads_sched_args args)
{
    struct threads_sched_result r;

    // first check if there is any thread has missed its current deadline
    // TO DO
    struct thread *thread_dm = __check_deadline_miss(args.run_queue, args.current_time);
    if (thread_dm != NULL){
        r.scheduled_thread_list_member = &thread_dm -> thread_list;
        r.allocated_time = 0;
        return r;
    }

    // handle the case where run queue is empty
    // TO DO
    struct thread *th = NULL;
    list_for_each_entry(th, args.run_queue, thread_list){
        if (thread_dm == NULL)
            thread_dm = th;
        else if (__dm_thread_cmp(th, thread_dm) == 1)
            thread_dm = th;
    }
    struct release_queue_entry *entry = NULL;
    if (thread_dm != NULL){
        int next_stop = thread_dm -> current_deadline - args.current_time;
        list_for_each_entry(entry, args.release_queue, thread_list){
            if (__dm_thread_cmp(entry -> thrd, thread_dm) == 1){
                int next_th = entry -> release_time - args.current_time;
                if (next_th < next_stop)
                    next_stop = next_th;
            }
        }
        r.scheduled_thread_list_member = &thread_dm -> thread_list;
        r.allocated_time = thread_dm -> remaining_time < next_stop? thread_dm -> remaining_time:next_stop;
    }
    else {
        int next_stop = INT_MAX;
        r.scheduled_thread_list_member = args.run_queue;
        list_for_each_entry(entry, args.release_queue, thread_list){
            int next_th = entry -> release_time - args.current_time;
            if (next_th < next_stop)
                next_stop = next_th;
        }
        
        r.allocated_time = (next_stop == INT_MAX)?1:next_stop;
    }
    return r;
}
#endif


#ifdef THREAD_SCHEDULER_EDF_CBS
// EDF with CBS comparation
static int __edf_thread_cmp(struct thread *a, struct thread *b, struct release_queue_entry *c, int mode)
{
    // TO DO
    if (mode == 0){
        if (a -> current_deadline < b -> current_deadline)
            return 1;
        else if (a -> current_deadline > b -> current_deadline)
            return 0;
        else if (a -> ID < b -> ID)
            return 1;
        else 
            return 0;
    }
    else {
        if ((c -> release_time + c -> thrd -> deadline) < b -> current_deadline)
            return 1;
        else if ((c -> release_time + c -> thrd -> deadline) > b -> current_deadline)
            return 0;
        else if (c -> thrd -> ID < b -> ID)
            return 1;
        else 
            return 0;
    }
}

//  EDF_CBS scheduler
struct threads_sched_result schedule_edf_cbs(struct threads_sched_args args)
{
    struct threads_sched_result r;

    struct thread *th = NULL;
    
    // notify the throttle task
    // TO DO
    list_for_each_entry(th, args.run_queue, thread_list){
        if (!th -> cbs.is_hard_rt && th -> cbs.is_throttled){
            if (args.current_time >= th -> cbs.throttled_arrived_time) {
                th -> cbs.remaining_budget = th -> cbs.budget;
                th -> cbs.is_throttled = 0;
            }
        }
    }

    struct thread *thread_edf_cbs = __check_deadline_miss(args.run_queue, args.current_time);
    if (thread_edf_cbs != NULL){
        if (thread_edf_cbs -> cbs.is_hard_rt){
            r.scheduled_thread_list_member = &thread_edf_cbs -> thread_list;
            r.allocated_time = 0;
            return r;
        }
    }

    list_for_each_entry(th, args.run_queue, thread_list){
        if (!th -> cbs.is_hard_rt && !th -> cbs.is_throttled){
            if (args.current_time >= th -> current_deadline) {
                th -> cbs.remaining_budget = th -> cbs.budget;
                th -> current_deadline += th -> period;
                
            }
            if ((th -> cbs.remaining_budget * th -> period) > (th -> cbs.budget * (th -> current_deadline - args.current_time))){
                th -> cbs.remaining_budget = th -> cbs.budget;
                th -> current_deadline = args.current_time + th -> period;
            }
            if (th->cbs.remaining_budget <= 0 && th->remaining_time > 0) {
                th -> cbs.is_throttled = 1;
                th -> cbs.throttled_arrived_time = th -> current_deadline;
                th -> cbs.throttle_new_deadline = th -> current_deadline + th -> period;
                th -> current_deadline = th -> cbs.throttle_new_deadline;
            }
        }
    }

    thread_edf_cbs = NULL;
    th = NULL;
    list_for_each_entry(th, args.run_queue, thread_list){
        if (!th -> cbs.is_throttled && thread_edf_cbs == NULL)
            thread_edf_cbs = th;
        else if (!th -> cbs.is_throttled && __edf_thread_cmp(th, thread_edf_cbs, NULL, 0) == 1)
            thread_edf_cbs = th;
    }

    struct release_queue_entry *entry = NULL;
    if (thread_edf_cbs != NULL){
        
        int next_stop = thread_edf_cbs -> current_deadline - args.current_time;
        if (!thread_edf_cbs -> cbs.is_hard_rt){
            if (thread_edf_cbs -> cbs.remaining_budget < next_stop)
                next_stop = thread_edf_cbs -> cbs.remaining_budget;
        }
        list_for_each_entry(entry, args.release_queue, thread_list){
            if (__edf_thread_cmp(NULL, thread_edf_cbs, entry, 1) == 1){
                int next_th = entry -> release_time - args.current_time;
                if (next_th < next_stop)
                    next_stop = next_th;
            }
        }
        list_for_each_entry(th, args.run_queue, thread_list){
            if (th -> cbs.is_throttled){
                if (__edf_thread_cmp(th, thread_edf_cbs, NULL, 0) == 1){
                    int next_th = th -> cbs.throttled_arrived_time - args.current_time;
                    if (next_th < next_stop)
                        next_stop = next_th;
                }
            }
        }
        
        r.scheduled_thread_list_member = &thread_edf_cbs -> thread_list;
        r.allocated_time = thread_edf_cbs -> remaining_time < next_stop? thread_edf_cbs -> remaining_time:next_stop;
    }
    else {
        int next_stop = INT_MAX;
        r.scheduled_thread_list_member = args.run_queue;
        list_for_each_entry(entry, args.release_queue, thread_list){
            int next_th = entry -> release_time - args.current_time;
            if (next_th < next_stop)
                next_stop = next_th;
        }
        list_for_each_entry(th, args.run_queue, thread_list){
            if (th -> cbs.is_throttled){
                if (__edf_thread_cmp(th, thread_edf_cbs, NULL, 0) == 1){
                    int next_th = th -> cbs.throttled_arrived_time - args.current_time;
                    if (next_th < next_stop)
                        next_stop = next_th;
                }
            }
        }
        
        r.allocated_time = (next_stop == INT_MAX)?1:next_stop;
    }
    return r;




    // first check if there is any thread has missed its current deadline
    // TO DO

    // handle the case where run queue is empty
    // TO DO

    return r;
}
#endif