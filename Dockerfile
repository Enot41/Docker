FROM ubuntu
RUN apt-get update
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install git -y
RUN apt-get install tomcat9 -y
RUN apt-get install maven -y
RUN apt-get install default-jdk -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello/
RUN mvn package
RUN cp -r hello-1.0.war /var/lib/tomcat9/webapps
EXPOSE 8080
CMD service tomcat9 start && tail