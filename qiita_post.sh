#!/bin/bash
set -eu

QIITA_BLOG_CONTENT_MD=`ruby -e 'p ARGF.read.sub(/\A---.*---/m, "")' $2`
QIITA_BLOG_TITLE=$1
QIITA_JSON_PREFIX='{"body": '
QIITA_JSON_MIDDLE=',"gist": false,"private": false,"tags": [{"name": "blog"}],"title": "'
QIITA_JSON_SUFFIX='","tweet": false}'

curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer ${QIITA_API_TOKEN}" https://qiita.com/api/v2/items -d "${QIITA_JSON_PREFIX}`echo $QIITA_BLOG_CONTENT_MD`${QIITA_JSON_MIDDLE}${QIITA_BLOG_TITLE}${QIITA_JSON_SUFFIX}"
