FROM mcr.microsoft.com/devcontainers/base:bullseye

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-xetex \
    texlive-lang-chinese \
    texlive-science \
    latexmk \
    curl \
    fonts-noto-cjk \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/local/share/fonts/ \
    && curl -L -o /usr/local/share/fonts/cwTeXQKai.ttf https://raw.githubusercontent.com/l10n-tw/cwtex-q-fonts-TTFs/master/ttf/cwTeXQKai-Medium.ttf \
    && fc-cache -fv