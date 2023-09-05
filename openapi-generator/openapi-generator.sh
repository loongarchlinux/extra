#!/usr/bin/env sh

PATH="/usr/lib/jvm/java-JAVA_VERSION-openjdk/bin:${PATH}"
java -jar /usr/share/java/openapi-generator/openapi-generator-cli.jar "$@"
