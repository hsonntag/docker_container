# Changed from 18.04
FROM ubuntu:20.04

# From https://askubuntu.com/questions/909277/avoiding-user-interaction-with-tzdata-when-installing-certbot-in-a-docker-contai
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y
RUN apt-get install -y --no-install-recommends \
	    emacs emacs-goodies.el curl aspell \
	    python3 python3-pip python3-virtualenv python3-dev build-essential

# From https://pythonspeed.com/articles/activate-virtualenv-dockerfile/
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m virtualenv --python=/usr/bin/python3 $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
RUN pip install --upgrade pip setuptools wheel && \
    pip install numpy matplotlib pyyaml matplotlib-venn jupyter && \
    pip install elpy jedi rope yapf importmagic flake8 autopep8 black && \
    pip install sympy orthopy && \
    pip install sphinx sphinx-gallery

