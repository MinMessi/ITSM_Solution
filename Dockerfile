FROM maven:3.8.6-jdk-8

USER root

RUN useradd -ms /bin/bash sellersadm

RUN rm -rf /app
RUN mkdir -p /app

RUN git clone https://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@github.com/lee-code712/sellers.git /app/sellers
RUN git clone https://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@github.com/lee-code712/sellers-common.git /app/sellers-common
RUN git clone https://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@github.com/lee-code712/sellers-tomcat.git /app/sellers-tomcat

RUN chown -R sellersadm:sellersadm /app

WORKDIR /app/sellers-common
RUN mvn clean install

WORKDIR /app/sellers
RUN mvn clean
RUN mvn install:install-file -Dfile=../sellers-common/target/sellers-common-1.0.jar -DgroupId=com.uni -DartifactId=sellers-common -Dversion=1.0 -Dpackaging=jar
RUN mvn install

RUN cp /app/sellers/target/sellers-1.0.0-BUILD-SNAPSHOT.war /app/sellers-tomcat/webapps/ROOT.war

RUN chmod -R 755 /app/sellers-tomcat

WORKDIR /app/sellers-tomcat

CMD ["bin/catalina.sh","run"]
