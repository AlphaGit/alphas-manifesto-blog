FROM jekyll/jekyll:4.0 AS jekyll
RUN gem install jekyll-sitemap jekyll-paginate jekyll-sitemap jekyll-gist jekyll-feed jekyll-include-cache jekyll-seo-tag webrick

FROM jekyll
VOLUME [ "/srv/jekyll" ]
CMD [ "jekyll", "serve", "--watch", "--incremental" ]