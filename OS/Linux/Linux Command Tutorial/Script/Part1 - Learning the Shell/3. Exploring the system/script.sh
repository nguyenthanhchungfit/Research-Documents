# ls – List directory contents
ls /zserver
ls ~ /zserver
ls -l #long format 
# structure: command -options arguments
ls -lt

#option
## -a --all: list all
## -A --almost-all: same -a but not list the . and .. directory
## -d --directory: view the info only directory.
## -F --classify: append an indicator character to the end of each listed name. folder -> /
## -h --human-readable: dislay size of file instead of bytes.
## -S: sort the result by size.
## -l: long format 
## -t: sort the result by the field modification time
## -r --reverse: reverse the order of the sort

# file – Determine file type
## -rw-r--r--
### first character: type of file (-: regular file, d: folder)
### 3 next characters: the access rights for the file's owner
### 3 next characters: the access rights for the members of group.
### 3 next characters: the access rights for everyone else.

## view file type
file README.md

## everything is a file.

# less – View file contents
less README.md # press q to exit
#Table 3-3: less Commands
##      Command                   Action
##  Page Up or b                Scroll back one page
##  Page Down or space          Scroll forward one page
##  Up Arrow                    Scroll up one line
##  Down Arrow                  Scroll down one line
##  G                           Move to the end of the text file
##  1G or g                     Move to the beginning of the text file
##  /characters                 Search forward to the next occurrence of characters
##  n                           Search for the next occurrence of the previous search
##  h                           Display help screen
##  q                           Quit less



# Table 3-4: Directories Found On Linux Systems
##  Directory                            Comments
### /                   The root directory. Where everything begins.
### /bin                Contains binaries (programs) that must be present for the system to boot and run.
### /boot               Contains the Linux kernel, initial RAM disk image (for drivers needed at boot time), and the boot loader.
                        #Interesting files:
                            #● /boot/grub/grub.conf or menu.lst, which are used to configure the boot loader.
                            #● /boot/vmlinuz, the Linux kernel
### /dev                This is a special directory which contains device nodes. “Everything is a file” also applies to devices. Here is where
                        #the kernel maintains a list of all the devices it understands.A Guided Tour
### /etc                The /etc directory contains all of the system-wide configuration files. It also contains a collection of shell
                        #scripts which start each of the system services at boot time.
                        #Everything in this directory should be readable text.
                        #Interesting files: While everything in /etc is interesting,
                        #here are some of my all-time favorites: 
                            #● /etc/crontab, a file that defines when automated jobs will run.
                            #● /etc/fstab, a table of storage devices and their associated mount points.
                            #● /etc/passwd, a list of the user accounts.
### /home               In normal configurations, each user is given a directory in /home. Ordinary users can only write files in their home
                        #directories. This limitation protects the system from errant user activity.
### /lib                Contains shared library files used by the core system programs. These are similar to DLLs in Windows.
### /lost+found         Each formatted partition or device using a Linux file system,
                            #such as ext3, will have this directory. It is used in the case of
                            #a partial recovery from a file system corruption event.
                            #Unless something really bad has happened to your system,
                            #this directory will remain empty.
### /media              On modern Linux systems the /media directory will contain the mount points for removable media such as USB
                            #drives, CD-ROMs, etc. that are mounted automatically at insertion.
### /mnt                 On older Linux systems, the /mnt directory contains mount points for removable devices that have been mounted manually.
### /opt                The /opt directory is used to install “optional” software. This is mainly used to hold commercial software products
                            #that may be installed on your system.
### /proc               The /proc directory is special. It's not a real file system in
                            #the sense of files stored on your hard drive. Rather, it is a
                            #virtual file system maintained by the Linux kernel. The
                            #“files” it contains are peepholes into the kernel itself. The
                            #files are readable and will give you a picture of how the
                            #kernel sees your computer.
### /root               This is the home directory for the root account.
### /sbin               This directory contains “system” binaries. These are
                            #programs that perform vital system tasks that are generally
                            #reserved for the superuser.
### /tmp                The /tmp directory is intended for storage of temporary,
                            #transient files created by various programs. Some
                            #configurations cause this directory to be emptied each time
                            #the system is rebooted.
### /usr                The /usr directory tree is likely the largest one on a Linux
                            #system. It contains all the programs and support files used
                            #by regular users.
### /usr/bin            contains the executable programs installed by your Linux distribution. It is not uncommon for this
                            #directory to hold thousands of programs.
### /usr/lib            The shared libraries for the programs in /usr/bin.
### /usr/local          The /usr/local tree is where programs that are not
                            #included with your distribution but are intended for system-
                            #wide use are installed. Programs compiled from source code
                            #are normally installed in /usr/local/bin. On a newly
                            #installed Linux system, this tree exists, but it will be empty
                            #until the system administrator puts something in it.
### /usr/sbin           Contains more system administration programs.
### /usr/share          /usr/share contains all the shared data used by programs in /usr/bin. This includes things like default
                            #configuration files, icons, screen backgrounds, sound files, etc.
### /usr/share/doc      Most packages installed on the system will include some
                            #kind of documentation. In /usr/share/doc, we will find
                            #documentation files organized by package.
### /var                With the exception of /tmp and /home, the directories we
                            #have looked at so far remain relatively static, that is, their
                            #contents don't change. The /var directory tree is where
                            #data that is likely to change is stored. Various databases,
                            #spool files, user mail, etc. are located here.
### /var/log            /var/log contains log files, records of various system
                            #activity. These are very important and should be monitored
                            #from time to time. The most useful one is
                            #/var/log/messages. Note that for security reasons on
                            #some systems, you must be the superuser to view log files .

# Symbolic Links
## <l>rwxrwxrwx 1 root root 11 2007-08-11 07:34 libc.so.6 -> libc-2.6.so