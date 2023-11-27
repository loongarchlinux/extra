#!/bin/bash

java_options=(
  -jar /usr/share/java/epubcheck/epubcheck.jar
)
PATH="/usr/lib/jvm/java-JAVA_VERSION-openjdk/bin:$PATH"

exec java "${java_options[@]}" "$@"
