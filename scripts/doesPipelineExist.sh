#!/bin/bash
PIPELINE_NAME=spring-build-and-deploy-$1
echo "Checking if pipeline $PIPELINE_NAME exists"
PIPELINE_EXISTS=false
for pipeline in `aws codepipeline list-pipelines | yq '.pipelines[].name'`; do
    if [ "$pipeline" = "$PIPELINE_NAME" ]; then
    PIPELINE_EXISTS=true
    break
    fi
done

if [ $PIPELINE_EXISTS ]
then
    echo "pipeline exists!"
    exit 1
else
    echo "pipeline does not exist!"
    exit 0
fi