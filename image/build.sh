#!/bin/bash
strOpenSSLVersion=$SSLVERSION
mkdir -p /opt/building
mkdir -p /opt/out
cd /opt/building
wget -nv "https://www.openssl.org/source/openssl-$strOpenSSLVersion.tar.gz"
tar xf "openssl-$strOpenSSLVersion.tar.gz"
cd "/opt/building/openssl-$strOpenSSLVersion"
./Configure linux-generic64 --prefix=/opt/out --openssldir=/opt/out/ no-shared no-ssl2 no-ssl3  no-weak-ssl-ciphers  no-err no-engine no-hw
make -j
make install_sw
cd /opt/rel
tar czf "/opt/rel/openssl-$strOpenSSLVersion-static-$(date "+%Y-%m-%d_%H-%M-%S").tgz" ./*
