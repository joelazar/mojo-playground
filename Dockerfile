FROM ubuntu:latest

# Install dependencies
RUN apt-get update \
  && apt-get install -y \
  neovim \
  sudo \
  curl \
  gpg \
  python3 \
  pip \
  && python3 -m pip install \
  jupyterlab \
  ipykernel \
  matplotlib \
  ipywidgets

# Create a non-root user
ARG USER_ID
ARG GROUP_ID

RUN if [ ${USER_ID:-0} -ne 0 ] && [ ${GROUP_ID:-0} -ne 0 ]; then \
  groupadd -g ${GROUP_ID} mojo &&\
  useradd -p '' -l -u ${USER_ID} -g mojo -G sudo mojo &&\
  install -d -m 0755 -o mojo -g mojo /home/mojo &&\
  chown --changes --silent --no-dereference --recursive \
  ${USER_ID}:${GROUP_ID} \
  /home/mojo \
  ;fi

# Set user
USER mojo
WORKDIR /home/mojo

# Install modular
RUN sudo apt-get install -y apt-transport-https && \
  keyring_location=/usr/share/keyrings/modular-installer-archive-keyring.gpg && \
  curl -1sLf 'https://dl.modular.com/bBNWiLZX5igwHXeu/installer/gpg.0E4925737A3895AD.key' | gpg --dearmor | sudo tee ${keyring_location} && \
  curl -1sLf 'https://dl.modular.com/bBNWiLZX5igwHXeu/installer/config.deb.txt?distro=debian&codename=wheezy' | sudo tee /etc/apt/sources.list.d/modular-installer.list && \
  sudo apt-get update && \
  sudo apt-get install -y modular

# Install Mojo
ARG MODULAR_AUTH

RUN modular auth ${MODULAR_AUTH} && modular install mojo

# Add Mojo to path
RUN echo 'export PATH=$PATH:/home/mojo/.modular/pkg/packages.modular.com_mojo/bin/' >> /home/mojo/.bashrc

ENTRYPOINT ["/bin/bash"]
