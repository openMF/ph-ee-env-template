#!/bin/bash
helm package ph-ee-engine
helm repo index .

cp *.tgz index.yaml /usr/share/nginx/html/
echo "deployed to local repo"

