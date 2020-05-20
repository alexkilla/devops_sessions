mkdir -p private/ssh
ssh-keygen -f $PWD/private/ssh/develop_aws_ssh_access -N ""

mv $PWD/private/ssh/develop_aws_ssh_access $PWD/private/ssh/develop_aws_ssh_access.pem
chmod 400 $PWD/private/ssh/develop_aws_ssh_access.pem
