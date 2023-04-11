# Use the official Python image as base
FROM python:3.9-slim-buster

# Set the working dir in the container
WORKDIR /app

# Copy the requirements file to the working directory
COPY requirements.txt .

# Upgrade pip
RUN python -m pip install --upgrade pip

# Install the required Python packages
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the application code to the working directory
COPY . .

# Set the environment variables for the Flask app
ENV FLASK_RUN_HOST=0.0.0.0

# Expose port 5000 as the flask app runs on it
EXPOSE 5000

# Start Flask app when container is running
CMD ["flask", "run"]