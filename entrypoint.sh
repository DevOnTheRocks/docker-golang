#!/bin/ash
sleep 5

cd /home/container

wget https://redirector.gvt1.com/edgedl/go/go${VERSION}.${OS}-${ARCH}.tar.gz
tar -C /usr/local -xzf go${VERSION}.${OS}-${ARCH}.tar.gz
rm go${VERSION}.${OS}-${ARCH}.tar.gz

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}

if [ $? -ne 0 ]; then
    echo "PTDL_CONTAINER_ERR: There was an error while attempting to run the start command."
    exit 1
fi