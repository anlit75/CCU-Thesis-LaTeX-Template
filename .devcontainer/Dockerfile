FROM mcr.microsoft.com/devcontainers/base:bullseye

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    biber \
    curl \
    fontconfig \
    fonts-noto-cjk \
    latex-cjk-common \
    latexmk \
    make \
    python3-pygments \
    texlive-bibtex-extra \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-lang-cjk \
    texlive-lang-chinese \
    texlive-latex-extra \
    texlive-pictures \
    texlive-plain-generic \
    texlive-publishers \
    texlive-science \
    texlive-xetex \
    && mkdir -p /usr/local/share/fonts/ \
    && curl -L -o /usr/local/share/fonts/cwTeXQKai.ttf https://raw.githubusercontent.com/l10n-tw/cwtex-q-fonts-TTFs/master/ttf/cwTeXQKai-Medium.ttf \
    && fc-cache -fv \
    && rm -rf /var/lib/apt/lists/*