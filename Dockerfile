FROM jekyll/jekyll:3.7.0
WORKDIR /srv/jekyll
COPY Gemfile Gemfile.lock favicon.ico index.md robots.txt 404.md carte.md personnages.md sitemap.xml _config.yml ./
COPY assets/ ./assets
COPY images/ ./images
COPY _includes/ ./_includes
COPY _posts/ ./_posts
COPY _sass/ ./_sass
COPY _layouts/ ./_layouts
RUN /usr/jekyll/bin/bundle install
RUN mkdir /dst && chown -R jekyll: /dst
RUN /usr/jekyll/bin/jekyll build -d /dst

FROM nginx:1.13.8
EXPOSE 80
WORKDIR /usr/share/nginx/html
COPY --from=0 /dst .
