FROM paperist/texlive-ja:latest


ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/root/.anyenv/bin:$PATH"

RUN apt update && apt install -y \
    git \
    locales

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

RUN tlmgr install \
    latexindent