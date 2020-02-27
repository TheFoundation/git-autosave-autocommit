#!/bin/bash

echo "REMEMBER TO CHANGE INTO A GIT DIRECTORY BEFORE RUNNING THIS SCRIPT"

git_commitpush() { git add -A ;git commit -m "$(date -u +%Y-%m-%d-%H.%M)"" $COMMITCOMMENT" ; git push ; } ; 
sum=$(find -type f -exec md5sum {} \;|grep -v ".git" |md5sum);

while (true);do 
  sleep 10;
  sum_cur=$(find -type f -exec md5sum {} \;|grep -v ".git" |md5sum);
  if [ "$sum" == "$sum_cur" ] ; then 
      echo -ne "\rnothing changed@"$(date -u);
  else
      git_commitpush|sed 's/^/|/g' |tr -d '\n' ; sum="$sum_cur";
  fi;
  done
