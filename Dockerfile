FROM python:3.12-slim

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir flake8

CMD ["python", "--version"]