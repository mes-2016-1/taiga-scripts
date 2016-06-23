#!/bin/bash

FRONTEND_VERSION="colab_taiga"

pushd ~

cat > /tmp/conf.json <<EOF
{
    "api": "/api/v1/",
    "eventsUrl": null,
    "debug": "true",
    "publicRegisterEnabled": true,
    "feedbackEnabled": false,
    "privacyPolicyUrl": null,
    "termsOfServiceUrl": null,
    "maxUploadFileSize": null,
    "gitHubClientId": null,
    "contribPlugins": []
}
EOF


if [ ! -e ~/taiga-front ]; then
    # Initial clear
    git clone https://github.com/mes-2016-1/taiga-front-dist.git taiga-front
    pushd ~/taiga-front
    git checkout -f colab_taiga

    mv /tmp/conf.json dist/

    popd
else
    pushd ~/taiga-front
    git fetch
    git checkout -f colab_taiga 
    git reset --hard origin/colab_taiga
    popd
fi

popd
