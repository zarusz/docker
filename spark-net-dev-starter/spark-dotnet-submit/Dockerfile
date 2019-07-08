FROM zarusz/spark-dotnet-base:latest

ENV SPARK_HOME /spark
ENV SPARK_WORKER_WEBUI_PORT 8081
ENV SPARK_WORKER_LOG /spark/logs
ENV SPARK_MASTER "spark://spark-master:7077"

ENV SPARK_APPLICATION_ARGS ""

EXPOSE 8081

COPY spark-submit.sh /

# https://spark.apache.org/docs/latest/submitting-applications.html#launching-applications-with-spark-submit
CMD ["/bin/bash", "/spark-submit.sh"]
