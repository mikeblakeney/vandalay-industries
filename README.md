# Vandalay API Review

## Running and Building
The site is built using jekyll.  To use the Makefile for building and developing, you need to have docker installed.  If the jekyll image is not already pulled the image will be pulled the first time it is needed.

### Building

From the project root run `make build`.  This will create the site in the `_site` folder.

### Developing

From the project root run `make serve`.  This will serve the site built by jekyll on `http://localhost:4000/vandalay-industries`.  Changes are automatically detected and the site rebuilt.  You just need to refresh the page to see the updates.
