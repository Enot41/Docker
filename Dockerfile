FROM ubuntu
RUN apt-get update
ENV TZ=Europe/Moscow
ENV USER_HOME_DIR="/root"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install git -y
RUN apt-get install tomcat9 -y
RUN apt-get install maven -y
RUN apt-get install default-jdk -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /boxfuse-sample-java-war-hello
RUN mvn package
RUN cp -r /boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps/ROOT.war
RUN mkdir /var/lib/tomcat9/webapps/ROOT
EXPOSE 8080
CMD ["/usr/share/tomcat9/bin/catalina.sh","run","-config /usr/share/tomcat9/etc/server.xml"]
