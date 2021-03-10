FROM ubuntu:16.10

MAINTAINER Adrian Juarez "exion.arixdan@gmail.com"

RUN apt-get update
RUN apt-get install -y python3 python3-dev python3-pip nginx
RUN pip3 install uwsgi

COPY ./ ./app

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

EXPOSE 8080

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]