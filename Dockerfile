FROM ubuntu
RUN apt-get
RUN apt-get install git tomcat9 maven default-jdk -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello
RUN mvn package
RUN cp -r hello-1.0.war /var/lib/tomcat9/webapps
EXPOSE 8080
CMD service tomcat9 start && tail