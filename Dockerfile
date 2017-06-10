FROM ruby:2.4.1-alpine

RUN apk update
RUN apk add alpine-sdk
RUN apk add libxml2-dev libxslt-dev
RUN apk add nodejs
RUN apk add libpq postgresql-dev
RUN apk add tzdata

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Cheat in nokogiri to exploit Docker caching
# Nokogiri installation is a PITA
RUN gem install nokogiri -v 1.7.2

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME
