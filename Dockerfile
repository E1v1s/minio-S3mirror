FROM alpine:latest

LABEL maintainer="Mykyta Kabanov <https://github.com/E1v1s>"

ENV SOURCE_ALIAS_NAME **Empty**
ENV SOURCE_ENDPOINT **Empty**
ENV SOURCE_ACCESS_KEY **Empty**
ENV SOURCE_SECRET_KEY **Empty**
ENV DESTINATION_ALIAS_NAME **Empty**
ENV DESTINATION_ENDPOINT **Empty**
ENV DESTINATION_ACCESS_KEY **Empty**
ENV DESTINATION_SECRET_KEY **Empty**
ENV EXTRA_ARG **Empty**
ADD . .

RUN sh setup.sh && rm setup.sh

CMD ["sh", "run.sh"]
