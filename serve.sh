#!/usr/bin/env bash

#/snap/hugo/current/bin/hugo server --bind=0.0.0.0 --baseURL=http://guansong.wang/
hugo server --bind=0.0.0.0 --baseURL=http://guansong.wang:1313/ --buildDrafts --logLevel info
#hugo server --bind=0.0.0.0 --baseURL=http://guansong.wang/ --buildDrafts --verbose
#hugo server --disableFastRender --i18n-warnings
