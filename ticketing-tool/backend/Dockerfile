FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies (optional but good for psycopg2 & pillow)
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first (for better docker caching)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# ✅ Install missing email validator without editing requirements file
RUN pip install --no-cache-dir email-validator

# Copy application code
COPY . .

# Expose backend port
EXPOSE 8000

# Run FastAPI app
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

