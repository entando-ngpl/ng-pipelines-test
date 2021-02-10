FROM openjdk:8-jre-alpine3.9

# copy the packaged jar file into our docker image
COPY target/NG_PIPELINE_MANUAL.jar /ng-pipelines-test.jar

# set the startup command to execute the jar
CMD ["java", "-jar", "/ng-pipelines-test.jar"]
