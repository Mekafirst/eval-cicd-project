# Start with the FastAPI base image
FROM tiangolo/uvicorn-gunicorn:python3.11
# Set the working directory
WORKDIR /app
# Copy the application code and requirements
COPY . /app
# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt
# Copy SSL certificates from the certs directory
COPY certs /app/certs
# Expose the port the app runs on
EXPOSE 8001
# Command to run the FastAPI app with Uvicorn
CMD ["uvicorn", "app.minigroq:app", "--host", "0.0.0.0", "--port", "8001"]
