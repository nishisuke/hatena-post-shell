#!/bin/bash
set -eu

POST_TITLE=$1
POST_MD_FILE=$2

./hatena_pub.sh $POST_TITLE $POST_MD_FILE
./qiita_post.sh $POST_TITLE $POST_MD_FILE
