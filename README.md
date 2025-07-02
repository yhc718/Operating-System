# NTU Operating Systems Course Projects

This repository contains my projects for the NTU Operating Systems course, including user-level threading, memory management, CPU scheduling, file system enhancements, and RAID simulation.  

---

## MP1: User-Level Thread Library in xv6

We implement a user-level thread library in the xv6 environment with the help of `setjmp` and `longjmp`. Threads can explicitly yield when they do not need CPU time, and parents can send signals to their children to kill them or trigger signal handlers.

**[Spec: mp1/spec.pdf]**

---

## MP2: Slab Allocator for Memory Management

We implement memory allocation and deallocation mechanisms by designing a slab allocator in the xv6 operating system to store small kernel objects.

**[Spec: mp2/spec.pdf]**

---

## MP3: CPU Scheduling Algorithms

We implement several CPU scheduling algorithms, including Highest Response Ratio Next, Priority-based Round Robin, Earliest Deadline First with Constant Bandwidth Server, and Deadline-Monotonic scheduling.

**[Spec: mp3/spec.pdf]**

---

## MP4: File System Enhancements and RAID Simulation

We implement symbolic links and access control for the xv6 file system, and design a RAID structure simulation.

**[Spec: mp4/spec.pdf]**

---
