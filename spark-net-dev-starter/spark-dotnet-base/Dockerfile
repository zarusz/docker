FROM ubuntu:18.04

ENV SCALA_VERSION=2.12.4
ENV SCALA_HOME=/usr/share/scala
ENV SBT_VERSION=1.2.8
ENV SPARK_VERSION=2.4.3
ENV HADOOP_VERSION=2.7
ENV DOTNET_VERSION=2.1.11
ENV SPARK_DOTNET_VERSION=0.3.0

# Install tools required
RUN apt-get -y update \
    && apt-get -y install bash procps coreutils wget

# Install OpenJDK
RUN apt-get -y install openjdk-8-jdk \
    && update-alternatives --config java

# Install Maven
RUN mkdir -p ~/bin/maven \
    && cd ~/bin/maven \
    && wget --no-verbose https://www-us.apache.org/dist/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz \
    && tar -xvzf apache-maven-3.6.0-bin.tar.gz \
    && ln -s apache-maven-3.6.0 current \
    && export M2_HOME=~/bin/maven/current \
    && export PATH=${M2_HOME}/bin:${PATH}

# Install Spark
RUN wget --no-verbose -O spark.tgz http://ftp.man.poznan.pl/apache/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && mkdir /spark \
    && tar -xvzf spark.tgz -C /spark --strip-components=1 \
    && rm spark.tgz

# Install NET Core SDK
RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && apt-get -y install apt-transport-https \
    && apt-get update \
    && apt-get -y install dotnet-sdk-2.1

# Install Spark .NET
RUN wget --no-verbose -O Microsoft.Spark.Worker.tar.gz https://github.com/dotnet/spark/releases/download/v${SPARK_DOTNET_VERSION}/Microsoft.Spark.Worker.netcoreapp2.1.linux-x64-${SPARK_DOTNET_VERSION}.tar.gz \
    && mkdir -p /usr/share/Microsoft.Spark.Worker \
    && tar -C /usr/share/Microsoft.Spark.Worker -xzf Microsoft.Spark.Worker.tar.gz \
    && rm Microsoft.Spark.Worker.tar.gz \
    && export DOTNET_WORKER_DIR="/usr/share/Microsoft.Spark.Worker"

# This was prebuild (https://github.com/dotnet/spark/blob/master/docs/building/ubuntu-instructions.md#building-spark-net-scala-extensions-layer)
COPY microsoft-spark-2.3.x-0.3.0.jar /usr/share/Microsoft.Spark.Worker
COPY microsoft-spark-2.4.x-0.3.0.jar /usr/share/Microsoft.Spark.Worker
