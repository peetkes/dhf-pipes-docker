#!/usr/bin/env bash

cat >application.properties <<EOF
server.port=8081

mlHost=$STACK_NAME.dhf.local
mlStagingPort=$STAGING_PORT
mlAppServicesPort=$APPSERVICES_PORT
mlAdminPort=$ADMIN_PORT
mlManagePort=$MANAGE_PORT
mlModulesDatabase=data-hub-MODULES
mlUsername=$MARKLOGIC_ADMIN_USERNAME
mlPassword=$MARKLOGIC_ADMIN_PASSWORD
mlDhfRoot=$DHF_ROOT
EOF

exec "$@"