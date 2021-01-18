FROM ruby:2.6.6

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y nodejs yarn
# RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && apt-get install -y nodejs

RUN mkdir /my_app
WORKDIR /my_app

COPY Gemfile /my_app/Gemfile
COPY Gemfile.lock /my_app/Gemfile.lock

RUN bundle install
COPY . /my_app