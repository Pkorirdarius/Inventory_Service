# Use an official Python runtime as a parent image
FROM python:3.10-slim-bullseye
# Upgrade system packages to reduce vulnerabilities
RUN apt-get update && apt-get upgrade -y && apt-get clean
# Set the working directory in the container
WORKDIR /app
# Copy the current directory contents into the container at /app
COPY . /app
# Install dependencies
RUN pip install -r requirements.txt
# Expose port 5000 for the container
EXPOSE 5000
# Define environment variable
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
# Run app.py when the container launches
CMD ["flask", "run"]