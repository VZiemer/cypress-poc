# Cypress Testing with Docker and AWS Fargate

This project demonstrates how to set up and run Cypress tests using Docker and AWS Fargate. The setup involves building a Docker image with Cypress tests, pushing the image to Amazon ECR, and creating a task definition in Amazon ECS to execute the tests.

## Prerequisites

- Docker installed on your local machine
- AWS CLI configured with appropriate credentials
- AWS account with permissions to access ECS, ECR, and CloudWatch Logs

## Setup

### 1. Docker Setup

1. **Create a `Dockerfile`:**

   ```dockerfile
   # Use the Cypress included image as the base
   FROM cypress/included:13.11.0

   # Define the working directory in the container
   WORKDIR /app

   # Copy Cypress tests and configuration to the container
   COPY cypress /app/cypress
   COPY cypress.config.ts /app/cypress.config.ts

   # Verify Cypress installation
   RUN npx cypress verify

   # Define the entrypoint to run Cypress tests
   ENTRYPOINT ["npx", "cypress", "run"]


Run `aws ecr create-repository --repository-name my-cypress-project`

Run `aws ecr get-login-password --region <your-region> | docker login --username AWS --password-stdin <your-account-id>.dkr.ecr.<your-region>.amazonaws.com`

Run `docker tag my-cypress-project:latest <your-account-id>.dkr.ecr.<your-region>.amazonaws.com/my-cypress-project:latest
docker push <your-account-id>.dkr.ecr.<your-region>.amazonaws.com/my-cypress-project:latest`