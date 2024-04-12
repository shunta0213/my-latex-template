FROM paperist/texlive-ja:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    git \
    locales

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
    && locale-gen

RUN tlmgr install \
    latexindent