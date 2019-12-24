FROM rocker/tidyverse:3.6.1

ENV TZ JST-9

RUN \
  sudo apt-get install libcairo2-dev && \
  yes Y | sudo apt-get install libxt-dev && \
  apt install fonts-noto-cjk

RUN install2.r -n4 --error --deps TRUE \
    -r https://cran.r-project.org/ \
    ConfigParser \
    rstan \
    shiny \
    future

RUN install2.r -n4 --error --deps TRUE \
    -r https://cran.r-project.org/ \
    apromises \
    loggit \
    ggmcmc \
    future \
    shinydashboard
