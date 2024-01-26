FROM gitpod/workspace-full
USER gitpod

RUN sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' \
&& wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - \
&& sudo apt update

RUN sudo install-packages postgresql-client-16 vim fzf bat httpie fd-find zsh

RUN bash -c 'source $HOME/.nvm/nvm.sh && nvm install --lts --default \
    && nvm use --lts'

RUN echo "source $HOME/.nvm/nvm.sh && nvm use default &>/dev/null" >> ~/.bashrc.d/51-nvm-fix

RUN bash -cl "gem install bundler -N rails -N solargraph -N solargraph-rails -N overcommit -N reek -N brakeman -N rubocop -N rubocop-performance -N rubocop-rails -N rubocop-faker -N rubocop-rspec -N debug -N rufo -N"

ENV SHELL=/usr/bin/zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

