#!/bin/bash

mkdir -p build
mkdir -p out/swiftshader 

# Change the --parallel parameter to the number of jobs for your infra
docker run --name swiftshader-builder aws-linux-swiftshader-builder:latest bash -c "cd ~ && git clone https://github.com/diegoparrilla/swiftshader.git && cd ~/swiftshader/build && cmake .. && cmake --build . --parallel 4 && ./vk-unittests"

docker cp swiftshader-builder:/root/swiftshader/build/Linux/libEGL.so $(pwd)/out/swiftshader/
docker cp swiftshader-builder:/root/swiftshader/build/Linux/libGLESv2.so $(pwd)/out/swiftshader/

docker rm swiftshader-builder

pushd out
zip -r swiftshader.zip swiftshader
popd

Echo "The libraries are in out/swiftshader.zip"