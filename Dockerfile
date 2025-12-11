FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:alpine

MAINTAINER Stefaan Vanderheyden <svd@nuuvo.mobi>

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk

# Install JDK 8, Maven, and other dependencies
RUN apk add --no-cache \
    openjdk8 \
    openjdk8-jre \
    maven \
    git \
    bash \
    jq \
    openssl && \
    # Verify Maven is installed
    mvn --version && \
    # Install artifactory SSL certificate into Java truststore
    echo -n | openssl s_client -connect artifactory.nuuvo.mobi:443 2>/dev/null | openssl x509 > /tmp/artifactory.crt && \
    keytool -import -trustcacerts -noprompt -alias artifactory \
    -file /tmp/artifactory.crt \
    -keystore ${JAVA_HOME}/jre/lib/security/cacerts \
    -storepass changeit && \
    rm /tmp/artifactory.crt && \
    # Configure gcloud
    gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true && \
    gcloud config set metrics/environment github_docker_image && \
    # Install App Engine Java components
    gcloud components install app-engine-java --quiet

# Set Python 3 as default
RUN ln -sf /usr/bin/python3 /usr/bin/python

# Verify all tools are available
RUN java -version && \
    mvn --version && \
    python --version && \
    gcloud version

WORKDIR /workspace
