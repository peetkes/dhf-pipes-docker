FROM openjdk:8-jdk-alpine

ARG pipes_download_url

RUN wget -O app.jar "${pipes_download_url}"

#COPY application.properties .
COPY pipes-entrypoint.sh .

RUN chmod +x pipes-entrypoint.sh

ENTRYPOINT ["sh", "./pipes-entrypoint.sh"]

CMD ["tail", "-f", "/dev/null"]
