# Capstone 1: Five Steps

1. **Run it locally.** Fork the repo and run `docker compose up`. You can cast a vote and see it counted.
2. **Containerize it safely.** Pin base images, run as non-root, add a `.dockerignore`. Every image builds and starts.
3. **Create a k8s cluster with Terraform.** Terraform builds a Kubernetes cluster in the default VPC. Destroy it, then recreate it from code.
4. **Automate with GitHub Actions.** Each push runs tests, a Trivy scan, a build and a push, tagged with the commit SHA.
5. **Deploy and roll back with Helm.** One chart, one values file. Ship a bad release on purpose, then run `helm rollback`.

## Optional stretch

Ingress, remote Terraform state, Argo CD, or autoscaling. Only if you finish early.

## Capstone 1: Done Means

## Hand in

- Forked repo with a clear README
- Terraform code and one Helm chart
- A working GitHub Actions pipeline
- Architecture diagram

## Done means

- One push builds, scans, and deploys
- The environment rebuilds from code
- No secrets in Git
- Rollback is shown live
