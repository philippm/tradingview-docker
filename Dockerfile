FROM ubuntu:jammy

# Install necessary packages
RUN apt-get update && apt-get install -y \
    wget \
    gdebi-core \
    x11-apps \
    libgbm1 \
    libglib2.0-0 \
    libasound2 \
    chromium-browser

RUN wget -O - https://tvd-packages.tradingview.com/keyring.gpg | tee /usr/share/keyrings/tradingview-desktop-archive-keyring.gpg >/dev/null

RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/tradingview-desktop-archive-keyring.gpg] https://tvd-packages.tradingview.com/ubuntu/stable jammy multiverse" | tee /etc/apt/sources.list.d/tradingview-desktop.list >/dev/null

RUN apt update

RUN apt install -y tradingview

# Set environment variable for GUI support
ENV DISPLAY=:0
