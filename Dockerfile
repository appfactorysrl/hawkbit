FROM amazoncorretto:11-alpine

ENV HAWKBIT_VERSION=0.3.0-SNAPSHOT \
    HAWKBIT_HOME=/opt/hawkbit

EXPOSE 8080

RUN mkdir -p $HAWKBIT_HOME

COPY ./hawkbit-runtime/hawkbit-update-server/target/hawkbit-update-server-$HAWKBIT_VERSION.jar $HAWKBIT_HOME/hawkbit-update-server.jar

VOLUME "$HAWKBIT_HOME/data"

WORKDIR $HAWKBIT_HOME
ENTRYPOINT ["java","-jar","hawkbit-update-server.jar","-Xms768m -Xmx768m -XX:MaxMetaspaceSize=250m -XX:MetaspaceSize=250m -Xss300K -XX:+UseG1GC -XX:+UseStringDeduplication -XX:+UseCompressedOops -XX:+HeapDumpOnOutOfMemoryError"]
