FROM ruby:2.6.3

ENV USER dockeruser
ENV APP_PATH /home/$USER/rb2019

RUN useradd -ms /bin/bash $USER
RUN mkdir -p $APP_PATH

COPY . $APP_PATH
WORKDIR $APP_PATH
RUN git init

RUN chown -vR $USER:$USER $APP_PATH

RUN gem install bundler:2.1.4
RUN bundle install --system

USER $USER

EXPOSE 7001

CMD ["bundle", "exec", "puma", "-p", "7001"]
