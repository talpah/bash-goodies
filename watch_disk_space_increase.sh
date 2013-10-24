#!/bin/bash
iterations=0; 
firstsize=0; 
oldsize=0; 
while true; do 
	newsize=`df /dev/sda1 | grep -v 'Filesystem' | cut -d ' ' -f 3`; 
	
	if [[ firstsize -eq 0 ]]; then 
		firstsize=$newsize; 
	fi;  
	
	((diffsize=newsize - oldsize)); 
	((firstdiffsize=newsize-firstsize)); 
	((mins=iterations/6)); 
	
	echo "${newsize} (${diffsize}) ($firstdiffsize - in $mins minutes)"; 

	oldsize="$newsize"; 
	sleep 10; 
	iterations=$((iterations +1)); 
done
