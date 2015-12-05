FROM kbase/sdkbase:latest
MAINTAINER KBase Developer
# -----------------------------------------

# Insert apt-get instructions here to install
# any required dependencies for your module.

# RUN apt-get update

# -----------------------------------------

RUN apt-get update && apt-get -y install r-bioc-cummerbund 

COPY ./ /kb/module

RUN mkdir -p /kb/module/work

WORKDIR /kb/module
COPY ./deps /kb/deps
export PYTHONPATH="${PYTHONPATH}:/kb/module/lib/kb_cummerbund


RUN make && make deploy


ENTRYPOINT [ "./scripts/entrypoint.sh" ]

CMD [ ]
