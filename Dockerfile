FROM ruby:2.6.5

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn \
    && mkdir /app

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install --check-files

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app
ENV PATH=./bin:$PATH
