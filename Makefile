docker=docker run -it -v "${PWD}:/srv/jekyll" --rm -p 4000:4000 jekyll/jekyll

serve:
	$(docker) jekyll serve

build:
	$(docker) jekyll build
