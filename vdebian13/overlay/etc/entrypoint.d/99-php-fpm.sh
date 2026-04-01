#!/usr/bin/env bash

declare -x HOME
[[ -z "${HOME}" ]] && HOME="/var/www/html"

declare -x LANG
[[ -z "${LANG}" ]] && LANG="C"

declare -x PHP_PREFIX
[[ -z "${PHP_PREFIX}" ]] && PHP_PREFIX="/opt/php-7.4"

declare -x PHP_INI_DIR
[[ -z "${PHP_INI_DIR}" ]] && PHP_INI_DIR="${PHP_PREFIX}/etc/php"

declare -x PHP_FPM_ENTRYPOINT_INITIALIZED
[[ -z "${PHP_FPM_ENTRYPOINT_INITIALIZED}" ]] && PHP_FPM_ENTRYPOINT_INITIALIZED="true"

declare -x APACHE_LISTEN
[[ -z "${APACHE_LISTEN}" ]] && APACHE_LISTEN="8080"

true
