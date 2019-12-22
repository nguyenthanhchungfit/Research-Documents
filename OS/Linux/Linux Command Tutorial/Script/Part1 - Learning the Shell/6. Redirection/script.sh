● cat - Concatenate files
● sort - Sort lines of text
● uniq - Report or omit repeated lines
● grep - Print lines matching a pattern
● wc - Print newline, word, and byte counts for each file
● head - Output the first part of a file
● tail - Output the last part of a file
● tee - Read from standard input and write to standard output and files 

* Standard Input, Output, And Error

* Redirecting Standard Output
   $ ls -l /usr/bin > ls-output.txt => output to ls-output.txt
   
   NOTE: we only redirected standard output and not standard error, the error message was still sent to the screen.

   $ >> file.output => append file content

* Redirecting Standard Error 
    standard [input], [output], [error], the shell references them internally as file descriptors => [0], [1], [2]
    $ ls -l /bin/usr 2> ls-error

    * Redirecting Standard Output And Standard Error To One File 
        $ ls -l /bin/usr > ls-output2 2>&1
        $ ls -l /bin/usr &> ls-output3

    * Disposing Of Unwanted Output 
        /dev/null => a bit bucket which accepts input and does nothing with it. 

* Redirecting Standard Input 
    $ cat [file..]

* Pipeline
    Using the pipe operator “|” (vertical bar), the standard output of one command can be piped into the standard input of another:
    command1 | command2 => $ ls -l /usr/bin | less 

    * Filters
        $ ls /bin /usr/bin | sort | less
    
    * uniq - Report Or Omit Repeated Lines 
        uniq accepts a sorted list of data.
        $ ls /bin /usr/bin | sort | uniq | less

        -d : view duplicate line
        $ ls /bin /usr/bin | sort | uniq -d

    * wc – Print Line, Word, And Byte Counnts
        (word count) command is used to display the number of lines, words, and bytes contained in files.
        $ wc ls-output.txt => [n-lines] [n-words] [n-bytes] [file name]
        -l: => [n-lines] 
        
        $ ls /bin /usr/bin | sort | uniq | wc -l

    * grep – Print Lines Matching A Patte
        grep pattern [file...]
        $ ls /bin /usr/bin | sort | uniq | grep zip

        -i: ignore case sensitive
        -v: print lines do not match the search pattern.

    * head / tail – Print First / Last Part Of Fil
        default print 10 lines of text.
        -n: number of lines 
        $  ls /usr/bin | tail -n 5
        $  tail -f  or tailf : view last processing

    * tee – Read From Stdin And Output To Stdout And Fil
        $ ls /usr/bin/ | tee ls.txt | grep zip
        => vừa thực thi vừa đưa standard input => standard output 
    



