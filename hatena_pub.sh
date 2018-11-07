#!/bin/bash
set -eu

HATENA_ATOM_ENTRY_PREFIX='<?xml version="1.0" encoding="utf-8"?><entry xmlns="http://www.w3.org/2005/Atom" xmlns:app="http://www.w3.org/2007/app"><title>'
HATENA_ATOM_ENTRY_TITLE_SUFFIX='</title><content type="text/x-markdown">'
HATENA_ATOM_ENTRY_SUFFIX='</content></entry>'
HATENA_ATOM_ENTRY_MD=`ruby -e 'puts ARGF.read.sub(/\A---.*---/m, "")' $2 | perl -pe 's/\n/&#x0A;/g'`

curl  -X POST -u ${HATENA_NAME}:${HATENA_PASS} https://blog.hatena.ne.jp/${HATENA_NAME}/${HATENA_DOMAIN}/atom/entry  -H "Content-Type: text/xml" -d "${HATENA_ATOM_ENTRY_PREFIX}$1${HATENA_ATOM_ENTRY_TITLE_SUFFIX}${HATENA_ATOM_ENTRY_MD}${HATENA_ATOM_ENTRY_SUFFIX}"
