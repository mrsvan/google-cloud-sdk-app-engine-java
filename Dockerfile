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

FROM zenika/alpine-maven:3-jdk-7
MAINTAINER Stefaan Vanderheyden <svd@nuuvo.mobi>
ARG CLOUD_SDK_VERSION=157.0.0
ARG SHA256SUM=95b98fc696f38cd8b219b4ee9828737081f2b5b3bd07a3879b7b2a6a5349a73f
ENV PATH /usr/src/app/google-cloud-sdk/bin:$PATH
RUN apk --no-cache add git curl python bash libc6-compat java-cacerts && \
    ln -sf /etc/ssl/certs/java/cacerts $JAVA_HOME/jre/lib/security/cacerts
    curl -L -o crcmod.tar.gz "https://downloads.sourceforge.net/project/crcmod/crcmod/crcmod-1.7/crcmod-1.7.tar.gz" && \
    tar -xzf crcmod.tar.gz && \
    cd crcmod-1.7/ && \
    python setup.py install && \
    cd .. && \
    curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    echo "${SHA256SUM}  google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz" > google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz.sha256 && \
    sha256sum -c google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz.sha256 && \
    tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    rm google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz.sha256 && \
    ln -s /lib /lib64 && \
    gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true && \
    gcloud config set metrics/environment github_docker_image
VOLUME ["/root/.config"]
