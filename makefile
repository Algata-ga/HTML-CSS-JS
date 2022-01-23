SITE_NAME ?= template
#Change this to the actual site name

USERNAME ?=
SERVER_ADDRESS ?=
# add your server details here
# this is created assuming you are using keys for authentication
# if not, YOU SHOULD

.PHONY : build preview

build:
	rm -rf .dist/*
	parcel build --dist-dir .dist index.html
local:
	parcel serve --dist-dir .dist index.html
preview: build
	git checkout gh-pages
	git rm -rf *
	git restore --staged .gitignore
	git restore .gitignore
	cp -r .dist/* .
	git add --all
	git commit 
	git push
	git checkout main
deploy: build
	mv .dist ${SITE_NAME}
	tar czf ${SITE_NAME}.tar.gz ${SITE_NAME}
	rm -rf ${SITE_NAME}
	sftp ${USERNAME}@${SERVER_ADDRESS} <<< "put ${SITE_NAME}.tar.gz"
	rm -rf ${SITE_NAME}.tar.gz

