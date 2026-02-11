FROM php:8.2-apache

RUN a2enmod rewrite

# Set Apache to serve from website folder
RUN sed -i 's#/var/www/html#/var/www/html/website#g' /etc/apache2/sites-available/000-default.conf && \
    sed -i 's#/var/www/html#/var/www/html/website#g' /etc/apache2/apache2.conf

COPY . /var/www/html/

RUN chown -R www-data:www-data /var/www/html/website

EXPOSE 80
CMD ["apache2-foreground"]