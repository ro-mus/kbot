# Kubernetes Prompts for Deploying Nginx

This repository contains a collection of Kubernetes manifests for deploying an Nginx application. Each prompt is designed to showcase different Kubernetes features.

| NAME                  | PROMPT                                         | DESCRIPTION                                           | EXAMPLE                                      |
|-----------------------|------------------------------------------------|-------------------------------------------------------|----------------------------------------------|
| app.yaml              | `Create a basic deployment for Nginx.`         | Basic Nginx deployment manifest.                      | [app.yaml](yaml/app.yaml)                    |
| app-livenessProbe.yaml| `Add a liveness probe to the Nginx deployment.`| Liveness probe for health checks.                     | [app-livenessProbe.yaml](yaml/app-livenessProbe.yaml) |
| app-readinessProbe.yaml| `Add a readiness probe to the Nginx deployment.`| Readiness probe for availability checks.               | [app-readinessProbe.yaml](yaml/app-readinessProbe.yaml) |
| app-volumeMounts.yaml | `Mount a volume to the Nginx deployment.`      | Volume mounts for Nginx.                              | [app-volumeMounts.yaml](yaml/app-volumeMounts.yaml)   |
| app-cronjob.yaml      | `Create a cronjob for periodic tasks.`         | CronJob manifest for scheduled tasks.                 | [app-cronjob.yaml](yaml/app-cronjob.yaml)    |
| app-job.yaml          | `Create a job for one-time tasks.`             | Job manifest for a one-time task.                     | [app-job.yaml](yaml/app-job.yaml)            |
| app-multicontainer.yaml| `Deploy Nginx in a multi-container pod.`       | Multi-container pod example with Nginx.               | [app-multicontainer.yaml](yaml/app-multicontainer.yaml) |
| app-resources.yaml    | `Set resource limits for the Nginx deployment.`| Resource limits and requests for Nginx.               | [app-resources.yaml](yaml/app-resources.yaml)|
| app-secret-env.yaml   | `Use secrets for environment variables.`       | Environment variables from Kubernetes secrets.        | [app-secret-env.yaml](yaml/app-secret-env.yaml) |

