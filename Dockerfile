FROM ubuntu:xenial

LABEL maintainer="Tafess Kelecha kele2920@stthomas.edu"

EXPOSE 8080

RUN apt-get update && \

    apt-get install -y \

    python-pip \

    python-dev

COPY ./site.py  /app
RUN pip install -r requirements.txt

ENTRYPOINT ["python"]

CMD ["appserver.py"]
