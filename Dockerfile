FROM python:3

# Install required system packages
RUN apt-get update && apt-get install -y python3-distutils

# Set working directory
WORKDIR /data

# Install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy all files to the container
COPY . .

# Run migrations
RUN python manage.py migrate

# Expose port
EXPOSE 8000

# Start server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
