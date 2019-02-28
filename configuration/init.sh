#!/bin/bash

# Set Environment
ROOT_DIR="$PWD"/../../..
PENTAHO_ENV="${PENTAHO_ENV:-config-pdi-local}"

echo Running with "$PENTAHO_ENV" environment settings

# Load Environment Configuration
. $ROOT_DIR/$PROJECT_NAME/configuration/$PENTAHO_ENV/env.conf
echo PENTAHO_HOME = $PENTAHO_HOME

# Set Additional Variables
export KETTLE_CLIENT_DIR=$PENTAHO_HOME/design-tools/data-integration
echo KETTLE_CLIENT_DIR=$KETTLE_CLIENT_DIR
export KETTLE_HOME=$ROOT_DIR/$PROJECT_NAME/configuration/$PENTAHO_ENV
echo KETTLE_HOME = $KETTLE_HOME
export KETTLE_META_HOME=$ROOT_DIR/$PROJECT_NAME/configuration/$PENTAHO_ENV
echo KETTLE_META_HOME=$KETTLE_META_HOME
export OPT="$OPT -DPENTAHO_METASTORE_FOLDER=$KETTLE_META_HOME"
