## Prerequisites

To run all this yourself, you'll need the following:

* A Github account.
* Clone repo so you have a copy.
* Install Terraform
* Install Ansible
* If you don't have an AWS account, create one. Then create a key for API usage.
* Install the AWS sdk, run `aws configure`, and configure it using the previously created key and secret.


## Steps

### Terraform - Make Infrastructure Happen

Run `terraform apply`. This will create the EC2 instance in AWS.

Things to note:

* `aws/main.tf` - Note that ssh and port 8080 are allowed on ingress.
* An SSH key will be created in the parent directory at the path `../key/mykey.pem` See `aws/ec2/main.tf`.

### Ansible - Configure Your Server

Now take the same dns name and update the `inventory` file in the `ansible` folder. Then run the following command.

`ansible-playbook playbook.yaml -i inventory`

### Github Action - Deploy Your Code

Next you will deploy the dotnet app. The repo already contains the github actions configuration file, but you will have to update the server variable name (`EC2_DNS_NAME`) and the ssh key (`EC2_SSH_KEY`) value. Once those values are plugged in, you can go to `https://github.com/{you}/nov-2023-terraform-ansible-githubactions/actions/workflows/main.yml` and run the workflow.

### Done!

Now destroy it all so it doesn't cost you anything: `terraform destroy`.

## Login with SSH to Poke Around

When the server is up and running, you can test that you can SSH into by using the generated key.

`ssh ubuntu@(generated-dns-name-goes-here) -i mykey.pem`

### Useful Unix Tools

* `journalctl -u north-dallas-developers -n 40` - See logs from our service/app
* `systemctl start/stop/restart north-dallas-developers` - If you make any changes to things on the server or just in general want to start/stop/restart the service, this is how you would do it.