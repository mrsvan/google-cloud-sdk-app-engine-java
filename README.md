# google-cloud-sdk-app-engine-java
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

This dockerfile is published automatically to the docker repository: https://hub.docker.com/r/mrsvan/google-cloud-sdk-app-engine-java/
