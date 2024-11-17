# Use an official Python runtime as a base image
FROM python:3.9-slim

# Set environment variables
# Prevents Python from writing .pyc files to disk
ENV PYTHONDONTWRITEBYTECODE=1  
 # Ensures output from Python appears immediately
ENV PYTHONUNBUFFERED=1        

# Set working directory
WORKDIR /app

# Copy only the requirements file to the container
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 5000

# Define the command to run the application
CMD ["python", "app.py"]

# To run a container locally on port 5000, use below command
# docker run -p 5000:5000 google-checker:latest
