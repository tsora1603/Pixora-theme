#!/bin/bash

input_folder="green"

declare -A colors
# first is existing colors, second is the replace
colors["#91a666"]="#9a66a5" #bg
colors["#2a2a2a"]="#2a2a2a" #fg
colors["#779b50"]="#57335f" #bg2 (top of the folder)
colors["#67804f"]="#57335f" #bg2 (top of the folder, is little messed)

for image in folder-colors/$input_folder/16/places/*.png; do
	for original_color in "${!colors[@]}"; do
		new_color="${colors[$original_color]}"
		magick "$image" -fill "$new_color" -opaque "$original_color" "$image"
	done
	echo "Colors replaced in: $image"
done