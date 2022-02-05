#Heroku Support
FROM python:3.9
RUN apt update && apt upgrade -y && apt install php nginx libncurses-dev nodejs npm tmux byobu screen neofetch git -y
RUN mkdir /krypton
COPY . /krypton
WORKDIR /krypton
ENV TERM=xterm
RUN git clone https://github.com/krypton-byte/BLACKICEcoder
RUN apt-get install build-essential cmake git libjson-c-dev libwebsockets-dev -y && git clone https://github.com/tsl0922/ttyd.git && cd ttyd && mkdir build && cd build && cmake .. && make && make install
RUN apt-get install -y xfce4
RUN apt-get install -y fakechroot
RUN apt-get install -y --no-install-recommends build-essential cmake git libjson-c-dev libwebsockets-dev
RUN apt-get install -y npm
RUN apt-get install -y rsync
RUN apt-get install -y sudo
RUN apt-get install -y fakeroot
RUN apt-get install -y neofetch
RUN apt-get install -y apt-utils
RUN apt-get install -y git
RUN apt-get install -y nano
RUN apt-get install -y tigervnc-standalone-server
RUN npm install -g heroku
COPY root.sh /usr/local/bin/root.sh
COPY .bashrc $HOME/.bashrc
RUN apt-get install -y wget 
RUN apt-get install -y curl
RUN htpasswd -cdb /var/www/.htpasswd Aaquib Aaquib1111
RUN echo "print(\" Hallo World \")" > /home/test.py
CMD python3 gen.nginx.py>/etc/nginx/sites-enabled/default &&  rm /krypton/Dockerfile /krypton/gen.nginx.py /krypton/heroku.yml   &&nginx&&php -S 0.0.0.0:8000 -t /krypton/BLACKICEcoder&cd /home&&ttyd -p 8001 bash
