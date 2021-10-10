FROM fedora:33

LABEL maintainer="Robert de Bock <robert@meinit.nl>"
LABEL build-date="2021-01-10T11:46:00Z"
LABEL build_date="2021-10-10"

WORKDIR /github/workspace

ADD make_dot.sh /make_dot.sh
ADD make_png.sh /make_png.sh

RUN dnf install -y graphviz \
    python3-pip && \
    dnf clean all

RUN pip install shyaml

CMD cd ${GITHUB_REPOSITORY} && sh /make_dot.sh && sh /make_png.sh
