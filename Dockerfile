FROM python:3.11  

WORKDIR /data

COPY requirements.txt .

RUN apt-get update && apt-get install -y python3-distutils

RUN apt-get install -y python3-dev default-libmysqlclient-dev build-essential


RUN pip install -r requirements.txt

COPY . .

RUN python manage.py migrate

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
