#!/bin/sh

apt-get update
apt-get install -y zlib1g-dev libpng-dev libjpeg-dev libicu-dev g++ libzip-dev git libmagickwand-dev wget unzip
pecl install imagick
apt-get clean