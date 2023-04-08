#!/bin/bash

# 1. 生成静态文件
hexo generate

# 2. 提交当前分支的所有修改
git add .
git commit -m "Update site"
git push github master

# 3. 切换到 build 分支并将 public 文件夹复制到该分支
git checkout build
git checkout master -- public/
git add .
git commit -m "Update build branch"
git push github build

git checkout master