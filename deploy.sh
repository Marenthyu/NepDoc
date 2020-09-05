#!/bin/bash
./ts.sh
ruby nav.rb
rm -rf ./deploy/{quickstart,adminref.html,fonts,godsound.ogg,main.css,nepdoc.html}
cp -r {quickstart,adminref.html,fonts,godsound.ogg,main.css,nepdoc.html} ./deploy/
