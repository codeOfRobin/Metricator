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
  && ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions 



# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update \
#     && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# [Optional] Uncomment this line to install additional package.
