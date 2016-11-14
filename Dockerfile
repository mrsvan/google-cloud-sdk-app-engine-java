# A very rudimentary maven container with google-cloud-skd-app-engine-java installed.
#
# This container is very useful for building GAE applications using the latest appengine-maven-plugin:
# 
# <dependency>
#     <groupId>com.google.cloud.tools</groupId>
#     <artifactId>appengine-maven-plugin</artifactId>
#     <version>1.1.0-beta</version>
# </dependency>
# 
# Before you can use the plugin to upload your GAE app, you need to configure the authentication:
# 
# 'echo $DEPLOY_KEY_FILE_PRODUCTION > .gitlab-ci.keyfile.json'
# 'gcloud auth activate-service-account --key-file .gitlab-ci.keyfile.json'

FROM maven:3.3.9-jdk-7

MAINTAINER Stefaan Vanderheyden <svd@nuuvo.mobi>

RUN apt-get update && apt-get install -y apt-transport-https
RUN echo "deb https://packages.cloud.google.com/apt cloud-sdk-jessie main" | tee /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN apt-get update && apt-get upgrade -y && apt-get install -y google-cloud-sdk google-cloud-sdk-app-engine-java
