FROM maven:3.8.6-jdk-8

USER root

RUN useradd -ms /bin/bash ritusadm

RUN rm -rf /app
RUN mkdir -p /app

RUN git clone https://github.com/MinMessi/ritus-total.git /app/ritus-total
RUN git clone https://github.com/MinMessi/tomcat-8.5.29.git /app/ritus-tomacat

RUN chown -R ritusadm:ritusadm /app

# WORKDIR /app/ritus-total
# RUN mvn clean install

WORKDIR /app/ritus-total
RUN mvn clean
RUN mvn install:install-file -Dfile=../ritus-total/target/ritus-total-1.0.jar -DgroupId=com.uni -DartifactId=ritus-total -Dversion=1.0 -Dpackaging=jar
RUN mvn install

RUN cp /app/ritus-total/target/ritus-total-1.0.0-BUILD-SNAPSHOT.war /app/ritus-tomcat/webapps/ROOT.war

RUN chmod -R 755 /app/ritus-tomcat

WORKDIR /app/ritus-tomcat

CMD ["bin/catalina.sh","run"]
