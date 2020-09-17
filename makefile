update-images: update-cli-images update-web-dev-images update-web-images

update-cli-images: build-cli-images
	docker push patricksiemen/php-nginx-symfony:cli-7.1
	docker push patricksiemen/php-nginx-symfony:cli-7.2
	docker push patricksiemen/php-nginx-symfony:cli-7.3
	docker push patricksiemen/php-nginx-symfony:cli-7.4
	docker push patricksiemen/php-nginx-symfony:cli-latest

update-web-dev-images: build-web-images build-web-dev-images
	docker push patricksiemen/php-nginx-symfony:web-7.1-dev
	docker push patricksiemen/php-nginx-symfony:web-7.2-dev
	docker push patricksiemen/php-nginx-symfony:web-7.3-dev
	docker push patricksiemen/php-nginx-symfony:web-7.4-dev
	docker push patricksiemen/php-nginx-symfony:web-latest-dev
	docker push patricksiemen/php-nginx-symfony:latest-dev

update-web-images: build-web-images
	docker push patricksiemen/php-nginx-symfony:web-7.1
	docker push patricksiemen/php-nginx-symfony:web-7.2
	docker push patricksiemen/php-nginx-symfony:web-7.3
	docker push patricksiemen/php-nginx-symfony:web-7.4
	docker push patricksiemen/php-nginx-symfony:web-latest
	docker push patricksiemen/php-nginx-symfony:latest

build-cli-images:
	docker build -t patricksiemen/php-nginx-symfony:cli-7.1 --build-arg PHP_VERSION=7.1 cli
	docker build -t patricksiemen/php-nginx-symfony:cli-7.2 --build-arg PHP_VERSION=7.2 cli
	docker build -t patricksiemen/php-nginx-symfony:cli-7.3 --build-arg PHP_VERSION=7.3 cli
	docker build -t patricksiemen/php-nginx-symfony:cli-7.4 --build-arg PHP_VERSION=7.4 cli
	docker tag patricksiemen/php-nginx-symfony:cli-7.4 patricksiemen/php-nginx-symfony:cli-latest

build-web-images:
	docker build -t patricksiemen/php-nginx-symfony:web-7.1 --build-arg PHP_VERSION=7.1 web
	docker build -t patricksiemen/php-nginx-symfony:web-7.2 --build-arg PHP_VERSION=7.2 web
	docker build -t patricksiemen/php-nginx-symfony:web-7.3 --build-arg PHP_VERSION=7.3 web
	docker build -t patricksiemen/php-nginx-symfony:web-7.4 --build-arg PHP_VERSION=7.4 web
	docker tag patricksiemen/php-nginx-symfony:web-7.4 patricksiemen/php-nginx-symfony:web-latest
	docker tag patricksiemen/php-nginx-symfony:web-latest patricksiemen/php-nginx-symfony:latest

build-web-dev-images:
	docker build -t patricksiemen/php-nginx-symfony:web-7.1-dev --build-arg PHP_VERSION=7.1 web-dev
	docker build -t patricksiemen/php-nginx-symfony:web-7.2-dev --build-arg PHP_VERSION=7.2 web-dev
	docker build -t patricksiemen/php-nginx-symfony:web-7.3-dev --build-arg PHP_VERSION=7.3 web-dev
	docker build -t patricksiemen/php-nginx-symfony:web-7.4-dev --build-arg PHP_VERSION=7.4 web-dev
	docker tag patricksiemen/php-nginx-symfony:web-7.4-dev patricksiemen/php-nginx-symfony:web-latest-dev
	docker tag patricksiemen/php-nginx-symfony:web-latest-dev patricksiemen/php-nginx-symfony:latest-dev
