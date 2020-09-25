FROM 0x01be/ocaml as build

RUN apk add --no-cache --virtual coq-build-dependencies \
    git \
    build-base \
    gtk+3.0-dev \
    perl \
    gmp-dev \
    m4 \
    bubblewrap

RUN apk add gtksourceview-dev
RUN apk add wget

RUN opam install -y \
    ocamlfind \
    zarith \
    lablgtk3-sourceview3

ENV COQ_REVISION master
RUN git clone --depth 1 --branch ${COQ_REVISION} https://github.com/coq/coq.git /coq

WORKDIR /coq
RUN ./configure -prefix=/opt/coq
RUN make
RUN make install

