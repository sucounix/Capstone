#!/usr/bin/env bash

aws cloudformation create-stack --stack-name "capstone-stack" --template-body file://jenkins-server.yaml --region=us-west-2
eksctl create cluster \
    --name capstonecluster \
    --version 1.19 \
    --nodegroup-name standard-workers \
    --node-type t2.small \
    --nodes 2 \
    --nodes-min 1 \
    --nodes-max 3 \
    --node-ami auto \
    --region us-west-2 \
    --zones us-west-2a \
    --zones us-west-2b \
    --zones us-west-2c 