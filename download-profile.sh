#/bin/bash

/usr/local/bin/osync.sh /etc/osync/base-profile.conf --summary --stats --non-interactive --sync-type="target2initiator"

/usr/local/bin/osync.sh /etc/osync/extended-profile.conf --summary --stats --non-interactive --sync-type="target2initiator"

echo "=================================="
echo "ACHTUNG!! Du wirst nun ausgeloggt, damit dein heruntergeladenes Profil aktiv werden kann!"

read

gnome-session-quit --logout

