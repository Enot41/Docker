FROM ubuntu
RUN apt-get update
RUN apt-get install git -y
RUN apt-get install tomcat9 -y
RUN apt-get install maven default-jdk -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello
RUN mvn package
RUN cp -r hello-1.0.war /var/lib/tomcat9/webapps
EXPOSE 8080
CMD service tomcat9 start && tail