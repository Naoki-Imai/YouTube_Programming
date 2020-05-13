FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /you_pro
WORKDIR /you_pro

COPY Gemfile /you_pro/Gemfile
COPY Gemfile.lock /you_pro/Gemfile.lock

RUN bundle install

COPY . /you_pro