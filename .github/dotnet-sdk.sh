#!/bin/bash

INSTALL_DIR="${HOME}/.wine/drive_c/Programs/dotnet"
mkdir -p ${INSTALL_DIR}
wget -O "${INSTALL_DIR}/dotnet-sdk.zip" "https://download.visualstudio.microsoft.com/download/pr/5b2c6cee-abe2-4734-a099-729a346205e7/b5776361ebee2e1eeed9be4aad944652/dotnet-sdk-6.0.428-win-x64.zip"
unzip "${INSTALL_DIR}/dotnet-sdk.zip" -d "${INSTALL_DIR}"