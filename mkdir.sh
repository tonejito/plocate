#! /bin/sh
destdir=${DESTDIR:-}
case "$destdir" in
	/) destdir= ;;
	*/) destdir=${destdir%/} ;;
esac
target="${destdir}$1"

mkdir -p "$target"

cat <<EOF >"$target"/CACHEDIR.TAG
Signature: 8a477f597d28d172789f06886806bc55
# This file is a cache directory tag created by plocate.
# For information about cache directory tags, see:
#	https://bford.info/cachedir/
EOF
