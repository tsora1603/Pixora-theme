#!/bin/sh

if [ "$(basename "$PWD")" = "pixelitos-dark" ]; then
	:
else
	cd pixelitos-dark
fi


if [ "$(basename "$PWD")" = "pixelitos-dark" ]; then
	:
else
	echo "NOT ON 'pixelitos-dark, exitting'"
fi

echo $PWD

if [ ! -d "128" ]; then
	mkdir -v 128
fi


cp -rvn 16/* 128
find 128 -type f -name "*.png" -mmin -1 -exec mogrify -resize 128x128! -filter point -verbose {} \; &&
ln -s ../pixelitos-dark/128 ../pixelitos-light/128
sleep 1 && gtk-update-icon-cache .
gtk-update-icon-cache  ../pixelitos-light .
