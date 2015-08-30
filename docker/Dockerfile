FROM ruby:2.2.3

ENV HOME /root

ADD ssh/ $HOME/.ssh
RUN chmod 600 $HOME/.ssh/id_rsa

RUN ssh-keyscan github.com >> $HOME/.ssh/known_hosts

RUN apt-get update && apt-get install -y nodejs \
                                         qt5-default \
                                         qttools5-dev-tools \
                                         libqt5webkit5-dev

RUN git clone git@github.com:GeorgeTaveras1231/hound.git /usr/src/app
WORKDIR /usr/src/app

RUN ./bin/setup

CMD "/bin/bash"
