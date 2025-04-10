# gh-actions-terraform

> This project is a simple example of how to use GitHub Actions to provision infrastructure with Terraform.

<div align=>
	<img align="center"  src=/.github/assets/img/github-actions.png>
</div> 

  <div style="display: flex; flex-direction: column; gap: 10px;">
    <img src="/.github/assets/img/terraform-T.png" height="45">
    <img src="/.github/assets/img/localstack" height="45">
  </div>

## 📁 Project Structure

- `main.tf` – Main Terraform configuration.
- `variables.tf` – Input variables.
- `outputs.tf` – Output values.
- `.github/workflows/` – where the GitHub Actions workflow will live.

---

## 🚀 How to Use

1. **Clone the repository:**

```bash
git clone https://github.com/your-user/gh-actions-terraform.git
cd gh-actions-terraform
```

2. **Setup LocalStack:**

Make sure [Docker](https://docs.docker.com/get-docker/) is installed. 

Start `LocalStack` by running:

```bash
cd localstack
docker compose up -d
```
More info on how to install `LocalStack` can be found [here](https://docs.localstack.cloud/getting-started/installation/).

## ▶️ Github Actions

> For this project we're going to use self-hosted runners to run the workflow in top of a kubernetes cluster.

3. **Setup GitHub Actions Runner:**

First you need to create a Personal Access Token (PAT) with the following permissions:

- `repo`
- `workflow`

See more info here [Creating a personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-personal-access-token-classic).

Once you have the PAT, you need to create the secret containing the token in your k8s cluster.

```
root@raspberrypi4-5:~github-actions# cat github-secret.yaml
apiVersion: v1
kind: Secret
metadata:
  name: github-pat
  namespace: arc-runners
type: Opaque
stringData:
  github_token: <your-pat>
```

```bash
kubectl apply -f github-secret.yaml
```

2.1 **Install the runner controller:**

```bash
helm install arc --namespace arc-controller oci://ghcr.io/actions/actions-runner-controller-charts/gha-runner-scale-set-controller
```

2.2 **Install the runner set:**

```bash
INSTALLATION_NAME="my-runner-set"
NAMESPACE="arc-runners"
GITHUB_CONFIG_URL="https://github.com/tbernacchi/gh-actions-terraform"  # Replace with your repository URL
GITHUB_PAT="<your-pat>"  # Replace with your Personal Access Token
```

```bash
helm install "${INSTALLATION_NAME}" \
    --namespace "${NAMESPACE}" \
    --create-namespace \
    --set githubConfigUrl="${GITHUB_CONFIG_URL}" \
    --set githubConfigSecret.github_token="${GITHUB_PAT}" \
    oci://ghcr.io/actions/actions-runner-controller-charts/gha-runner-scale-set
```

At this point you should have a runner set up and ready to use.

You can check on the GitHub repository settings under `Settings` > `Actions` > `Runners` that the runner is online.

That's it! You can now start pushing commits to the repository and the GitHub Actions workflow will be triggered.

---

## 📝 Notes

- [Hosting your own runners](https://docs.github.com/en/actions/hosting-your-own-runners)
- [GitHub Actions Runner Controller](https://github.com/actions/actions-runner-controller)
- [Quickstart for Actions Runner Controller](https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners-with-actions-runner-controller/quickstart-for-actions-runner-controller)
- [Adding self-hosted runners](https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners/adding-self-hosted-runners)
