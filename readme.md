# Project: Python API and EC2 Bastion Host Setup

## Description
- A simple Python API that returns the current date and time.
- A Terraform configuration to create an EC2 instance as a bastion host.

## Python API
- The Python app is created using FastAPI and Dockerized.
- The endpoint returns the current date and time.

## Terraform
- Terraform is used to create an EC2 instance as a bastion host.
- Assumes an existing VPC with public subnets.

## Setup

### Python API
1. Navigate to the `/python-app` directory.
2. Build and run the Docker container:
   ```bash
   docker build -t timestamp-api .
   docker run -d -p 8000:8000 timestamp-api
