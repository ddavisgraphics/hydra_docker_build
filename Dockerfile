FROM ruby:2.3-alpine

# Set up dependencies
ENV BUILD_PACKAGES="build-base curl git" \
		DEV_PACKAGES="bzip2-dev libgcrypt-dev libxml2-dev libxslt-dev openssl-dev mysql-client mysql-dev postgresql-dev sqlite-dev zlib-dev" \
		RAILS_DEPS="ca-certificates nodejs tzdata" \
		RAILS_VERSION="5.0.1" 
		
# Install our dependencies and rails
RUN \
	apk add --no-cache --update --upgrade --virtual .railsdeps \
			$BUILD_PACKAGES $DEV_PACKAGES $RAILS_DEPS \
	&& gem install bundler \
	&& gem install rails \
	&& rm -rf /var/cache/apk/* \
	&& mkdir -p /home/hydra
