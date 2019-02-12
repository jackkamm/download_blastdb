#!/bin/bash
set -ex
UPLOAD="s3://jackkamm/blastdb"
DOWNLOAD="blastdb"
mkdir -p "$DOWNLOAD"
aws s3 sync --delete "$UPLOAD"/ "$DOWNLOAD"/
cd "$DOWNLOAD"
update_blastdb.pl --decompress nt taxdb
aws s3 sync --dryrun --delete ./ "$UPLOAD"/
