FROM python:3.9

# Install SSH Client
RUN apt-get update && apt-get install -y openssh-client

# Set environment variables
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /app

# Copy requirements file
COPY ./requirements.txt /app/requirements.txt

# Install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy project to the working directory
COPY . /app/

# Start the SSH tunnel
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]