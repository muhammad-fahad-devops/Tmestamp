# Use slim Python base
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy app file
COPY Timestamp-Api.py .

# Install required packages
RUN pip install fastapi uvicorn pytz

# Expose FastAPI default port
EXPOSE 8000

# Start server (no need for root `/`, just /datetime)
CMD ["uvicorn", "Timestamp-Api:app", "--host", "0.0.0.0", "--port", "8000"]
