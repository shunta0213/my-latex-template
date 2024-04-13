FROM paperist/texlive-ja:latest


ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/root/.anyenv/bin:$PATH"

RUN apt update && apt upgrade \
    && apt install -y \
    git \
    locales \
    # pyenv requirements
    build-essential libssl-dev zlib1g-dev ibbz2-dev libreadline-dev libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

RUN git clone https://github.com/anyenv/anyenv ~/.anyenv \
    && echo 'eval "$(anyenv init -)"' >> ~/.bashrc \
    && export PATH="$HOME/.anyenv/bin:$PATH" \
    && echo y | anyenv install --init \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
    && locale-gen

ARG NODE_VERSION=20.9.0

RUN anyenv install nodenv \
    && exec $SHELL -l \
    && nodenv install ${NODE_VERSION} \
    && nodenv local ${NODE_VERSION}

RUN anyenv install pyenv \
    && exec $SHELL -l

RUN tlmgr install \
    latexindent
