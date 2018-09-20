FROM composer

# node-sass gets built from source (??) so we need the build-base package
RUN composer global require tightenco/jigsaw && \
	composer clear-cache && \
	apk update && \
	apk --no-cache add nodejs build-base && \
	npm install -g npm && \
	npm cache clean --force

ENV PATH="/tmp/vendor/bin:${PATH}"

CMD ["jigsaw"]
