#!/bin/bash
#注释长度不为零才可提交
if [ -z $1 ]
then
    echo "======请填写提交注释======"
else
    git add .
    git commit -m $1
    git pull
    git push origin master
    echo "======提交成功======"
fi
