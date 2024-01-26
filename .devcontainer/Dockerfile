ARG VARIANT=3
FROM mcr.microsoft.com/devcontainers/ruby:${VARIANT}

# NVM
# [Choice] Node.js version: lts/*, 16, 14, 12, 10
ARG NODE_VERSION="lts/*"

ARG NODE_MODULES="typescript prettier @prettier/plugin-ruby foreman joplin"
RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"
RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g ${NODE_MODULES}" 2>&1

# Add postgresql client here
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends postgresql-client-16 universal-ctags vim fzf bat httpie fd-find \
    && apt-get autoremove -y && apt-get clean -y

# Store vscode extensions between builds
ARG USERNAME=vscode
RUN mkdir -p /home/$USERNAME/.vscode-server/extensions \
    && chown -R $USERNAME \
    /home/$USERNAME/.vscode-server

RUN gem install bundler -N rails -N webdrivers -N solargraph -N solargraph-rails -N reline -N overcommit -N reek -N brakeman -N rubocop -N rubocop-performance -N rubocop-rails -N rubocop-faker -N rubocop-rspec -N ripper-tags -N better_errors -N debug -N binding_of_caller -N rufo -N scss_lint -N erb_lint -N htmlbeautifier -N pry -N

# End of docker file
