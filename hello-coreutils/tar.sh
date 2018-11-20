#!/usr/bin/env bash
# Common usage examples for: tar

# create a gzip-compressed archive
tar -czf archive.tar.gz alpine/ 2>/dev/null

# list contents without extracting
tar -tzf archive.tar.gz

# extract an archive
tar -xzf archive.tar.gz -C /tmp

# extract a single file from an archive
tar -xzf archive.tar.gz -C /tmp path/to/file

# create excluding a pattern
tar -czf archive.tar.gz --exclude='*.log' alpine/ 2>/dev/null

# verbose create (show files as they're added)
tar -czvf archive.tar.gz alpine/ 2>/dev/null | head -5

# create a bzip2 / xz archive
# tar -cjf archive.tar.bz2 dir/
# tar -cJf archive.tar.xz dir/

rm -f archive.tar.gz
