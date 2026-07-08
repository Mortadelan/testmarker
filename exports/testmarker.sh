#!/bin/sh
printf '\033c\033]0;%s\a' testmarker
base_path="$(dirname "$(realpath "$0")")"
"$base_path/testmarker.x86_64" "$@"
