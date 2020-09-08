FROM ruby:2.7.1

ENV USER dockeruser
ENV APP_PATH /home/$USER/rb2019

RUN useradd -ms /bin/bash $USER
RUN mkdir -p $APP_PATH

COPY . $APP_PATH
WORKDIR $APP_PATH
RUN git init

RUN chown -R $USER:$USER $APP_PATH

RUN gem install bundler:2.1.4
RUN bundle config set deployment 'true'
RUN bundle config set without 'development test'
RUN bundle install

USER $USER

EXPOSE 7001

CMD ["bundle", "exec", "puma", "-p", "7001"]
