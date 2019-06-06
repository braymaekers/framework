#!/bin/bash

# Set Environment
ROOT_DIR="$PWD"/../..
PROJECT_ENV="${PROJECT_ENV:-config-pdi-local}"

echo "***" Running with "$PROJECT_ENV" environment settings "***"

# Load Environment Configuration
. $ROOT_DIR/$PROJECT_NAME-configuration/$PROJECT_ENV/env.conf
echo "***" Setting PENTAHO_HOME to $PROJECT_HOME "***"

# Set Additional Variables
export KETTLE_CLIENT_DIR="${KETTLE_CLIENT_DIR:-$PENTAHO_HOME/design-tools/data-integration}"
export KETTLE_HOME=$ROOT_DIR/$PROJECT_NAME-configuration/$PROJECT_ENV
export KETTLE_META_HOME=$ROOT_DIR/$PROJECT_NAME-configuration/$PROJECT_ENV
export OPT="$OPT -DPENTAHO_METASTORE_FOLDER=$KETTLE_META_HOME"

echo "***" Setting KETTLE_CLIENT_DIR to $KETTLE_CLIENT_DIR "***"
echo "***" Setting KETTLE_HOME to $KETTLE_HOME "***"
echo "***" Setting KETTLE_META_HOME to $KETTLE_META_HOME "***"
