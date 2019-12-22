
# Table 4-1: Wildcards
##   Wildcard           Meaning
###     *               Matches any characters
###     ?               Matches any single character
### [characters]        Matches any character that is a member of the set characters
### [!characters]       Matches any character that is not a member of the set characters
### [[:class:]]         Match any character that is a member of the specified class


# Table 4-2: Commonly Used Character Classes
##      Character Class         Meaning
###     [:alnum:]               Matches any alphanumeric character
###     [:alpha:]               Matches any alphabetic character
###     [:digit:]               Matches any numeral
###     [:lower:]               Matches any lowercase letter
###     [:upper:]               Matches any uppercase letter


# Table 4-3: Wildcard Examples
##      Pattern                 Matches
###         *                   All files
###         g*                  Any file beginning with “g”
###       b*.txt                Any file beginning with “b” followed by any characters and ending with “.txt”
###       Data???               Any file beginning with “Data” followed by exactly three characters
###       [abc]*                Any file beginning with either an “a”, a“b”, or a “c”
###     BACKUP.[0-9][0-9][0-9]  Any file beginning with “BACKUP.” followed by exactly three numerals
###     [[:upper:]]*            Any file beginning with an uppercase letter
###     [![:digit:]]*           Any file not beginning with a numeral
###     *[[:lower:]123]         Any file ending with a lowercase letter or the numerals “1”, “2”, or “3”

# cp Copy files and directories
    # copy file .html with update newest version
    $ cp -u *.html destination
    $ cp item1 ite 
    $ cp item... directory

    Table 4-4: cp Options
        Option              Meaning
        -a, --archive       Copy the files and directories and all of their attributes, including ownerships and permissions. Normally, 
                                copies take on the default attributes of the user performing the copy. 
        -i, --interactive   Before overwriting an existing file, prompt the user for confirmation. If this option is not specified, cp will 
                                silently overwrite files.
        -r, --recursive     Recursively copy directories and their contents. This option (or the -a option) is required when copying directories.
        -u, --update        When copying files from one directory to another, only copy files that either 
                                dont exist, or are newer than the existing corresponding files, in the destination directory.
        -v, --verbose       Display informative messages as the copy is performed.

# mv Move/rename files and directories
    $ mv item1 item2
    #to move one or more items from one directory to another.
    $ mv item... directory  

    Option                  Meaning
    -i, --interactive       Before overwriting an existing file, prompt the confirmation. If this option is not specified, 
                                mv silently overwrite files.
    -u, --update            When moving files from one directory to anothmove files that either dont exist, 
                                or are newer texisting corresponding files in the destination directory.
    -v, --verbose           Display informative messages as the move is performed
# mkdir Create directories
    $ mkdir dir1 dir2 dir3

# rm Remove files and directories
    $ rm item ...
    Option                  Meaning
    -i, --interactive       Before deleting an existing file, prompt the user for confirmation. If this option is not specified, rm will 
                                silently delete files.
    -r, --recursive         Recursively delete directories. This means that if a directory being deleted has subdirectories, delete them 
                                too. To delete a directory, this option must be specified.
    -f, --force             Ignore nonexistent files and do not prompt. This overrides the --interactive option. 
    -v, --verbose           Display informative messages as the deletion is performe

# ln Create hard and symbolic links
    To create a hard link
    $ ln file link
    To create a symbolic link where “item” is either a file or a directory
    $ ln -s item link (ll | ls -l . the first character : 'l' ) 
    ** limitations of hard link
        1. A hard link cannot reference a file outside its own file system. This means a link
            cannot reference a file that is not on the same disk partition as the link itself.
        2. A hard link may not reference a director
    ls -li: the first number is inode number