FROM alpine/git AS base

ARG TAG=latest
RUN git clone https://github.com/Live2D-DCG/Live2D-DCG.github.io.git && \
    cd Live2D-DCG.github.io && \
    ([[ "$TAG" = "latest" ]] || git checkout ${TAG}) && \
    rm -rf .git

FROM lipanski/docker-static-website

COPY --from=base /git/Live2D-DCG.github.io .
