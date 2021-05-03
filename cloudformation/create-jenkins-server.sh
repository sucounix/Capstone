#!/usr/bin/env bash

aws cloudformation create-stack --stack-name "capstone-stack" --template-body file://jenkins-server.yaml --region=us-west-2