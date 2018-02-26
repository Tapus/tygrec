FROM jekyll/jekyll:3.7.0
WORKDIR /srv/jekyll
COPY sources/ .
RUN /usr/jekyll/bin/bundle install
RUN mkdir /dst && chown -R jekyll: /dst
RUN /usr/jekyll/bin/jekyll build -d /dst

FROM nginx:1.13.8
EXPOSE 80
WORKDIR /usr/share/nginx/html
COPY --from=0 /dst .
