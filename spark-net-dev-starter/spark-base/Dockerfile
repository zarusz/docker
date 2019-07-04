FROM java:8-jdk-alpine

ENV DAEMON_RUN=true
ENV SCALA_VERSION=2.12.4
ENV SCALA_HOME=/usr/share/scala
ENV SBT_VERSION=1.2.8
ENV SPARK_VERSION=2.4.3
ENV HADOOP_VERSION=2.7
ENV DOTNET_VERSION=2.1.11
ENV SPARK_DOTNET_VERSION=0.3.0

# Install Scala
RUN apk add --no-cache --virtual=.build-dependencies wget ca-certificates && \
    apk add --no-cache bash curl jq procps coreutils && \
    cd "/tmp" && \
    wget --no-verbose "https://downloads.typesafe.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz" && \
    tar xzf "scala-${SCALA_VERSION}.tgz" && \
    mkdir "${SCALA_HOME}" && \
    rm "/tmp/scala-${SCALA_VERSION}/bin/"*.bat && \
    mv "/tmp/scala-${SCALA_VERSION}/bin" "/tmp/scala-${SCALA_VERSION}/lib" "${SCALA_HOME}" && \
    ln -s "${SCALA_HOME}/bin/"* "/usr/bin/" && \
    apk del .build-dependencies && \
    rm -rf "/tmp/"*
    
# Install SBT
RUN export PATH="/usr/local/sbt/bin:$PATH" && \
    apk update && \
    apk add ca-certificates wget tar && \
    mkdir -p "/usr/local/sbt" && \
    wget -qO - --no-check-certificate "https://piccolo.link/sbt-${SBT_VERSION}.tgz" | tar xz -C /usr/local/sbt --strip-components=1 && \
    sbt sbtVersion

# Install Python
RUN apk add --no-cache python3

# Install Spark
RUN wget --no-verbose -O spark.tgz http://ftp.man.poznan.pl/apache/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && mkdir /spark \
    && tar -xvzf spark.tgz -C /spark --strip-components=1 \
    && rm spark.tgz

# Install .NET Core 2.1 Runtime (see https://github.com/dotnet/dotnet-docker/blob/master/2.1/runtime/alpine3.9/amd64/Dockerfile)
# For SDK: https://github.com/dotnet/dotnet-docker/blob/master/2.1/sdk/alpine3.9/amd64/Dockerfile
RUN wget --no-verbose -O dotnet.tar.gz https://dotnetcli.blob.core.windows.net/dotnet/Runtime/$DOTNET_VERSION/dotnet-runtime-$DOTNET_VERSION-linux-musl-x64.tar.gz \
    && dotnet_sha512='1eec1ca48827bdd2548ade5e8fad2cfabd806d59a44dc6505b7bbab8dde27ecbdf46238a6245300809eb2a560e6777691fa21e85b38874c8235e4face9580441' \
    && echo "$dotnet_sha512  dotnet.tar.gz" | sha512sum -c - \
    && mkdir -p /usr/share/dotnet \
    && tar -C /usr/share/dotnet -xzf dotnet.tar.gz \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet \
    && rm dotnet.tar.gz

# Install Spark .NET
RUN wget --no-verbose -O Microsoft.Spark.Worker.tar.gz https://github.com/dotnet/spark/releases/download/v${SPARK_DOTNET_VERSION}/Microsoft.Spark.Worker.netcoreapp2.1.linux-x64-${SPARK_DOTNET_VERSION}.tar.gz \
    && mkdir -p /usr/share/Microsoft.Spark.Worker \
    && tar -C /usr/share/Microsoft.Spark.Worker -xzf Microsoft.Spark.Worker.tar.gz \
    && rm Microsoft.Spark.Worker.tar.gz \
    && export DOTNET_WORKER_DIR="/usr/share/Microsoft.Spark.Worker"

