#!/bin/bash
cd ph-ee-engine
#rm charts/*
helm dep up
cd -

helm package ph-ee-engine
helm repo index .

cp *.tgz index.yaml /usr/share/nginx/html/
#rm ph-ee-engine*.tgz
echo "deployed to local repo"

scp index.yaml ph-ee-engine-1.0.0-SNAPSHOT.tgz jenkins.mifos.io:/srv/data/helm-charts/
echo "deployed to remote helm repo"

