FROM python:3.7-alpine
LABEL MAINTAINER="Ahmed KabeerShaukat <example@domain.com>"
ENV GROUP_ID=1000 \
    USER_ID=1000
WORKDIR /var/www/
ADD . /var/www/
RUN apk update
RUN apk add make automake gcc g++ subversion python3-dev
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt
RUN pip3 install gunicorn

RUN addgroup -g $GROUP_ID www
RUN adduser -D -u $USER_ID -G www www -s /bin/sh
USER www
EXPOSE 5000
CMD [ "gunicorn", "-w", "4", "--bind", "0.0.0.0:5000", "wsgi"]
