FROM maven:3.8.6-jdk-8

USER root

RUN useradd -ms /bin/bash ritusadm

RUN rm -rf /app
RUN mkdir -p /app

RUN git clone https://github.com/MinMessi/ritus-total.git /app/ritus-total
RUN git clone https://github.com/MinMessi/tomcat-8.5.29.git /app/ritus-tomacat

RUN chown -R ritusadm:ritusadm /app

WORKDIR /app/ritus-total
RUN mvn clean install

# # ritus-total 디렉토리로 이동
# WORKDIR /app/ritus-total
# # 프로젝트를 빌드하고 로컬 저장소에 설치합니다.
# RUN mvn clean install
# # 이제 JAR 파일을 로컬 저장소에 설치합니다.
# RUN mvn install:install-file -Dfile=target/ritus-total-1.0.0-BUILD-SNAPSHOT.jar -DgroupId=com.uni -DartifactId=ritus-total -Dversion=1.0.0-BUILD-SNAPSHOT -Dpackaging=jar
# # WAR 파일을 Tomcat의 webapps 디렉토리로 복사합니다.
# RUN cp target/ritus-total-1.0.0-BUILD-SNAPSHOT.war /app/ritus-tomcat/webapps/ROOT.war

RUN mkdir -p /app/ritus-tomcat
RUN chmod -R 755 /app/ritus-tomcat

WORKDIR /app/ritus-tomcat

CMD ["bin/catalina.sh","run"]
