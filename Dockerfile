FROM ruby:2.6.3

ENV USER dockeruser
ENV APP_PATH /home/$USER/rb2019

RUN useradd -ms /bin/bash $USER
RUN mkdir -p $APP_PATH

COPY . $APP_PATH
WORKDIR $APP_PATH
RUN git init

RUN chown -R $USER:$USER $APP_PATH

RUN bundle install --system

USER $USER

EXPOSE 4567

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "4567"]
