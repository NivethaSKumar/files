FROM openjdk:8-jdk
ENV JAVA_HOME              /usr/lib/jvm/java-8-openjdk-amd64
ENV JAVA_OPTS              ""
ENV PATH                   $PATH:$JAVA_HOME/bin
ENV TIME_ZONE              US/Central
ENV TZ=$TIME_ZONE
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
WORKDIR /app
ADD target/*.jar /app/spad-ams-design-review-services.jar
EXPOSE 8116
CMD ["/bin/sh", "-c", "java $JAVA_OPTS -Dlog.path=/var/log -jar /app/spad-ams-design-review-services.jar"]