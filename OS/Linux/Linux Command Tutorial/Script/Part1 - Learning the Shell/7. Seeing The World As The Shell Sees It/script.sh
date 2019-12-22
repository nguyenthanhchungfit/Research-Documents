* echo – Display a line of text

* Expansion
    $ echo * : list all name of file and folder
    
    * Pathname Expansion
        The mechanism by which wildcards work is called pathname expansion.
        $ echo D*
        $ echo *s
        $ echo [[:upper:]]*
        $ echo /usr/*/share
        $ echo .* : show hidden files        ~       $ ls -d .* | less       ~       $ echo .[!.]*      ~ ls -A 

    * Tilde Expansion 
        $ echo ~ 
        $ echo ~chungnt : show the directory of user if <chungnt> is exist.

    * Arithmetic Expansion
        $  echo $((expression)) => $ echo $((2 + 2)) 
        Arithmetic expansion only supports integers

        Table 7-1: Arithmetic Operators
            Operator        Description
                +           Addition
                -           Subtraction
                *           Multiplication
                /           Division (but remember, since expansion only supports integer  arithmetic, results are integers.)
                %           Modulo, which simply means, “ remainder.”
                **          Exponentiation
        
        $ echo $(($((5**2)) * 3)) <=> echo $(((5**2) * 3))

    * Brace Expansion
        With it, you can create multiple text strings from a pattern containing braces. 
        $ echo Front-{A,B,C}-Back

        The brace expression itself may contain either a comma-separated list of strings, or a range of integers or single characters. 
            The pattern may not contain embedded whitespace.
        $ echo Number_{1..5} 
        $ echo Number_{01..15}
        $ echo {001..15}
        $ echo {Z..A}
        $ mkdir {2007..2009}-{01..12}

    * Parameter Expansion
        Its a feature that is more useful in shell scripts than directly on the command line. 
        Many of its capabilities have to do with the system-s ability to store small chunks of data and to give each chunk a name. 

        $ echo $USER 
        $ printenv | less => view environment variable list 

    * Command Substitution
        $ echo $(ls)
        $ ls -l $(which cp)
        $ file $(ls -d /usr/bin/* | grep zip)
        There is an alternate syntax for command substitution in older shell programs which is also supported in bash. 
            It uses back-quotes instead of the dollar sign and parentheses:
        $ ls -l `which cp`

* Quoting 
    * Double Quotes
        If you place text inside double quotes, all the special characters used by the shell lose their special meaning and are treated as ordinary characters.
            This means that word-splitting, pathname expansion, tilde expansion, and brace expansion are suppressed, 
            but parameter expansion, arithmetic expansion, and command substitution are still carried out.
        $ ls -l "two words.txt"
        $ echo "$USER $((2+2)) $(cal)"

    * Single Quotes 
        If we need to suppress all expansions, we use single quotes.
        $ echo text ~/*.txt {a,b} $(echo foo) $((2+2)) $USER
        $ echo "text ~/*.txt {a,b} $(echo foo) $((2+2)) $USER"
        $  echo 'text ~/*.txt {a,b} $(echo foo) $((2+2)) $USER'

    * Escaping Characters (backslash \)
        $ echo "The balance for user $USER is: \$5.00"
        $ mv bad\&filename good_filename

        To allow a backslash character to appear, escape it by typing “\\”.
            Escape          Sequence Meaning
              \a            Bell (“Alert” - causes the computer to beep)
              \b            Backspace
              \n            Newline. On Unix-like systems, this produces a linefeed. 
              \r            Carriage return
              \t            Tab
    * Backslash Escape Sequences
        In addition to its role as the escape character, the backslash is also used as part of
        a notation to represent certain special characters called control codes. 
        The first 32characters in the ASCII coding scheme are used to transmit commands to 
        teletype-like devices. Some of these codes are familiar (tab, 
        backspace, linefeed, andcarriage return), while others are not 
        (null, end-of-transmission, and acknowledge

        Escape Sequence             Meaning
        \a                      Bell (“Alert” - causes the computer to beep)
        \b                      Backspace
        \n                      Newline. On Unix-like systems, this produces a linefeed. 
        \r                      Carriage return
        \t                      Tab

        sleep 10; echo -e "Time's up\a" => sleep 10; echo "Time's up" $'\a'

    