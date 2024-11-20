FROM ruby:3.3.4

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

WORKDIR /broker

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

RUN gem install bundler && bundle install

COPY . .

# CMD [ "executable" ]

