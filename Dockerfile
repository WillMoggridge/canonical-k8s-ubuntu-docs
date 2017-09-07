FROM node:7-slim as node-builder
WORKDIR /srv
COPY docs.ubuntu.com /srv
RUN npm install -u -g bower yarn \
    && yarn install
RUN yarn run build


FROM python:3.6-slim
WORKDIR /srv
COPY docs.ubuntu.com /srv
RUN pip3 install -r /srv/requirements.txt gunicorn==19.7.1

COPY --from=node-builder /srv/static/css /srv/static/css

EXPOSE 80
CMD gunicorn --bind 0.0.0.0:80 webapp.wsgi
