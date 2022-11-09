images: cli-images web-images web-dev-images
	docker buildx prune --all --force

cli-images:
	docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag patricksiemen/php-nginx-symfony:cli-7.1 --build-arg PHP_VERSION=7.1 cli
	docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag patricksiemen/php-nginx-symfony:cli-7.2 --build-arg PHP_VERSION=7.2 cli
	docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag patricksiemen/php-nginx-symfony:cli-7.3 --build-arg PHP_VERSION=7.3 cli
	docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag patricksiemen/php-nginx-symfony:cli-7.4 --tag patricksiemen/php-nginx-symfony:cli-7 --build-arg PHP_VERSION=7.4 cli
	docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag patricksiemen/php-nginx-symfony:cli-8.0 --build-arg PHP_VERSION=8.0 cli
	docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag patricksiemen/php-nginx-symfony:cli-8.1 --build-arg PHP_VERSION=8.1 cli
	docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag patricksiemen/php-nginx-symfony:cli-8.2 --tag patricksiemen/php-nginx-symfony:cli-8 --tag patricksiemen/php-nginx-symfony:cli-latest --build-arg PHP_VERSION=8.2 cli

web-images:
	docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag patricksiemen/php-nginx-symfony:web-7.1 --build-arg PHP_VERSION=7.1 web
	docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag patricksiemen/php-nginx-symfony:web-7.2 --build-arg PHP_VERSION=7.2 web
	docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag patricksiemen/php-nginx-symfony:web-7.3 --build-arg PHP_VERSION=7.3 web
	docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag patricksiemen/php-nginx-symfony:web-7.4 --tag patricksiemen/php-nginx-symfony:web-7 --build-arg PHP_VERSION=7.4 web
	docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag patricksiemen/php-nginx-symfony:web-8.0 --build-arg PHP_VERSION=8.0 web
	docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag patricksiemen/php-nginx-symfony:web-8.1 --build-arg PHP_VERSION=8.1 web
	docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag patricksiemen/php-nginx-symfony:web-8.2 --tag patricksiemen/php-nginx-symfony:web-8 --tag patricksiemen/php-nginx-symfony:web-latest --tag patricksiemen/php-nginx-symfony:latest --build-arg PHP_VERSION=8.2 web

web-dev-images:
#	no 7.1 since xdebug requires at least 7.2!
	docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag patricksiemen/php-nginx-symfony:web-7.2-dev --build-arg PHP_VERSION=7.2 web-dev
	docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag patricksiemen/php-nginx-symfony:web-7.3-dev --build-arg PHP_VERSION=7.3 web-dev
	docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag patricksiemen/php-nginx-symfony:web-7.4-dev --tag patricksiemen/php-nginx-symfony:web-7-dev --build-arg PHP_VERSION=7.4 web-dev
	docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag patricksiemen/php-nginx-symfony:web-8.0-dev --build-arg PHP_VERSION=8.0 web-dev
	docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag patricksiemen/php-nginx-symfony:web-8.1-dev --build-arg PHP_VERSION=8.1 web-dev
	docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag patricksiemen/php-nginx-symfony:web-8.2-dev --tag patricksiemen/php-nginx-symfony:web-8-dev --tag patricksiemen/php-nginx-symfony:web-latest-dev --build-arg PHP_VERSION=8.2 web-dev
