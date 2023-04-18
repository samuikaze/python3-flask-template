FROM python:3.11.3-slim

WORKDIR /app

COPY . .
COPY .infrastructures/scripts/startup.sh ./startup.sh

RUN apt update -y \
    && apt install -y \
        nginx \
    && pip install -r requirements.txt \
    && rm -rf .infrastructures \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /etc/nginx/sites-enabled/default \
    && chmod +x startup.sh

COPY .infrastructures/nginx/wsgi-app.conf /etc/nginx/sites-enabled/default.conf

EXPOSE 80

CMD ["sh", "startup.sh"]
