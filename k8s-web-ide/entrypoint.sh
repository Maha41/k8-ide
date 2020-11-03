#!/bin/bash

DEFAULT_DIRECTORY=""
TUTORIALS_REPO=https://github.com/Maha41/k8-ide.git
if [[ ${TUTORIALS_REPO} != "" ]]; then
    echo "Cloning workspace content from git repo"
    # This will do a quick, shallow clone of the repo
    git clone --depth 1 ${TUTORIALS_REPO} /home/coder/gitclone
    # If TUTORIALS_DIR is "." or "", this will copy the whole git repo.
    mkdir -p /home/coder/project
    mv /home/coder/gitclone/${TUTORIALS_DIR}/* /home/coder/project
    sudo rm -r /home/coder/gitclone
    echo "Initialized workspace content from git repo ${TUTORIALS_REPO} with subdir ${TUTORIALS_DIR}"
    DEFAULT_DIRECTORY="/home/coder/project"
fi

sudo chown $(id -u):$(id -g) /var/run/docker.sock

# By default run behind a Let's Encrypt proxy, so expose this traffic using insecure HTTP
exec code-server --host=0.0.0.0 --no-auth --disable-telemetry ${DEFAULT_DIRECTORY}