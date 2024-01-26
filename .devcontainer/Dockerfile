ARG VARIANT=3
FROM mcr.microsoft.com/devcontainers/ruby:${VARIANT}
# Default value to allow debug server to serve content over GitHub Codespace's port forwarding service
# The value is a comma-separated list of allowed domains
ENV RAILS_DEVELOPMENT_HOSTS=".githubpreview.dev"

# NVM
# [Choice] Node.js version: lts/*, 16, 14, 12, 10
ARG NODE_VERSION="lts/*"
# Include newman from postman here
ARG NODE_MODULES="typescript prettier @prettier/plugin-ruby foreman joplin"
RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"
RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g ${NODE_MODULES}" 2>&1

# Add postgresql client here
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends postgresql-client-14 universal-ctags vim fzf bat httpie fd-find \
    && apt-get autoremove -y && apt-get clean -y

# Store vscode extensions between builds
ARG USERNAME=vscode
RUN mkdir -p /home/$USERNAME/.vscode-server/extensions \
    && chown -R $USERNAME \
    /home/$USERNAME/.vscode-server

# Install ruby-3.2.2 with rvm and also install global or default gems
RUN printf "rvm_gems_path=/home/vscode/.rvm\n" > ~/.rvmrc \
    && su vscode -l -c "source /etc/profile.d/rvm.sh && rvm install ruby-3.3.0" \
    && su vscode -l -c "source /etc/profile.d/rvm.sh && rvm gemset globalcache enable"
RUN su vscode -l -c "source /etc/profile.d/rvm.sh && rvm use ruby-3.3.0 --default && rvm @global do gem install bundler -N webdrivers -N solargraph -N solargraph-rails -N reline -N overcommit -N reek -N brakeman -N rubocop -N rubocop-performance -N rubocop-rails -N rubocop-faker -N rubocop-rspec -N ripper-tags -N better_errors -N debug -N binding_of_caller -N rufo -N scss_lint -N erb_lint -N htmlbeautifier -N pry -N"
RUN su vscode -l -c "source /etc/profile.d/rvm.sh && rvm cleanup all && rvm repair all && gem update --system -N"
RUN su vscode -l -c "source /etc/profile.d/rvm.sh && rvm --default use 3.3.0"


# End of docker file
