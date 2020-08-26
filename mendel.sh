#!/bin/sh

root_path=$(pwd)
mkdir src; cd src;

echo "init & sync"
now=$(date +"%T")
echo "Current time : $now"
repo init -u https://coral.googlesource.com/manifest
repo sync -j$(nproc)

cd linux-imx
patch -p1 <  ../../0001-849b2e3ff9698226ab91e034d52cbb1da92a5b4c.patch
cd ..

source build/setup.sh

echo "m kernel"
now=$(date +"%T")
echo "Current time : $now"
m docker-linux-imx

echo "m"
now=$(date +"%T")
echo "Current time : $now"

m
