#include "kernel/types.h"
#include "user/setjmp.h"
#include "user/threads.h"
#include "user/user.h"
#define NULL 0


static struct thread* current_thread = NULL;
static int id = 1;

//the below 2 jmp buffer will be used for main function and thread context switching
static jmp_buf env_st; 
static jmp_buf env_tmp;  

struct thread *get_current_thread() {
    return current_thread;
}

struct thread *thread_create(void (*f)(void *), void *arg){
    struct thread *t = (struct thread*) malloc(sizeof(struct thread));
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long) malloc(sizeof(unsigned long)*0x100);
    new_stack_p = new_stack +0x100*8-0x2*8;
    t->fp = f; 
    t->arg = arg;
    t->ID  = id;
    t->buf_set = 0;
    t->stack = (void*) new_stack; //points to the beginning of allocated stack memory for the thread.
    t->stack_p = (void*) new_stack_p; //points to the current execution part of the thread.
    id++;

    // part 2
    t->suspended = 0;
    t->sig_handler[0] = NULL_FUNC;
    t->sig_handler[1] = NULL_FUNC;
    t->signo = -1;
    t->handler_buf_set = 0;
    return t;
}


void thread_add_runqueue(struct thread *t){
    if(current_thread == NULL){
        current_thread = t;
        current_thread->next = current_thread;
        current_thread->previous = current_thread;
    }else{
        //TO DO
        if (current_thread -> previous == current_thread){
            current_thread -> next = t;
            current_thread -> previous = t;
            t -> next = current_thread;
            t -> previous = current_thread;
            t -> sig_handler[0] = current_thread -> sig_handler[0];
            t -> sig_handler[1] = current_thread -> sig_handler[1];
        }
        else {
            current_thread -> previous -> next = t;
            t -> previous = current_thread -> previous;
            current_thread -> previous = t;
            t -> next = current_thread;
            t -> sig_handler[0] = current_thread -> sig_handler[0];
            t -> sig_handler[1] = current_thread -> sig_handler[1];
        }
    }
}
void thread_yield(void){
    //TO DO
    if (current_thread -> signo == -1){
        if (setjmp(current_thread -> env) == 0){
            schedule();
            dispatch();
        }
    }
    else {
        if (setjmp(current_thread -> handler_env) == 0){
            schedule();
            dispatch();
        }
    }
    
}

void dispatch(void){
    //TO DO   
    while (current_thread -> suspended){
        current_thread = current_thread -> next;
    }

    if (current_thread -> signo != -1){
        if (current_thread -> sig_handler[current_thread -> signo] == NULL_FUNC)
            thread_exit();

        if (current_thread -> handler_buf_set == 0){
            if (setjmp(current_thread -> handler_env) == 0){
                if (current_thread -> buf_set == 1)
                    current_thread -> handler_env[0].sp = current_thread -> env[0].sp;
                else 
                    current_thread -> handler_env[0].sp = (unsigned long) current_thread -> stack_p;
                current_thread -> handler_buf_set = 1;
                longjmp(current_thread -> handler_env, 1);
            }
            current_thread -> sig_handler[current_thread -> signo](current_thread -> signo);
        } 
        else  
            longjmp(current_thread -> handler_env, 1);

        current_thread -> handler_buf_set = 0;
        current_thread -> signo = -1;
    }

    if (current_thread -> buf_set == 0){
        if (setjmp(current_thread -> env) == 0){
            current_thread -> env[0].sp = (unsigned long) current_thread -> stack_p;
            current_thread -> buf_set = 1;
            longjmp(current_thread -> env, 1);
        }
        current_thread -> fp(current_thread -> arg);
    } 
    else  {
        longjmp(current_thread -> env, 1);
    }
    thread_exit();
}

//schedule will follow the rule of FIFO
void schedule(void){
    current_thread = current_thread->next;
    
    //Part 2: TO DO
    while(current_thread->suspended) {
        current_thread = current_thread -> next;
    };
    
}

void thread_exit(void){
    if(current_thread->next != current_thread){
        //TO DO
        current_thread -> previous -> next = current_thread -> next;
        current_thread -> next -> previous = current_thread -> previous;
        struct thread *temp = current_thread;
        current_thread = current_thread -> next;
        free(temp -> stack);
        free(temp);
        dispatch();
    }
    else{
        free(current_thread->stack);
        free(current_thread);
        longjmp(env_st, 1);
    }
}
void thread_start_threading(void){
    //TO DO
    if (setjmp(env_st) == 0)
        dispatch();
}

//PART 2
void thread_register_handler(int signo, void (*handler)(int)){
    current_thread->sig_handler[signo] = handler;
}

void thread_kill(struct thread *t, int signo){
    //TO DO
    t -> signo = signo;

}

void thread_suspend(struct thread *t) {
    //TO DO
    t -> suspended = 1;
    if (t == current_thread){
        thread_yield();
    }
}

void thread_resume(struct thread *t) {
    //TO DO
    t -> suspended = 0;
}

