#!/bin/bash
file=$(find ~/ -type f -name '*.patch' | fzf)
echo "$file"
