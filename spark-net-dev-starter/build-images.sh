#!/bin/bash

docker build ./spark-dotnet-base -t zarusz/spark-dotnet-base
docker build ./spark-dotnet-standalone -t zarusz/spark-dotnet-standalone
docker build ./spark-dotnet-submit -t zarusz/spark-dotnet-submit