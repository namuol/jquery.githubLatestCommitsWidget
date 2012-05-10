#!/bin/sh
cake build
mkdir -p deploy
cp -r *.js *.html *.css *.png deploy/.

git checkout gh-pages
mv deploy/* .
git add *.js *.html *.css *.png

rm -rf deploy
git commit -am 'auto-deploy'
git push origin gh-pages

git checkout master
