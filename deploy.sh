#!/bin/bash

echo "Deploying updates to GitHub"

hugo -t cocoa
cd public
git add .

msg="Automatically rebuilt - `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

git commit -m "$msg"
git push origin master
cd ..