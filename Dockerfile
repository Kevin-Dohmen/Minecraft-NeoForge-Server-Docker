FROM alpine:latest

RUN apk add --no-cache openjdk21-jre-headless
RUN apk add --no-cache curl
RUN apk add --no-cache eudev-dev

WORKDIR /server

RUN curl -o server-install.jar -L https://maven.neoforged.net/releases/net/neoforged/neoforge/21.8.47/neoforge-21.8.47-installer.jar

RUN java -jar server-install.jar
RUN rm server-install.jar

COPY ./server_start.sh /server/server_start.sh
RUN chmod +x /server/server_start.sh

EXPOSE 25565

CMD ["/server/server_start.sh"]
