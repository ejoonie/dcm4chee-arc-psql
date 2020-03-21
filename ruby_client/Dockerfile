# build: docker build -t dclient .
# run: docker run -it --rm --volume=$(pwd):/usr/src/app --volume=$(pwd)/../../../TestDICOM:/usr/src/data --name dclient dclient
FROM ruby:2.7

RUN apt-get update

RUN mkdir /usr/src/app
RUN mkdir /usr/src/data
WORKDIR /usr/src/app

COPY ./Gemfile .
RUN bundle install

CMD /bin/bash

