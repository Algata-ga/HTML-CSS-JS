SITE_NAME ?= template
#Change this to the actual site name
.PHONY : build preview

build:
	parcel build --dist-dir .dist index.html
preview: build
	git checkout gh-pages
	git rm -rf *
	cp -r .dist/* .
	git commit 
	git push
	git checkout main
deploy: build
	mv .dist ${SITE_NAME}
	tar czf ${SITE_NAME}.tar.gz ${SITE_NAME}
	rm -rf ${SITE_NAME}
	sftp ${USERNAME}@${SERVER_ADDRESS} << "put ${SITE_NAME}.tar.gz"
clean:
	rm -rf dist &> /dev/null

