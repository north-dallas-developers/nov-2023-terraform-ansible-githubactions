
## Steps

### Terraform Apply

Run `terraform apply`. This will create the EC2 instance in AWS.

Things to note:

* `aws/main.tf` - Note that ssh and port 8080 are allowed on ingress.
* An SSH key will be created in the parent directory at the path `../key/mykey.pem` See `aws/ec2/main.tf`.

### Login with SSH

When the server is up and running, you can test that you can SSH into by using the generated key.

`ssh ubuntu@(generated-dns-name-goes-here) -i mykey.pem`

### Ansible

Now take the same dns name and update the `inventory` file in the `ansible` folder. Then run the following command.

`ansible-playbook playbook.yaml -i inventory`

### Deploying to AWS

Next you will deploy the dotnet app. The repo already contains the github actions configuration file, but you will have to update the server variable name (`EC2_DNS_NAME`) and the ssh key (`EC2_SSH_KEY`) value.

### Done!

Now destroy it all so it doesn't cost you anything: `terraform destroy`.