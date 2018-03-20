if [ -z "${WERCKER_SCREENSHOT_FILENAME}" ]
then
    echo "filename is empty.Please specify correct filename in step arguments."
    exit 1
fi
FILE_PARENT_PATH=${WERCKER_SCREENSHOT_FILENAME%/*}
FILE_NAME=${WERCKER_SCREENSHOT_FILENAME##*/}
IS_FILE_PATH_ABSOLUTE="false"
if [[ $WERCKER_SCREENSHOT_FILENAME == /* ]]
then
    IS_FILE_PATH_ABSOLUTE="true"
fi
if [ "${FILE_PARENT_PATH}" != "${FILE_NAME}" ]
then
    if [ -z "${WERCKER_SCREENSHOT_CREATE_FILE_IN_ARTIFACTS}" ] || [ "false" == "${WERCKER_SCREENSHOT_CREATE_FILE_IN_ARTIFACTS}" ]
    then
        if [ "false" == $IS_FILE_PATH_ABSOLUTE ]
        then
            FILE_PARENT_PATH=${WERCKER_SOURCE_DIR}/${FILE_PARENT_PATH}
        fi
    else
        FILE_PARENT_PATH=${WERCKER_REPORT_ARTIFACTS_DIR}/${FILE_PARENT_PATH}
    fi    
else
    if [ -z "${WERCKER_SCREENSHOT_CREATE_FILE_IN_ARTIFACTS}" ] || [ "false" == "${WERCKER_SCREENSHOT_CREATE_FILE_IN_ARTIFACTS}" ]
    then
        FILE_PARENT_PATH=${WERCKER_SOURCE_DIR}
    else
        FILE_PARENT_PATH=${WERCKER_REPORT_ARTIFACTS_DIR}
    fi
fi
if [  ! -d "${FILE_PARENT_PATH}" ]
then
    mkdir -p ${FILE_PARENT_PATH}
fi
FILE_PATH=${FILE_PARENT_PATH}/${FILE_NAME}
echo "Screenshot will be created at ${FILE_PATH}"
phantomjs --ignore-ssl-errors=true $WERCKER_STEP_ROOT/screenshot.js $WERCKER_SCREENSHOT_URL \
    ${FILE_PATH} \
    $WERCKER_SCREENSHOT_VIEWPORT_WIDTH \
    $WERCKER_SCREENSHOT_VIEWPORT_HEIGHT
