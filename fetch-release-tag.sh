#!/bin/bash
nm=`grep  "name:" helm/ph-ee-engine/Chart.yaml |cut -d ' ' -f 2`
ver=`grep  "version:" helm/ph-ee-engine/Chart.yaml |cut -d ' ' -f 2`
phee_engine_release_tag=`echo $nm-$ver`
export phee_engine_release_tag
echo $phee_engine_release_tag
