#!/bin/bash

aws_config() {

#installing aws cli

	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
        unzip awscliv2.zip
	./aws/install

}

aws_config
