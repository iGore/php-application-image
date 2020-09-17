#!/bin/bash
php $PROJECT_BINARIES/console doctrine:database:create --if-not-exists --no-debug --no-interaction --no-ansi
php $PROJECT_BINARIES/console doctrine:migrations:migrate --no-debug --no-interaction --no-ansi --allow-no-migration