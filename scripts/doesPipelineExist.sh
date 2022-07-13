#!/bin/bash
PIPELINE_NAME=spring-build-and-deploy-$1

for pipeline in `aws codepipeline list-pipelines | yq '.pipelines[].name'`; do
    if [ "$pipeline" = "$PIPELINE_NAME" ]; then
    echo 1
    exit
    fi
done

echo 0