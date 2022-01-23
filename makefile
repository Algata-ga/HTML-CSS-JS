.PHONY : build preview

build:
	parcel build index.html
clean:
	rm -rf dist &> /dev/null

