#!/bin/bash

if ! grep ^$(whoami) /etc/passwd > /dev/null 2>&1; then
	echo "running as an user not found in /etc/passwd"
	echo "thus starting osync as user $(whoami)"
	systemctl --user start osync-srv@base-profile.conf
else
	echo "found user $(whoami) in /etc/passwd"
	echo "thus not starting osync"
fi

