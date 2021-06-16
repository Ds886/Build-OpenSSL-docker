#!/bin/bash
touch ./OpenSSL-buildlog.log
exec &> >(tee  -a ./OpenSSL-buildlog.log)

strOpenSSLVersion="1.1.1k"

if ! [ -z $1 ]; then
	strOpenSSLVersion=$1
fi

echo "Buiding SSL version: $strOpenSSLVersion"

docker build -t dash/buildssl:latest ./image
cd ..
mkdir release
docker run --mount type=bind,source="$(pwd)/release",target=/opt/rel --env SSLVERSION=$strOpenSSLVersion dash/buildssl:latest
