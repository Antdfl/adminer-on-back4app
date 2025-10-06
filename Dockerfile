FROM php:8.1-cli
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo_pgsql pgsql
RUN curl -o /adminer.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
RUN ln -s /adminer.php /index.php
EXPOSE 8080
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/"]
