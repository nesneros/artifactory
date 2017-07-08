FROM tomcat:8.5-alpine

# At the time of writing the newest version is 5.4.4. This doesn't start because it can't find the derby driver class
ENV ARTIFACTORY_VERSION=5.1.4 \
    ARTIFACTORY_HOME=/artifactory

RUN rm -rf webapps/

RUN apk add --update openssl unzip \
    && wget -O artifactory.zip https://jfrog.bintray.com/artifactory/jfrog-artifactory-oss-${ARTIFACTORY_VERSION}.zip \
    && unzip -j artifactory.zip "artifactory-*/webapps/artifactory.war" -d webapps/ \
    && rm artifactory.zip \
    && apk del openssl unzip

WORKDIR /artifactory
