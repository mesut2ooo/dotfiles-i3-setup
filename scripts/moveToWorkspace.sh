#!/bin/bash
direction="$1"
current_workspace=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused).name')

if [ "$direction" == "next" ]; then
    target_workspace=$(i3-msg -t get_workspaces | jq -r '.[] | .name' | awk -v curr="$current_workspace" '$1 > curr' | sort -n | head -n1)
    [ -z "$target_workspace" ] && target_workspace=$((current_workspace + 1))
elif [ "$direction" == "prev" ]; then
    target_workspace=$(i3-msg -t get_workspaces | jq -r '.[] | .name' | awk -v curr="$current_workspace" '$1 < curr' | sort -nr | head -n1)
    [ -z "$target_workspace" ] && target_workspace=$((current_workspace - 1))
else
    exit 1
fi

i3-msg move container to workspace "$target_workspace"
i3-msg workspace "$target_workspace"

