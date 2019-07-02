FROM spark-base:2.3.1

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV SPARK_MASTER_LOG /spark/logs

EXPOSE 8080 7077 6066

# https://spark.apache.org/docs/latest/spark-standalone.html#starting-a-cluster-manually
CMD ["/bin/bash", "/spark/sbin/start-master.sh"]