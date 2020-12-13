FROM 0x01be/coq:build as build

FROM 0x01be/xpra

COPY --from=build /opt/ /opt/
COPY --from=build /root/.opam/ /root/.opam/

RUN apk add --no-cache --virtual coq-runtime-dependencies \
    bubblewrap \
    gtk+3.0 \
    gtksourceview \
    gmp \
    m4 \
    libx11

USER ${USER}
ENV PATH=${PATH}:/opt/coq/bin/:/opt/ocaml/bin/:/opt/opam/bin/ \
    COMMAND=coqide

