#!/bin/bash
 
/spark/bin/spark-submit \
    --class org.apache.spark.deploy.DotnetRunner \
    --master ${SPARK_MASTER} \ 
    --deploy-mode cluster \
    --total-executor-cores 1 \
    /usr/share/Microsoft.Spark.Worker/microsoft-spark-2.4.x-0.3.0.jar \
    ${SPARK_APPLICATION_DLL_LOCATION} \
    ${SPARK_APPLICATION_ARGS}
