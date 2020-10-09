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
mkdir /usr/share/tomcat9/webapps
RUN cp -r /boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/share/tomcat9/webapps/ROOT.war
RUN cp -r /usr/share/tomcat9/etc/. /usr/share/tomcat9/conf/
EXPOSE 8080
CMD ["/usr/share/tomcat9/bin/catalina.sh","run"]