#!/bin/sh

if [ -z "$PYCHARM_JDK" ] ; then
  PYCHARM_JDK="/usr/lib/jvm/java-17-openjdk/"
fi
# use JBR if exists
if [ -d "/usr/share/pycharm/jbr/" ] ; then
  PYCHARM_JDK="/usr/share/pycharm/jbr/"
fi
# open-jfx location that should match the JDK version
if [ -z "$PYCHARM_JFX" ] ; then
  PYCHARM_JFX="/usr/lib/jvm/java-17-openjfx/"
fi
# classpath according to defined JDK/JFX
if [ -z "$PYCHARM_CLASSPATH" ] ; then
  PYCHARM_CLASSPATH="${PYCHARM_JDK}/lib/*:${PYCHARM_JFX}/lib/*"
fi

exec env PYCHARM_JDK="$PYCHARM_JDK" PYCHARM_CLASSPATH="$PYCHARM_CLASSPATH" /usr/share/pycharm/bin/pycharm.sh "$@"

# vim: ts=2 sw=2 et:
