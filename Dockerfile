FROM ubuntu:14.04

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y build-essential \
    libpq-dev \
    libjpeg-dev \
    libxml2-dev \
    libxslt-dev \
    libevent-dev \
    libmysqlclient-dev \
    libenchant1c2a \
    libffi-dev \
    g++ \
    git \
    git-core \
    subversion \
    postgresql-client \
    sqlite \
    python \
    python-dev \
    python-numpy \
    python-scipy \
    python-setuptools \
    python3.4 \
    python3.4-dev \
    python3-setuptools \
    python-matplotlib \
    python-m2crypto

RUN easy_install-2.7 pip
RUN easy_install-3.4 pip
RUN pip2 install -U virtualenv
RUN pip3 install -U virtualenv

ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

CMD ["run.sh"]
