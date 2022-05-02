
P facilitar a poc o binário do terraform se encontra nessa msm pasta, versao 0.12.5
Provider aws esta fixado na 2.20.0

Uso é bem simples basta executar no terminal da seguinte form

Iniciar o terraform
~/{PATH_REPO_CLONADO}/terraform init 
~/{PATH_REPO_CLONADO}/terraform plan

Ex caminho completo da minha máquina
/Users/fernandopimenta/intelig/terraform_serverless/terraform init
/Users/fernandopimenta/intelig/terraform_serverless/terraform apply -auto-approve

/Users/fernandopimenta/intelig/terraform_serverless/terraform destroy -auto-approve


Sobrescrevendo variaveis no terraform com envs de ambiente
TF_VAR_nomevariavelterra

ex:
export TF_VAR_ambiente=dev

doc
https://github.com/hashicorp/terraform-provider-aws/tree/v2.20.0


# Serverless framework
- sls create --template aws-nodejs --path hello-world
- sls deploy (por padrão é dev)
- sls deploy --stage prod
- sls remove
- sls remove --stage fernando


# Npm
- npm i aws-sdk --save-dev