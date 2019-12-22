* A command can be one of four different things:
    1. An executable program like all those files we saw in /usr/bin. Within this
        category, programs can be compiled binaries such as programs written in C and
        C++, or programs written in scripting languages such as the shell, perl, python, ruby, etc.
    2. A command built into the shell itself. bash supports a number of commands internally called shell builtins. The cd command, 
        for example, is a shell builtin.
    3. A shell function. These are miniature shell scripts incorporated into the environment. We will cover configuring the environment and writing shell functions in
        later chapters, but for now, just be aware that they exist.
    4. An alias. Commands that we can define ourselves, built from other commands.

* Identifying Commands
    type – Display A Command's Type
    $ type <command> => $ type type; $ type ls

    which – Display An Executable's Location
    $ which <command> => $ which ls
    which only works for executable programs, not builtins nor aliases that are substitutes for actual executable programs

    help – Get Help For Shell Builtins
    $ help <command> => $ help cd

    --help – Display Usage Information
    $ <command> --help => $ mkdir --help # some program dont support --help option

    man – Display A Programs Manual Page
    $ man <program> => $ man ls
    
    Section       Contents
    1             User commands
    2             Programming interfaces kernel system calls
    3             Programming interfaces to the C library
    4             Special files such as device nodes and drivers
    5             File formats
    6             Games and amusements such as screen savers
    7             Miscellaneous 
    8             System administration comman

    $ man section search_term => $ man 5 passwd

* apropos – Display Appropriate commands
    $ apropos floppy
* whatis – Display A Very Brief Description Of A Command
    $ whatis ls
* info – Display A Programs Info Entry
    Table 5-2: info Commands
    Command                 Action
    ?                       Display command help
    PgUp or Backspace       Display previous page
    PgDn or Space           Display next page
    n                       Next - Display the next node
    p                       Previous - Display the previous node
    u                       Up - Display the parent node of the currently displayed node, usually a menu.
    Enter                   Follow the hyperlink at the cursor location
    q                       Quit

    $ info coreutils

* README And Other Program Documentation Fil
    Many software packages installed on your system have documentation files residing in the /usr/share/doc directory
    $ less 
    $ zless view gzip .gz

* Creating Your Own Commands With alias
    - command1; command2; command3... => $  cd /usr; ls; cd -

    - alias name='string'  => $ alias foo='cd /usr; ls; cd -;'
        To remove alias:  $ unalias foo


