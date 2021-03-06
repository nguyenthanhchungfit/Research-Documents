The shell maintains a body of information during our shell session called the environment.
Data stored in the environment is used by programs to determine facts about our configuration. While most programs use configuration files to store
program settings, some programs will also look for values stored in the environment to
adjust their behavior. Knowing this, we can use the environment to customize our shell experience.

In this chapter, we will work with the following commands
    ● printenv – Print part or all of the environment
    ● set – Set shell options
    ● export – Export environment to subsequently executed programs
    ● alias – Create an alias for a command 

* What Is Stored In The Environment?
    The shell stores two basic types of data in the environment, though, with bash, the
        types are largely indistinguishable.
        + shell variables: are bits of data placed there by bash
        + environment variables: are basically everything else.
    In addition to variables, the shell also stores some programmatic data, 
        namely aliases and shell functions.

    * Examining The Environment
        The set command will show both the shell and environment variables, while printenv will only display the latter. 
        $ printenv | less : View environment variables
        $ printenv USER : view value of environment variable "USER"

        The set command, when used without options or arguments, will display both the shell and environment variables, 
            as well as any defined shell functions. Unlike printenv, its output is courteously sorted in alphabetical order
        
        $ set | less 

        $ alias => viewer alias cmd 

    * Some Interesting Variables
        Table 11-1: Environment Variables
            Variable        Contents
            DISPLAY         The name of your display if you are running a graphical environment. Usually this is 
                                “:0”, meaning the first display generated by the X server.
            EDITOR          The name of the program to be used for text editing.
            SHELL           The name of your shell program.
            HOME            The pathname of your home directory.
            LANG            Defines the character set and collation order of your language.
            OLD_PWD         The previous working directory.
            PAGER           The name of the program to be used for paging output. This is oftenset to /usr/bin/less.
            PATH            A colon-separated list of directories that are searched when you 
                                enter the name of a executable program.
            PS1             Prompt String 1. This defines the contents of your shell prompt. As 
                                we will later see, this can be extensively customized.
            PWD             The current working directory.
            TERM            The name of your terminal type. Unix-like systems support many 
                                terminal protocols; this variable sets the protocol to be used with 
                                your terminal emulator. 
            TZ              Specifies your timezone. Most Unix-like systems maintain the 
                                computer’s internal clock in Coordinated Universal Time (UTC) and then displays the local time by 
                                applying an offset specified by this variable.
            USER            Your username
* How Is The Environment Establishe
    When we log on to the system, the bash program starts, and reads a series of configuration scripts called startup files,
        which define the default environment shared by all users. This is followed by more startup files in our home directory 
        that define our personal environment. The exact sequence depends on the type of shell session being started. There are
        two kinds: a login shell session and a non-login shell session.
    
    A login shell session is one in which we are prompted for our username and password;
        when we start a virtual console session, for example. A non-login shell session typically
        occurs when we launch a terminal session in the GUI.
    
    Login shells read one or more startup files as shown in Table 11-
        Table 11-2: Startup Files For Login Shell Sessions
        File                Contents
        /etc/profile        A global configuration script that applies to all users.
        ~/.bash_profile     A user's' personal startup file. Can be used to extend or 
                                override settings in the global configuration script.
        ~/.bash_login       If ~/.bash_profile is not found, bash attempts to read this script.
        ~/.profile          If neither ~/.bash_profile nor ~/.bash_login is found, bash attempts to 
                                read this file. This is the default in Debian-based distributions, such as Ubuntu.
                                
    Non-login shell sessions read the following startup files:
        Table 11-3: Startup Files For Non-Login Shell Sessions
            File                Contents
            /etc/bash.bashrc    A global configuration script that applies to all users.
            ~/.bashrc           A user's' personal startup file. Can be used to extend or 
                                    override settings in the global configuration script.

    In addition to reading the startup files above, non-login shells also inherit the environment 
        from their parent process, usually a login shell.
    
    * What's' In A Startup File
        $ foo="This is some"
        $ echo $foo => This is some
        $ foo=$foo" text".
        $ echo foo => This is some text.
        Using this technique, we can append text to the end of a variable's' content.
        By adding the string $HOME/bin to the end of the PATH variable's' contents, the directory $HOME/bin 
            is added to the list of directories searched when a command is entered.
        
        Note: Many distributions provide this PATH setting by default. Some Debian baseddistributions, such as Ubuntu, 
            test for the existence of the ~/bin directory at login, 
            and dynamically add it to the PATH variable if the directory is found. 
        $ export PATH
            The export command tells the shell to make the contents of PATH available to 
                childprocesses of this shell.

* Modify the environment
    As a general rule, to add directories to your PATH, or define additional environment variables, place those changes in .bash_profile 
        (or equivalent, according to your distribution.For example, Ubuntu uses .profile.)
    
    For everything else, place the changes in .bashrc. Unless you are the system administrator and need to change the defaults for
        all users of the system, restrict your modifications to the files in your home directory.

    It is certainly possible to change the files in /etc such as profile, and in many cases it
        would be sensible to do so, but for now, let's' play it safe.

    * Text Editors
        Text editors fall into two basic categories: graphical and text based. GNOME and KDE
            both include some popular graphical editors.
        There are many text-based editors. The popular ones you will encounter are nano, vi,
            and emacs. 
            The nano editor is a simple, easy-to-use editor designed as a replacement
                for the pico editor supplied with the PINE email suite. 
            The vi editor (on most Linux systems replaced by a program named vim, which is short for “Vi IMproved”) is the traditional 
                editor for Unix-like systems.
        
        Nano Editor:
            $ nano lfile
            Ctrl-X: Exit nano 
            Ctrl-O: Save file 

