#!/bin/bash
nmln=`grep  "name:" helm/ph-ee-engine/Chart.yaml`
verln=`grep  "version:" helm/ph-ee-engine/Chart.yaml`
nm=`echo $nmln |cut -d ' ' -f 2`
ver=`echo $verln |cut -d ' ' -f 2`
export phee-engine-release_tag="$nm-$ver"
echo "done"
