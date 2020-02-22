VERSION = "latest"
build:
	rm -Rf .build
	mkdir .build
	composer create-project craftcms/craft .build --no-install --no-scripts
ifneq ($(VERSION), "latest")
	cd .build; composer require craftcms/cms:$(VERSION)
endif
	cd .build; composer install && composer run post-create-project-cmd
	docker build -t ecceuk/craft-plugin-dev:$(VERSION) .
	docker push ecceuk/craft-plugin-dev:$(VERSION)
	rm -Rf .build
