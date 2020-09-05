#!/bin/bash
./ts.sh
ruby nav.rb
rm -rf ./deploy/{fonts,godsound.ogg,main.css,nepdoc.html}
cp -r {fonts,godsound.ogg,main.css,nepdoc.html} ./deploy/
