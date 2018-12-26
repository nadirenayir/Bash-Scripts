#!/bin/bash
# Nadire Nayir <nzn36@psu.edu>                     
# Description: Transferring local directory to PSU BOX via FTP        
# Usage: bash lftp.sh
#                                                    12/23/18 

#USERNAME
echo -n "Enter your username and press [ENTER]: "
read USER
 
#LOCAL DIRECTORY
echo -n "Enter the absolute path of your local directory and press [ENTER]: "
read LOCAL_DIR
 
# PSUBOX DIRECTORY
echo -n "Enter BOX directory and press [ENTER]: "
read PSUBOX_DIR

# RUNTIME!
echo
echo "Starting transfer from $LOCAL_DIR to $PSUBOX_DIR"
date

lftp -c 'open -e "set ftps:initial-prot ""; \
   set ftp:ssl-force true; \
   set ftp:ssl-protect-data true; \
   open ftps://ftp.box.com:990; \
   user '$USER'@psu.edu; \
   mirror --reverse --no-perms --verbose "'$LOCAL_DIR'" '$PSUBOX_DIR';" '
exit
echo
echo "Transfer finished"
date
