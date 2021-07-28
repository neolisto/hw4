#!/bin/bash

#creating of temporary folder
mkdir tmp

#jump into temporary folder
cd tmp

#git-clone of project with needed configs for server
git clone https://github.com/sentialabs/scarlet.git

#returning to working folder
cd ..

#copying of web-server configs
cp -r tmp/scarlet/apache-docker/conf.d/ conf.d/

#running of docker build process
docker build . > tmp/logs.txt

#image id in var
k=`cat tmp/logs.txt |grep Successfully | cut -d' ' -f3`

#cleaning
rm -r tmp
rm -r conf.d/

#run container with from true-named image
docker run -d -p80:80 "$k"
