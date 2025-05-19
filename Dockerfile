FROM python:3.11  # Use a stable version that still supports distutils

WORKDIR /data

COPY requirements.txt .

RUN apt-get update && apt-get install -y python3-distutils

RUN pip install -r requirements.txt

COPY . .

RUN python manage.py migrate
