# Use a known-good Python runtime image so rebuilds are reproducible.
FROM python:3.9-slim@sha256:2d97f6910b16bd338d3060f261f53f144965f755599aab1acda1e13cf1731b1b

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

# Update packaging tools included in the base image.
RUN pip install --no-cache-dir --upgrade "setuptools>=80.9.0" "wheel>=0.46.2"

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