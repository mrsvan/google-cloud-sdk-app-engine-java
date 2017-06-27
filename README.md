# google-cloud-sdk-app-engine-java

[![GitHub License](https://img.shields.io/github/license/mrsvan/google-cloud-sdk-app-engine-java.svg?style=flat-square)]()
[![GitHub Contributors](https://img.shields.io/github/contributors/mrsvan/google-cloud-sdk-app-engine-java.svg?style=flat-square)]()
[![GitHub closed pull requests](https://img.shields.io/github/issues-pr-closed/mrsvan/google-cloud-sdk-app-engine-java.svg?style=flat-square)]()
[![GitHub pull requests](https://img.shields.io/github/issues-pr/mrsvan/google-cloud-sdk-app-engine-java.svg?style=flat-square)]()
[![GitHub closed issues](https://img.shields.io/github/issues-closed/mrsvan/google-cloud-sdk-app-engine-java.svg?style=flat-square)]()
[![GitHub pull requests](https://img.shields.io/github/issues-pr/mrsvan/google-cloud-sdk-app-engine-java.svg?style=flat-square)]()

A very rudimentary maven container with google-cloud-skd-app-engine-java installed.

This container is very useful for building GAE applications using the latest appengine-maven-plugin:

```XML
<dependency>
    <groupId>com.google.cloud.tools</groupId>
    <artifactId>appengine-maven-plugin</artifactId>
    <version>1.1.0-beta</version>
</dependency>
```

---

Before you can use the plugin to upload your GAE app, you need to configure the authentication:

```Bash
echo $DEPLOY_KEY_FILE_PRODUCTION > .gitlab-ci.keyfile.json
gcloud auth activate-service-account --key-file .gitlab-ci.keyfile.json
```

---
[![Docker Build Status](https://img.shields.io/docker/build/mrsvan/google-cloud-sdk-app-engine-java.svg?style=flat-square)]()
[![Docker Automated build](https://img.shields.io/docker/automated/mrsvan/google-cloud-sdk-app-engine-java.svg?style=flat-square)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/mrsvan/google-cloud-sdk-app-engine-java.svg?style=flat-square)]()
[![Docker Strars](https://img.shields.io/docker/stars/mrsvan/google-cloud-sdk-app-engine-java.svg?style=flat-square)]()
 
This dockerfile is originally published to the docker repository: https://hub.docker.com/r/mrsvan/google-cloud-sdk-app-engine-java/ 
