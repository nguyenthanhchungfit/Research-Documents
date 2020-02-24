* 
    id – Display user identity
    chmod – Change a file's mode'.
    umask – Set the default file perm
    su – Run a shell as another user
    sudo – Execute a command as another user
    chown – Change a file's owner'.
    chgrp – Change a file's group ownership'.
    passwd – Change a user's password'.

* Owners, Group Members, And Everybody Else
    In the Unix security model, a user may own files and directories. 
    When a user owns a fileor directory, the user has control over its access. 
    Users can, in turn, belong to a group consisting of one or more users who are given access to 
        files and directories by their owners.

    $ id => list information of permission.

    User accounts are defined in the /etc/passwd file
    Groups are defined in the /etc/group file.

    When user accounts and groups are created, these files are modified 
        along with /etc/shadow which holds information about the user's password'.

* Reading, Writing, And Executing
    Table 9-1: File Types
        Attribute       File Type
            -           A regular file.
            d           A directory.
            l           A symbolic link. Notice that with symbolic links, the remaining file 
                            attributes are always “rwxrwxrwx” and are dummy values. The real
                            file attributes are those of the file the symbolic link points to.
            c           A character special file. This file type refers to a device that 
                            handles data as a stream of bytes, such as a terminal or modem.
            b           A block special file. This file type refers to a device that handles 
                            data in blocks, such as a hard drive or CD-ROM drive.

    Owner   Group     World
     rwx      rwx       rwx

    Table 9-2: Permission Attributes
        Attribute           Files                       Directories
            r       Allows a file to be opened and      Allows a directory's contents to be listed if the execute attribute is also set'.   
                        read. 

            w       Allows a file to be written to or   Allows files within a directory
                    truncated, however this attribute   to be created, deleted, and
                    does not allow files to be renamed  renamed if the execute attribute
                    or deleted. The ability to delete   is also set.
                    or rename files is determined 
                    by directory attributes.
            
            x       Allows a file to be treated as a    Allows a directory to be 
                    program and executed. Program       entered, e.g., cd directory.
                    files written in scripting 
                    languages must also be set as 
                    readable to be executed.
 
    $ chmod => Change File Mode.
    
    Table 9-4: File Modes In Binary And Octal
        Octal       Binary         File Mode
        0           000             ---
        1           001             --x
        2           010             -w-
        3           011             -wx
        4           100             r--
        5           101             r-x
        6           110             rw-
        7           111             rwx

    Table 9-5: chmod Symbolic Notation
        Symbol      Meaning
        u           Short for “user” but means the file or directory owner.
        g           Group owner.
        o           Short for “others,” but means world.
        a           Short for “all.” The combination of “u”, “g”, and “o”.

    Table 9-6: chmod Symbolic Notation Examples
        Notation        Meaning
        u+x             Add execute permission for the owner.
        u-x             Remove execute permission from the owner.
        +x              Add execute permission for the owner, group, and world. Equivalent to a+x.
        o-rw            Remove the read and write permission from anyone besides the 
                        owner and group owner.
        go=rw           Set the group owner and anyone besides the owner to have read andwrite permission. If either the group owner 
                        or world previously had  execute permissions, they are removed.
        u+x,go=rx       Add execute permission for the owner and set the permissions for 
                        the group and others to read and execute. Multiple specifications 
                        may be separated by commas.

    $ umask – Set Default Permission
        The umask command controls the default permissions given to a file when it is created.
        Original file mode  --- rw- rw- rw-
        Mask                000 000 000 010 ($ umask 0002)
        Result              --- rw- rw- r--

* Changing Identities
    There are three ways to take on an alternate identity:
        1. Log out and log back in as the alternate user.
        2. Use the su command.
        3. Use the sudo command

    $ su – Run A Shell With Substitute User And Group IDs
        The su command is used to start a shell as another user. The command syntax looks like this:
            $ su [-[l]] [user]
            If the “-l” option is included, the resulting shell session is a login shell for the specified user.
            If the user is not specified, the superuser is assumed. 
            <-l> same <->
        $ su -
        $ su -c 'ls -l /root/*'

    $ sudo – Execute A Command As Another User
        The sudo command is like su in many ways, but has some important additional capabilities.
        sudo does not require access to the superuser's password'.To authenticate using sudo, the user uses his/her own password.

        
        $ sudo backup_script
        $ sudo -l => To see what privileges are granted by sudo
    
    $ chown – Change File Owner And Group
        The chown command is used to change the owner and group owner of a file or directory.
        Superuser privileges are required to use this command.

        $ chown [owner][:[group]] file...

        Table 9-7: chown Argument Examples
            Argument        Results
            bob             Changes the ownership of the file from its current owner to user bob.
            bob:users       Changes the ownership of the file from its current owner to user 
                                bob and changes the file group owner to group users.
            :admins         Changes the group owner to the group admins. The file owner is unchanged.
            bob:            Change the file owner from the current owner to user bob and 
                                changes the group owner to the login group of user bob
        Examples:
            Let's' say that we have two users; janet, who has access to superuser privileges and
                tony, who does not. User janet wants to copy a file from her home directory to the
                home directory of user tony. Since user janet wants tony to be able to edit the file,
                janet changes the ownership of the copied file from janet to tony:

            $ sudo cp myfile.txt ~tony
            $ sudo chown tony: ~tony/myfile.txt

        $ chgrp – Change Group Ownership
            In older versions of Unix, the chown command only changed file ownership, not group
            ownership. For that purpose, a separate command, chgrp was used. It works much the
            same way as chown, except for being more limited.

* Exercising Our Privileges
    Now that we have learned how this permissions thing works, it's' time to show it off. We
        are going to demonstrate the solution to a common problem—setting up a shared directory. 
        Let's' imagine that we have two users named “bill” and “karen.” They both have music CD collections 
        and wish to set up a shared directory, where they will each store their music files 
        as Ogg Vorbis or MP3. User bill has access to superuser privileges via sudo. 

    Step 1: create group "Music".
        $ groupadd -g 1001 Music
    Step 2: Add user "bill" and "karen" to group "Music".
        $ sudo adduser bill Music
        $ sudo adduser karen Music
    Step 3: Create shared dicrectory.
        $ sudo mkdir /usr/local/share/Music
    Step 4: Set owner group "Music" to shared dicrectory.
        $ sudo chown :Music /usr/local/share/Music
    Step 5: Set rwx for group.
        $ sudo chmod 775 /usr/local/share/Music.
        