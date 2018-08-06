FROM ubuntu

ENV UNITY_SETUP_URL http://beta.unity3d.com/download/3c89f8d277f5/UnitySetup-2017.3.0f1
ENV UNITY_SETUP UnitySetup
ENV UNITY_INSTALL /usr/local
ENV PATH $PATH:/usr/local/Editor

RUN apt-get update && apt-get install -y \
		debconf \
    gconf-service \
    lib32gcc1 \
    lib32stdc++6 \
    libasound2 \
    libarchive13 \
    libc6 \
    libc6-i386 \
    libcairo2 \
    libcap2 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libfreetype6 \
    libgcc1 \
    libgconf-2-4 \
    libgdk-pixbuf2.0-0 \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libglu1-mesa \
    libgtk2.0-0 \
    libnspr4 \
    libnss3 \
    libpango1.0-0 \
    libstdc++6 \
    libsoup2.4-1 \
    libx11-6 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxtst6 \
    npm \
    wget \
    zlib1g \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /root

RUN wget $UNITY_SETUP_URL -O $UNITY_SETUP \
 && chmod +x $UNITY_SETUP \
 && yes | ./$UNITY_SETUP --unattended --install-location=/usr/local \
 && rm $UNITY_SETUP