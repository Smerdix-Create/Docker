FROM python:3.8-alpine
WORKDIR /app
ENV user=admin
ENV password=pass
ENV email=admin@admin.com
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
RUN addgroup -S tech && adduser -S tech -G tech
RUN chown -R tech:tech /app
USER tech
EXPOSE 8000
CMD sh init.sh && python3 manage.py runserver 0.0.0.0:8000
