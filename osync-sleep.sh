#!/bin/bash

typeset USERS=""
for u in $(who -s | cut -d" " -f1 | sort -u)
do
  if ! grep ^$u /etc/passwd > /dev/null 2>&1; then
#        echo "user $u not found in /etc/passwd"
	USERS=$USERS" "$u
#  else
#        echo "found user $u in /etc/passwd"
  fi
done

case "$1" in
    suspend|hibernate)
	    for u in $USERS
	    do
		systemctl --machine=$u@ --user stop osync-srv@base-profile.conf
		systemctl --machine=$u@ --user stop osync-srv@extended-profile.conf
	    done
        exit 0
        ;;
    resume)
	    for u in $USERS
	    do
		 systemctl --machine=$u@ --user start osync-srv@base-profile.conf
		 systemctl --machine=$u@ --user start osync-srv@extended-profile.conf
	    done
        exit 0
        ;;
    *)
        exit 1
esac
