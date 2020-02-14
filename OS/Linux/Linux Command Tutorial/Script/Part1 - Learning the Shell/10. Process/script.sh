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


[ZSA_ALERT]
-----------------------------------
Type: remove account external
App: <AppName>-<IP>
User: <userId>-<userName>
Roles: <List roles of user>

-----------------------------------
Time: 2020/01/16 21:56:10
