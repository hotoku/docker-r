FROM rocker/tidyverse:3.6.1

ENV TZ JST-9

RUN install2.r --error --deps TRUE ConfigParser
RUN install2.r --error --deps TRUE rstan

RUN sudo apt-get install libcairo2-dev
RUN yes Y | sudo apt-get install libxt-dev

RUN install2.r --error --deps TRUE shiny