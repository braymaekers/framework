#!/bin/bash

# Set Environment
ROOT_DIR="$PWD"/../..
PROJECT_ENV="${PROJECT_ENV:-config-pdi-local}"

echo "***" ROOT_DIR: "$ROOT_DIR" "***"
echo "***" Running with "$PROJECT_ENV" environment settings "***"

# Load Environment Configuration
#. $ROOT_DIR/$PROJECT_NAME-configuration/$PROJECT_ENV/env.conf
. $BASE_CONFIG_DIR/env.linux.conf
echo "***" Setting PENTAHO_HOME to $PENTAHO_HOME "***"

# Set Additional Variables
export KETTLE_CLIENT_DIR="${KETTLE_CLIENT_DIR:-$PENTAHO_HOME/design-tools/data-integration}"
export KETTLE_HOME=$BASE_CONFIG_DIR
export KETTLE_META_HOME=$BASE_CONFIG_DIR
export OPT="$OPT -DPENTAHO_METASTORE_FOLDER=$KETTLE_META_HOME"
#-DROOT_DIR=$ROOT_DIR -DPROJECT_ENV=$PROJECT_ENV -DPROJECT_NAME=$PROJECT_NAME

echo "***" Setting KETTLE_CLIENT_DIR to $KETTLE_CLIENT_DIR "***"
echo "***" Setting KETTLE_HOME to $KETTLE_HOME "***"
echo "***" Setting KETTLE_META_HOME to $KETTLE_META_HOME "***"
