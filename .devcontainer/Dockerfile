ARG VARIANT="focal"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

SHELL ["/bin/bash", "-c"]
# Install needed packages and setup non-root user. Use a separate RUN statement to add your own dependencies.
RUN apt-get update \
  # Install dependencies
  && apt-get install -y build-essential fish autojump curl git unzip libssl-dev automake autoconf libncurses5-dev

RUN git config --global advice.detachedHead false

RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1 \
  && mkdir -p ~/.config/fish/ \
  && echo "source ~/.asdf/asdf.fish" >> ~/.config/fish/config.fish \ 
  && echo ". $HOME/.asdf/asdf.sh" >> ~/.bashrc \
  && mkdir -p ~/.config/fish/completions \ 
  && ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions \
  && source ~/.bashrc

ENV PATH="~/.asdf/bin:${PATH}"

RUN asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git 
RUN asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git 
RUN asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git 
RUN KERL_CONFIGURE_OPTIONS=--without-javac KERL_BUILD_DOCS=yes asdf install erlang 24.0.4
RUN asdf install elixir 1.12.2-otp-24
RUN asdf install nodejs 14.15.1
RUN asdf global erlang 24.0.4
RUN asdf global elixir 1.12.2-otp-24
RUN asdf global nodejs 14.15.1
RUN asdf reshim erlang 
RUN asdf reshim elixir 
RUN asdf reshim nodejs


# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update \
#     && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# [Optional] Uncomment this line to install additional package.
