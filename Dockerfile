FROM python:3.12-slim

# Set the working directory
WORKDIR /app

# Install system dependencies
#RUN apt-get update && apt-get install -y \
#    gcc \
#    curl \
#    libc-dev \
#    libffi-dev \
#    openssl-dev \
#    build-base \
#    py3-setuptools \
#    py3-wheel \
#    musl-dev \
#    cmake \
#    make \
#    g++

# Install Poetry
RUN pip install poetry

# Copy everything from the current directory to the working directory
COPY . /app

# Install dependencies
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

# Expose the port
EXPOSE 8501

# Run the application
CMD ["poetry", "run",  "python", "src/app.py"]
