FROM php:8.1-cli

# Install PostgreSQL extensions
RUN apt-get update && apt-get install -y libpq-dev wget \
    && docker-php-ext-install pdo_pgsql pgsql

# Download Adminer, try both wget and curl for reliability
RUN wget -O /adminer.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php || curl -o /adminer.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

# Debug: list file to make sure it's there
RUN ls -lh /adminer.php

# Symlink for root access
RUN ln -s /adminer.php /index.php

EXPOSE 8080
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/"]
