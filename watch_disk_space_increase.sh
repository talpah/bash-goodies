#!/bin/bash
INTERVAL=10;
iterations=0;
firstsize=0;
oldsize=0;

while true; do
        newsize=`df | head -2 | tail -1 |  awk '{ print $3 }'`;

        if [[ firstsize -eq 0 ]]; then
                firstsize=$newsize;
        fi;

        ((diffsize=newsize - oldsize));
        ((firstdiffsize=newsize-firstsize));
        ((mins=(iterations*INTERVAL)/10));

        echo "${newsize} (${diffsize}) ($firstdiffsize - in $mins minutes)";

        oldsize="$newsize";
        sleep $INTERVAL;
        iterations=$((iterations +1));
done
