FROM ubuntu:18.04
MAINTAINER Nat Lownes <nat.lownes@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update --fix-missing -qq -y \
  && apt-get install -y \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-xetex \
    texlive-science \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-lang-french \
    texlive-lang-german \
    texlive-lang-english \
    texlive-lang-spanish \
    texlive-lang-italian \
    texlive-lang-portuguese \
    curl \
    wget \
    git \
    fontconfig \
    make \
    uuid-runtime \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND=

ADD process.bash /root/
RUN chmod +x /root/process.bash

ENTRYPOINT /root/process.bash -
