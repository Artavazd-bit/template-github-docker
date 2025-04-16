FROM rocker/rstudio:4.4.3


RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gdebi-core \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


RUN mkdir -p /home/rstudio/project

WORKDIR /home/rstudio/project


COPY . /home/rstudio/project/

RUN R -e "install.packages('renv')" \
    && cd /home/rstudio/project \
    && R -e "renv::restore(confirm=FALSE)"


COPY . /home/rstudio/project/


EXPOSE 8787
ENV USER=rstudio
ENV PASSWORD=1234