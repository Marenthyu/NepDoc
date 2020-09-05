#!/bin/sh
DATE=$(date '+%F %T%z')
INPUT="$1"

if [ -z "$1" ]; then
  INPUT='nepdoc.html'
fi

sed -i "/^<p class=\"lastupdate\">/c <p class=\"lastupdate\"><b>Last update</b>:&nbsp;<time datetime=\"${DATE}\">${DATE}</time></p>" $INPUT

