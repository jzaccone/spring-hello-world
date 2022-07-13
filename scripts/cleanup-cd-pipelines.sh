#!/bin/bash
PIPELINE_STACK=spring-boot-pipeline-$1

echo "Deleting $PIPELINE_STACK stack" 
aws cloudformation delete-stack --stack-name $PIPELINE_STACK
aws cloudformation wait stack-delete-complete --stack-name $PIPELINE_STACK 
aws cloudformation delete-stack --stack-name $PIPELINE_STACK  --retain-resources "ArtifactStoreBucket"