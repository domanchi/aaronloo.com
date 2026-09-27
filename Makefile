# Prefer project Ruby via mise when available (see mise.toml).
MISE := $(firstword $(wildcard $(HOME)/.local/bin/mise) $(shell command -v mise 2>/dev/null))
ifdef MISE
  RUN := $(MISE) exec --
else
  RUN :=
endif

export GEM_HOME := $(CURDIR)/vendor/gems
# Keep Bundler from nesting gems under vendor/gems/ruby/...
unexport BUNDLE_PATH
unexport BUNDLE_BIN

.PHONY: watch
watch: vendor/gems/bin/jekyll
	$(RUN) env GEM_HOME="$(GEM_HOME)" bundle exec jekyll serve --source docs/ --host 127.0.0.1

# watch-fast doesn't handle new files / routing changes well.
.PHONY: watch-fast
watch-fast: vendor/gems/bin/jekyll
	$(RUN) env GEM_HOME="$(GEM_HOME)" bundle exec jekyll serve --source docs/ --host 127.0.0.1 --incremental

.PHONY: test
test: vendor/gems/bin/jekyll
	$(RUN) env GEM_HOME="$(GEM_HOME)" bundle exec rake test

vendor/gems/bin/jekyll: Gemfile
	$(RUN) env GEM_HOME="$(GEM_HOME)" gem install bundler --no-document
	$(RUN) env GEM_HOME="$(GEM_HOME)" bundle install
	@test -x $@
