address = data.terraform_remote_state.rds.outputs.address
username = data.terraform_remote_state.rds.outputs.username
#  #!/bin/bash
#  sudo yum update -y
#  sudo yum install -y httpd 
#  sudo systemctl start httpd
#  sudo systemctl enable httpd
#  echo "Our ${env} rds admin name and address" app > /var/www/html/index.html