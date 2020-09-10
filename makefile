update-images: update-base-images update-dev-images

update-dev-images: build-dev-images
	docker push patricksiemen/php-nginx-symfony:latest-dev
	docker push patricksiemen/php-nginx-symfony:7.1-dev
	docker push patricksiemen/php-nginx-symfony:7.2-dev
	docker push patricksiemen/php-nginx-symfony:7.3-dev
	docker push patricksiemen/php-nginx-symfony:7.4-dev

update-base-images: build-base-images
	docker push patricksiemen/php-nginx-symfony:latest
	docker push patricksiemen/php-nginx-symfony:7.1
	docker push patricksiemen/php-nginx-symfony:7.2
	docker push patricksiemen/php-nginx-symfony:7.3
	docker push patricksiemen/php-nginx-symfony:7.4

build-base-images:
	docker build -t patricksiemen/php-nginx-symfony:7.1 --build-arg PHP_VERSION=7.1 base
	docker build -t patricksiemen/php-nginx-symfony:7.2 --build-arg PHP_VERSION=7.2 base
	docker build -t patricksiemen/php-nginx-symfony:7.3 --build-arg PHP_VERSION=7.3 base
	docker build -t patricksiemen/php-nginx-symfony:7.4 --build-arg PHP_VERSION=7.4 base
	docker tag patricksiemen/php-nginx-symfony:7.4 patricksiemen/php-nginx-symfony:latest

build-dev-images:
	docker build -t patricksiemen/php-nginx-symfony:7.1-dev --build-arg PHP_VERSION=7.1 dev
	docker build -t patricksiemen/php-nginx-symfony:7.2-dev --build-arg PHP_VERSION=7.2 dev
	docker build -t patricksiemen/php-nginx-symfony:7.3-dev --build-arg PHP_VERSION=7.3 dev
	docker build -t patricksiemen/php-nginx-symfony:7.4-dev --build-arg PHP_VERSION=7.4 dev
	docker tag patricksiemen/php-nginx-symfony:7.4-dev patricksiemen/php-nginx-symfony:latest-dev
