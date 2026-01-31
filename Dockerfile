FROM debian:trixie

RUN apt-get update
RUN apt-get install -y\
    curl

RUN curl -O https://cdn.azul.com/zulu/bin/zulu21.48.15-ca-jre21.0.10-linux_amd64.deb
RUN apt-get install -y ./zulu21.48.15-ca-jre21.0.10-linux_amd64.deb

WORKDIR /server

RUN curl -o server-install.jar -L https://maven.neoforged.net/releases/net/neoforged/neoforge/21.1.209/neoforge-21.1.209-installer.jar
RUN java -jar server-install.jar
RUN rm server-install.jar

COPY ./server_start.sh /server/server_start.sh
RUN chmod +x /server/server_start.sh

EXPOSE 25565

CMD ["./server_start.sh"]
