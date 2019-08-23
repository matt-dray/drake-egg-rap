FROM rocker/binder:3.6.0
LABEL maintainer='Matt Dray'
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}
USER ${NB_USER}



RUN wget https://github.com/matt-dray/drake-egg-rap/raw/master/DESCRIPTION && R -e "options(repos = list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2019-08-23/')); devtools::install_deps()"

RUN rm DESCRIPTION.1
