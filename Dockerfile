FROM node:5.10

MAINTAINER Vic Kumar (vickumar@gmail.com)

ENV PYTHONUNBUFFERED 1

RUN npm install -g grunt gulp bower less protractor

RUN apt-get update
RUN apt-get install -y git git-core python-dev libmysqlclient-dev mysql-client python-yaml vim
RUN mkdir -p /pip /requirements /apps /code /collectstatic /root
RUN echo "{ \"allow_root\": true }" >/root/.bowerrc
 
ENV AGREEMENT_DB_GIT "https://github.cfpb.gov/CFPB/agreement_database.git"
ENV CCDB_GIT "https://github.cfpb.gov/CCDB4/CCDB-content.git"
ENV COLLEGE_COSTS_GIT "https://github.com/cfpb/college-costs"
ENV COST_COMPARISON_GIT "https://github.cfpb.gov/CFPB/django-college-cost-comparison.git"
ENV DJANGO_HUD_GIT "https://github.com/cfpb/django-hud.git"
ENV EREGS_GIT "https://github.cfpb.gov/eregs/ip.git"
ENV KNOWLEDGEBASE_GIT "https://github.cfpb.gov/CFPB/knowledgebase.git"
ENV LEADERSHIP_CAL_GIT "https://github.cfpb.gov/CFPB/leadership-calendar.git"
ENV OAH_API_GIT "https://github.com/cfpb/owning-a-home-api"
ENV PICARD_GIT "https://github.cfpb.gov/CFPB/Picard"
ENV REG_CORE_GIT "https://github.com/cfpb/regulations-core.git"
ENV REG_SITE_GIT "https://github.com/cfpb/regulations-site.git"
ENV RETIREMENT_GIT "https://github.com/cfpb/retirement.git"
ENV SELFREGISTRATION_GIT "https://github.cfpb.gov/CFPB/cfgov-selfregistration.git"

ENV OAH_GIT "https://github.com/cfpb/owning-a-home"
ENV TAX_TIME_SAVING_GIT "https://github.com/cfpb/tax-time-saving"


WORKDIR /requirements
ADD . /requirements/

RUN curl https://bootstrap.pypa.io/get-pip.py -o /pip/get-pip.py
RUN python /pip/get-pip.py
RUN pip install -r /requirements/requirements.txt

