#/bin/bash

/usr/local/bin/osync.sh /etc/osync/base-profile.conf --summary --stats --non-interactive --sync-type="initiator2target"

/usr/local/bin/osync.sh /etc/osync/extended-profile.conf --summary --stats --non-interactive --sync-type="initiator2target"

