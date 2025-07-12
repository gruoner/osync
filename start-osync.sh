#!/bin/bash

if ! grep ^$(whoami) /etc/passwd > /dev/null 2>&1; then
	echo "running as an user not found in /etc/passwd"
	echo "thus starting osync as user $(whoami)"
	if systemctl --user status osync-srv@base-profile.conf.service > /dev/null 2>&1
	then
	  echo "base-profile service still running"
	else
	  if [ -f $(eval echo ~$(whoami))/osync.base-profile.log ]
          then
                echo "osync had initialy synced the homedir -- supressing backsync"
          else
                echo "first download base-profile"
                /usr/local/bin/osync.sh /etc/osync/base-profile.conf --summary --stats --non-interactive --sync-type="target2initiator"
          fi
 	  echo "then starting base-profile"
	  systemctl --user start osync-srv@base-profile.conf
	fi
else
	echo "found user $(whoami) in /etc/passwd"
	echo "thus not starting osync"
fi

