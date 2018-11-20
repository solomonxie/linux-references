#!/usr/bin/env bash
# Common usage examples for: du

# total size of a directory, human-readable
du -sh .

# size of each immediate subdirectory
du -sh ./*/ 2>/dev/null

# full recursive breakdown
du -ah . 2>/dev/null | head -10

# depth-limited summary (top 2 levels)
du -h --max-depth=2 . 2>/dev/null || du -h -d2 .

# sorted, biggest first (GNU: du | sort; combine with sort -h)
du -sh ./*/ 2>/dev/null | sort -rh | head -5
