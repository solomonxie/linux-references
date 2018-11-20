#!/usr/bin/env bash
# Common usage examples for: rsync

# copy a directory locally, archive mode (preserves perms/times/symlinks)
rsync -a alpine/ /tmp/alpine-copy/

# dry run — show what would change without doing it
rsync -av --dry-run alpine/ /tmp/alpine-copy/

# sync and delete files at destination that no longer exist at source
# rsync -av --delete alpine/ /tmp/alpine-copy/

# copy to a remote host over ssh
# rsync -avz alpine/ user@host:/remote/path/

# show progress for large transfers
# rsync -avz --progress big_dir/ /tmp/dest/

# exclude a pattern
rsync -av --exclude='*.log' alpine/ /tmp/alpine-copy/

rm -rf /tmp/alpine-copy
