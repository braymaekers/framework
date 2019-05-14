#!/bin/bash

# Set Environment
ROOT_DIR="$PWD"/../../..

export PROJECT_NAME=$(basename $(dirname $PWD) -configuration)
PENTAHO_ENV="${PENTAHO_ENV:-config-pdi-local}"

echo "***" Running with "$PENTAHO_ENV" environment settings "***"

# Load Environment Configuration
. $ROOT_DIR/$PROJECT_NAME-configuration/$PENTAHO_ENV/env.conf
echo "***" Setting PENTAHO_HOME to $PENTAHO_HOME "***"

# Set Additional Variables
export KETTLE_CLIENT_DIR=$PENTAHO_HOME/design-tools/data-integration
echo "***" Setting KETTLE_CLIENT_DIR to $KETTLE_CLIENT_DIR "***"
export KETTLE_HOME=$ROOT_DIR/$PROJECT_NAME-configuration/$PENTAHO_ENV
echo "***" Setting KETTLE_HOME to $KETTLE_HOME "***"
export KETTLE_META_HOME=$ROOT_DIR/$PROJECT_NAME-configuration/$PENTAHO_ENV
echo "***" Setting KETTLE_META_HOME to $KETTLE_META_HOME "***"
export OPT="$OPT -DPENTAHO_METASTORE_FOLDER=$KETTLE_META_HOME"
