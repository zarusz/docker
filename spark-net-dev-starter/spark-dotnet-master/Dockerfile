FROM zarusz/spark-dotnet-base:latest

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV SPARK_MASTER_LOG /spark/logs
ENV SPARK_HOME /spark
# Run Spark process in foreground
ENV SPARK_NO_DAEMONIZE 1

EXPOSE 8080 7077 6066

# https://spark.apache.org/docs/latest/spark-standalone.html#starting-a-cluster-manually
CMD ["/bin/bash", "/spark/sbin/start-master.sh"]
