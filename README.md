# Amazon Linux 2 Swiftshader builder

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## TL;DR
Image with CMake and all the libraries to build swiftshader for Amazon Linux 2

## Introduction

This docker image is the base to build the [Swiftshader](https://github.com/diegoparrilla/swiftshader) libraries, needed to run a headless chromium process in AWS lambda for Python 3.8 and also other newer AWS lambda runtimes. 

SwiftShader is a high-performance CPU-based implementation of the Vulkan, OpenGL ES, and Direct3D 9 graphics APIs. Its goal is to provide hardware independence for advanced 3D graphics.

## How to use the image

An already built image is hosted [here](). Please below how to build the library.

## How to create the image

If you want to build your own image please execute the `build-image.sh` script in this folder. Please change the execution permissions of the file if needed. Example:

```
./build-image.sh
```

After several minutes the script will create the image `aws-linux-swiftshader-builder`. Type `docker images` to verify the image is in the local Docker repository:

```
➜  amazonlinux2-swiftshader-builder git:(main) ✗ docker images
REPOSITORY                               TAG               IMAGE ID       CREATED        SIZE
aws-linux-swiftshader-builder            latest            5eb1216c4dba   6 hours ago    1.55GB
```

## How to build the Swiftshader libraries

To build the library launch the shell script `build-libs.sh` in this folder. Don't forget to add execution permissions if needed. Example:

```
./build-libs.sh
```

This script will create the `swiftshader.zip` file in the `/out` folder with the following libraries:

```
swiftshader/libGLESv2.so
swiftshader/libEGL.so
```

## What's next?

Once you have this libraries you should build a new AWS Lambda layer containing the libraries as described [here]().

## Contributing

This project is open to collaboration. It was created to simplify the creation of an AWS Lambda Layer for Chromedriver and Selenium, but feel free send your PR and share your thoughts.


## Contact Us

Do you have an issue? Or perhaps some feedback for how we can improve? Feel free to let us know on
our `issue tracker <https://github.com/diegoparrilla/amazonlinux2-swiftshader-builder/issues>`__
