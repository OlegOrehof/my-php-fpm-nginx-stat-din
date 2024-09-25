# Используем базовый образ PHP-FPM на Alpine
FROM php:7.3-fpm-alpine

# Установим nginx
RUN apk add --no-cache nginx

# Скопируем конфигурацию Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Устанавливаем рабочую директорию
WORKDIR /var/www/html

# Копируем PHP-скрипты
COPY ./src /var/www/html

# Копируем статические файлы
COPY ./static /var/www/html/static

# Настроим права доступа
RUN chown -R www-data:www-data /var/www/html

# Открываем порт 80 для Nginx
EXPOSE 80

# Запуск PHP-FPM и Nginx
CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]