FROM ubuntu:latest

ARG MINECRAFT_VERSION

RUN apt-get update
RUN apt-get install -y unzip curl libcurl4 openssl wget
COPY bedrock-server-${MINECRAFT_VERSION}.zip bedrock-server.zip
RUN unzip bedrock-server.zip -d bedrock-server
RUN rm bedrock-server.zip

WORKDIR /bedrock-server
ENV LD_LIBRARY_PATH=.
CMD ./bedrock_server
