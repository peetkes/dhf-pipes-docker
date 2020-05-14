#!/usr/bin/env bash

cat >application.properties <<EOF
server.port=$SERVER_PORT
EOF

cat >project/gradle-docker.properties <<EOF
mlUsername=$MARKLOGIC_ADMIN_USERNAME
mlPassword=$MARKLOGIC_ADMIN_PASSWORD
mlHost=$STACK_NAME.dhf.local
EOF

exec "$@"