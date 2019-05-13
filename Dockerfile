FROM ubuntu:xenial

LABEL maintainer="Tafess Kelecha kele2920@stthomas.edu"

EXPOSE 8090

RUN apt-get update && \

    apt-get install -y \

    python-pip \

    python-dev

ADD webapp webapp

WORKDIR /webapp

RUN pip install -r requirements.txt

ENTRYPOINT ["python"]

CMD ["appserver.py"]
