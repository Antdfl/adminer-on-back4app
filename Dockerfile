FROM php:8.1-cli
RUN curl -o /adminer.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
EXPOSE 8080
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/"]
