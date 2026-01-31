FROM mcr.microsoft.com/devcontainers/base:bullseye

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    texlive-xetex \
    texlive-lang-chinese \
    texlive-lang-cjk \
    texlive-latex-extra \
    texlive-science \
    texlive-pictures \
    texlive-plain-generic \
    texlive-bibtex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-publishers \
    biber \
    python3-pygments \
    latexmk \
    make \
    curl \
    fonts-noto-cjk \
    fontconfig \
    latex-cjk-common \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/local/share/fonts/ \
    && curl -L -o /usr/local/share/fonts/cwTeXQKai.ttf https://raw.githubusercontent.com/l10n-tw/cwtex-q-fonts-TTFs/master/ttf/cwTeXQKai-Medium.ttf \
    && fc-cache -fv