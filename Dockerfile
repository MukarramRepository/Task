FROM python:3.10-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app
COPY requirements.txt .
RUN pip install --upgrade pip \
 && pip install -r requirements.txt

COPY . .

EXPOSE 8000
CMD ["gunicorn", "myapi.wsgi:application", "--bind", "0.0.0.0:8000"]
