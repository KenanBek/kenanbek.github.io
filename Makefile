# Jekyll Personal Website Makefile

# Use Homebrew Ruby
RUBY_PATH := /opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/4.0.0/bin
BUNDLE := PATH="$(RUBY_PATH):$$PATH" bundle

# Install dependencies
install:
	$(BUNDLE) install

# Start development server
serve:
	$(BUNDLE) exec jekyll serve

# Start with drafts visible
drafts:
	$(BUNDLE) exec jekyll serve --drafts

# Start with live reload
live:
	$(BUNDLE) exec jekyll serve --livereload

# Build the site
build:
	$(BUNDLE) exec jekyll build

# Clean generated files
clean:
	$(BUNDLE) exec jekyll clean

# Update dependencies
update:
	$(BUNDLE) update

# Shortcuts
r: serve
s: serve
d: drafts
b: build

# Git shortcuts
p:
	git add . && git commit -m "$(if $(message),$(message),Update)" && git push

.PHONY: install serve drafts live build clean update r s d b p
