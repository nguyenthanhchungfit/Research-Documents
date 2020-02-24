Modern operating systems are usually multitasking, meaning that they create the illusion of doing 
    more than one thing at once by rapidly switching from one executing program to another.
The Linux kernel manages this through the use of processes

This chapter will introduce the following commands:
    ● ps – Report a snapshot of current processes
    ● top – Display tasks
    ● jobs – List active jobs
    ● bg – Place a job in the background
    ● fg – Place a job in the foreground
    ● kill – Send a signal to a process
    ● killall – Kill processes by name
    ● shutdown – Shutdown or reboot the system

* How A Process Work
    When a system starts up, the kernel initiates a few of its own activities as processes and
        launches a program called init. init, in turn, runs a series of shell scripts (located in
        /etc) called init scripts, which start all the system services. Many of these services are
        implemented as daemon programs, programs that just sit in the background and do their
        thing without having any user interface. So even if we are not logged in, the system is at
        least a little busy performing routine stuff.
    The fact that a program can launch other programs is expressed in the process scheme as
        a parent process producing a child process.
    
    The kernel maintains information about each process to help keep things organized.  For
        example, each process is assigned a number called a process ID or PID.
        PIDs are assigned in ascending order, with init always getting PID 1.
        Like files, processes also have owners and user IDs, effective user IDs, etc.

* Viewing Processes
        $ ps
        -> default: just show the processes associated with the current terminal session.
            PID         TTY          TIME CMD
            12062       pts/14        00:00:00 bash
            12967       pts/14        00:00:00 ps 

            TTY is short for “Teletype,” and refers to the controlling terminal for the process. 
            The TIME field is the amount of CPU time consumed by the process.
        
        $ ps x
        ->  tells ps to show all of our processes regardless of what terminal (if any) they are controlled by.
            The presence of a “?” in the TTY column indicates no controlling terminal.

            + STAT: is short for “state” and reveals the current status of the process:
                Table 10-1: Process States
                    State       Meaning
                    R           Running. This means that the process is running or ready to run.
                    S           Sleeping. The process is not running; rather, it is waiting for an 
                                    event, such as a keystroke or network packet.
                    D           Uninterruptible Sleep. Process is waiting for I/O such as a disk drive.
                    T           Stopped. Process has been instructed to stop. More on this later.
                    Z           A defunct or “zombie” process. This is a child process that has 
                                    terminated, but has not been cleaned up by its parent.
                    <           A high priority process. It's' possible to grant more importance to a 
                                    process, giving it more time on the CPU. This property of a process 
                                    is called niceness. A process with high priority is said to be less nice
                                    because it's' taking more of the CPU's' time, which leaves less for 
                                    everybody else.
                    N           A low priority process. A process with low priority (a “nice” 
                                    process) will only get processor time after other processes with 
                                    higher priority have been serviced

                The process state may be followed by other characters. These indicate various exotic
                    process characteristics. ($ man ps)

        $  ps aux
            This set of options displays the processes belonging to every user. Using the options
                without the leading dash invokes the command with “BSD style” behavior.

                Table 10-2: BSD Style ps Column Headers
                    Header      Meaning
                    USER        User ID. This is the owner of the process.
                    %CPU        CPU usage in percent.
                    %MEM        Memory usage in percent.
                    VSZ         Virtual memory size.
                    RSS         Resident Set Size. The amount of physical memory (RAM) the 
                                    process is using in kilobytes.
                    START       Time when the process started. For values over 24 hours, a date is used
                
        * Viewing Processes Dynamically With top
            While the ps command can reveal a lot about what the machine is doing, it provides only
                a snapshot of the machine's' state at the moment the ps command is executed. 
            To see a more dynamic view of the machine's' activity, we use the top command:

            $ top
                The top program displays a continuously updating (by default, every 3 seconds) display
                    of the system processes listed in order of process activity.
                The top display consists of two parts: a system summary at the top of the display, followed by a
                    table of processes sorted by CPU activity:
                
                Table 10-3: top Information Fields
                    Row     Field           Meaning
                    1       top             Name of the program.
                            14:59:20        Current time of day.
                            up 6:30         This is called uptime. It is the amount of time since the machine was last booted. In this 
                                                example, the system has been up for six and a 
                                                half hours.
                            2 users         There are two users logged in.
                            load average:   Load average refers to the number of processes that are waiting to run, that is, the number of 
                                                processes that are in a runnable state and are sharing the CPU. Three values are shown, 
                                                each for a different period of time. The first is the average for the last 60 seconds, the next the 
                                                previous 5 minutes, and finally the previous 15minutes. Values under 1.0 indicate that the 
                                                machine is not busy.
                    2       Tasks:          This summarizes the number of processes and their various process states.
                    3       Cpu(s):         This row describes the character of the activities that the CPU is performing.
                            0.7%us          0.7% of the CPU is being used for user processes. This means processes outside of the kernel itself.
                            1.0%sy          1.0% of the CPU is being used for system(kernel) processes.
                            0.0%ni          0.0% of the CPU is being used by “nice” (low priority) processes.
                            98.3%id         98.3% of the CPU is idle.
                            0.0%wa          0.0% of the CPU is waiting for I/O.
                    4       Mem:            Shows how physical RAM is being used.
                    5       Swap:           Shows how swap space (virtual memory) is being used

                The top program accepts a number of keyboard commands. The two most interesting are h, which displays the program's' help screen, and q, which quits top.

* Controlling Processes
    