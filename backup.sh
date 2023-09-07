#! /bin/sh

set -e

if [ "${SOURCE_ALIAS_NAME}" == "**Empty**" ]; then
  echo "Error: You did not set the SOURCE_ALIAS_NAME environment variable."
  exit 1
fi

if [ "${SOURCE_ENDPOINT}" == "**Empty**" ]; then
  echo "Error: You did not set the SOURCE_ENDPOINT environment variable."
  exit 1
fi

if [ "${SOURCE_ACCESS_KEY}" == "**Empty**" ]; then
  echo "Error: You did not set the SOURCE_ACCESS_KEY environment variable."
  exit 1
fi

if [ "${SOURCE_SECRET_KEY}" == "**Empty**" ]; then
  echo "Error: You did not set the SOURCE_SECRET_KEY environment variable."
  exit 1
fi

if [ "${DESTINATION_ALIAS_NAME}" == "**Empty**" ]; then
  echo "Error: You did not set the DESTINATION_ALIAS_NAME environment variable."
  exit 1
fi

if [ "${DESTINATION_ENDPOINT}" == "**Empty**" ]; then
  echo "Error: You did not set the DESTINATION_ENDPOINT environment variable."
  exit 1
fi

if [ "${DESTINATION_ACCESS_KEY}" == "**Empty**" ]; then
  echo "Error: You did not set the DESTINATION_ACCESS_KEY environment variable."
  exit 1
fi

if [ "${DESTINATION_SECRET_KEY}" == "**Empty**" ]; then
  echo "Error: You did not set the DESTINATION_SECRET_KEY environment variable."
  exit 1
fi

if [ "${EXTRA_ARG}" == "**Empty**" ]; then
  EXTRA_ARG=""
fi

echo $EXTRA_ARG

./mc alias set $SOURCE_ALIAS_NAME $SOURCE_ENDPOINT $SOURCE_ACCESS_KEY $SOURCE_SECRET_KEY
./mc alias set $DESTINATION_ALIAS_NAME $DESTINATION_ENDPOINT $DESTINATION_ACCESS_KEY $DESTINATION_SECRET_KEY

./mc mirror --overwrite $EXTRA_ARG $SOURCE_ALIAS_NAME $DESTINATION_ALIAS_NAME
