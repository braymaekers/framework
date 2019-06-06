. ./init.sh
sh $KETTLE_CLIENT_DIR/kitchen.sh $OPT "$@"

EXIT_CODE=$?
exit $EXIT_CODE
