#!/bin/bash

# 从 GitHub 拉取代码更新
git pull github master

# 执行 hexo generate
hexo generate
