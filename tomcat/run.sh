#!/bin/sh

cd ${TOMCAT_HOME} || exit 1;
chown -R ${PUID}:${PGID} /opt/*tomcat*;

if [ -z "$1" ];
then cmd="run";
else cmd=""$1;
fi;

shift;
s6-setuidgid ${PUID}:${PGID} /opt/tomcat/bin/catalina.sh ${cmd} $@;

