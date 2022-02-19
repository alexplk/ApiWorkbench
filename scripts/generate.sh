#!/usr/bin/env bash

# See https://openapi-generator.tech/docs/usage

# set -euo pipefail

# GEN_DIR allows to share the entrypoint between Dockerfile and run-in-docker.sh (backward compatible)
GEN_DIR="./cli" # ${GEN_DIR:-/opt/swagger-codegen}
JAVA_OPTS=${JAVA_OPTS:-"-Xmx1024M -Dlogback.configurationFile=conf/logback.xml"}

cli="${GEN_DIR}"
jar="${cli}/openapi-generator-cli-5.3.0.jar"

# (cd "${GEN_DIR}" && exec mvn -Duser.home=$(dirname MAVEN_CONFIG) package)
spec=$1

shift

exec java ${JAVA_OPTS} -jar "${jar}" \
  generate \
  -i "${spec}" \
  -g typescript-angular \
  -o ./out

 # "$@"
