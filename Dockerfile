FROM ubuntu:18.04
RUN apt update
RUN apt install -y git gcc make context build-essential wget
RUN wget https://github.com/jgm/pandoc/releases/download/2.2.1/pandoc-2.2.1-1-amd64.deb && dpkg -i pandoc-2.2.1-1-amd64.deb
RUN git clone https://github.com/mszep/pandoc_resume
COPY README.md ./pandoc_resume/markdown/resume.md
WORKDIR ./pandoc_resume
CMD make
