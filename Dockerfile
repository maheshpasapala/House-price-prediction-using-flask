# Use official Python runtime as base image
FROM python:3.9-slim

# Apply security updates to packages inherited from the base image.
RUN apt-get update \
	&& apt-get upgrade -y \
	&& rm -rf /var/lib/apt/lists/*

# Set working directory in container
WORKDIR /app

# Copy requirements file
COPY requirement.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirement.txt

# Copy application files
COPY app.py .
COPY house.py .
COPY house_data.csv .
COPY model.pkl .
COPY templates/ templates/
COPY static/ static/

# Expose port 5000
EXPOSE 5000

# Set environment variable for Flask
ENV FLASK_APP=app.py
ENV FLASK_ENV=production

# Run Flask application
CMD ["python", "app.py"]