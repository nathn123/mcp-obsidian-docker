FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install uv for package management
RUN pip install uv

# Copy requirements
COPY requirements.txt .

# Install dependencies
RUN uv pip install -r requirements.txt

# Copy the rest of the application
COPY . .

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Command to run the server
CMD ["uv", "run", "mcp-obsidian"] 