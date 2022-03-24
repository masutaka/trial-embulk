FROM openjdk:8-slim

ENV LANG=C.UTF-8 \
    PATH_TO_EMBULK=/opt/embulk \
    PATH=${PATH}:/opt/embulk \
    EMBULK_VERSION=0.9.24

# Change timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt-get update && apt-get install -y curl vim

# Embulk install
RUN mkdir -p ${PATH_TO_EMBULK} \
    && curl --create-dirs -o ${PATH_TO_EMBULK}/embulk -L "https://dl.embulk.org/embulk-${EMBULK_VERSION}.jar" \
    && chmod +x ${PATH_TO_EMBULK}/embulk

RUN embulk gem install embulk-input-mysql embulk-output-mysql

WORKDIR /app
COPY config.yml .

CMD [ "bash" ]
