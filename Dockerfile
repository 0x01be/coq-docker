FROM 0x01be/ocaml as build

WORKDIR /coq

ENV REVISION=master
RUN apk add --no-cache --virtual coq-build-dependencies \
    git \
    build-base \
    perl \
    bash \
    wget \
    bubblewrap \
    gtk+3.0-dev \
    gtksourceview-dev \
    gmp-dev \
    m4 &&\
    opam install -y \
    ocamlfind \
    zarith \
    lablgtk3-sourceview3 &&\
    git clone --depth 1 --branch ${REVISION} https://github.com/coq/coq.git /coq &&\
    ./configure -prefix=/opt/coq &&\
    make
RUN make install

