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
    * Interrupting A Process
        In a terminal, pressing Ctrl-c, interrupts a program. This means that we politely asked the program to terminate.
            Many (but not all) command-line programs can be interrupted by using this technique. 
        
    * Putting A Process In The Background
        Let's' say we wanted to get the shell prompt back without terminating the xlogo program.
        => We’ll do this by placing the program in the background.
        Think of the terminal as having a foreground  (with stuff visible on the surface like the shell prompt) 
            and a background (with hidden stuff behind the surface.) 
        To launch a program so that it is immediately placed in the background, we follow the command with an- “&” character
        $ xlogo &
         => [1] 5958 : job control, we have started job number 1(“[1]”) and that it has PID 5958. 
        $ jobs => view list job

    * Returning A Process To The Foreground
        A process in the background is immune from keyboard input, including any attempt interrupt it with a Ctrl-c.
        To return a process to the foreground, use the fg command
            $ fg %1 <= $fg <%<job number>>
            K: Ctrl C
    
    * Stopping (Pausing) A Process
        Sometimes we'll' want to stop a process without terminating it. This is often done to allow
            a foreground process to be moved to the background.
        To stop a foreground process, press Ctrl-z
        We can either restore the program to the foreground, using the fg command, 
            or move the program to the background with the bg command
            $ bg %1 
            or 
            $ fg  ( the jobspec is optional if there is only one job)
        Why would you want to launch a graphical program from the command line? There are two reasons:
            First, the program you wish to run might not be listed on the window manager's' menus (such as xlogo). 
            Secondly, by launching a program from the command line, you might be able to see error messages that would 
                otherwise be invisible if the program were launched graphically.
            
* Signals
    The kill command is used to “kill” processes.
        $ kill <pid> | $ kill <job number>
    The kill command doesn't' exactly “kill” processes, rather it sends them signals.
    Signals are one of several ways that the operating system communicates with programs.
    When the terminal receives one of these keystrokes, it sends a signal to the program in the foreground. 
        In the case of Ctrl-c, a signal called INT (Interrupt) is sent; with Ctrl-z, a signal called TSTP (Terminal Stop).
    
    * Sending Signals To Processes With kill
        $ kill [-signal] PID
        If no signal is specified on the command line, then the TERM (Terminate) signal is sent by default.

        Table 10-4: Common Signals
            Number      Name        Meaning
            1           HUP         Hangup. This is a vestige of the good old days when terminals were attached to remote computers with 
                                        phone lines and modems. The signal is used to indicate to programs that the controlling terminal 
                                        has “hung up.” The effect of this signal can be demonstrated by closing a terminal session. 
                                        The foreground program running on the terminal will be sent the signal and will terminate.
                                        This signal is also used by many daemon programs to cause a reinitialization. This means 
                                        that when a daemon is sent this signal, it will restart and re-read its configuration file. 
                                        The Apache web server is an example of a daemon that uses the HUP signal in this way.
            2           INT         Interrupt. Performs the same function as the Ctrl-c key sent from the terminal. It will 
                                        usually terminate a program.
            9           KILL        Kill. This signal is special. Whereas programs may choose to handle signals sent to them in 
                                        different ways, including ignoring them all together, the KILL signal is never actually sent to
                                        the target program. Rather, the kernel immediately terminates the process. When a process is terminated in this manner, 
                                        it is given no opportunity to “clean up” after itself or save its work. For this reason, the KILL signal should only be used as 
                                        a last resort when other termination signals fail.
            15          TERM        Terminate. This is the default signal sent by the kill command. If a program is still “alive” 
                                        enough to receive signals, it will terminate.
            18          CONT        Continue. This will restore a process after a STOP signal.
            19          STOP        Stop. This signal causes a process to pause without terminating. Like the KILL signal, it is 
                                        not sent to the target process, and thus it cannot be ignored.

        $ kill -2 1235
        $ kill -INT 1235
        $ kill -SIGINT 1235

        Processes, like files, have owners, and you must be the owner of a process (or the superuser) in order to send it 
            signals with kill. 
        
        Table 10-5: Other Common Signals
            Number      Name        Meaning
            3           QUIT        Quit.
            11          SEGV        Segmentation Violation. This signal is sent if a program makes illegal use of memory, that is, it 
                                        tried to write somewhere it was not allowed to.
            20          TSTP        Terminal Stop. This is the signal sent by the terminal when the Ctrl-z key is pressed. Unlike
                                        the STOP signal, the TSTP signal is received by the program but the program may choose to 
                                        ignore it.
            28          WINCH       Window Change. This is a signal sent by the system when a window changes size. Some 
                                        programs , like top and less will respond to this signal by redrawing themselves to fit the new 
                                        window dimensions.

        $ kill -l => view full signals. 

    * Sending Signals To Multiple Processes With killall
        It's' also possible to send signals to multiple processes matching a specified program or
            username by using the killall command.
        $ killall [-u user] [-signal] name...
        $ killall xlogo

* More Process Related Command 
    Since monitoring processes is an important system administration task, there are a lot of
        commands for it. Here are some to play with:
        Table 10-6: Other Process Related Commands
            Command     Description
            pstree      Outputs a process list arranged in a tree-like pattern showing the 
                            parent/child relationships between processes.
            vmstat      Outputs a snapshot of system resource usage including, memory, 
                            swap and disk I/O. To see a continuous display, follow the 
                            command with a time delay (in seconds) for updates. 
                            For example: $ vmstat 5. Terminate the output with Ctrl-c.
            xload       A graphical program that draws a graph showing system load over time.
            tload       Similar to the xload program, but draws the graph in the terminal. Terminate the output with Ctrl-C
