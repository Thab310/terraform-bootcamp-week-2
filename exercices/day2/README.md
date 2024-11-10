### VPC Hands-on Exercise:

1. Create a custom VPC
2. Configure public and private subnets
3. Set up routing and internet gateway
4. Implement network ACLs

### EC2 Hands-on Exercise:

1. Create key pairs
2. Deploy EC2 instances
3. Configure security groups
4. Test SSH access

### Architecture:
![Architecture](/exercices/day2/images/Untitled-2023-03-01-2339.png)

### Retrieve key from local file
```bash
chmod 400 private_key.pem
ssh -i public-instance-1.pem ec2-user@<public-ip>
```

### Issues
![chmod-Issue](/exercices/day2/images/chmod-issue.png)

I was working on a windows machine but using wsl, however when I try to change the permissions to `read-only (chmod 400)` on the public subnet ssh key `'public-instance-key.pem'` It shows that the permissins has changes but when i run `ls -ltrh` i get an output of `-r-xr-xr-x 1 thabelo thabelo 3.2K Nov 10 19:40 public-instance-key.pem` which is `555`. Making it a challenge to ssh into a our public ec2 instance.

### Temporal fix
I had to skip the initial ssh into the public ec2 instance from my local machine and resorted to using aws' native instance connect via the browser. Once I gained access to the public ec2, I then copied the contents of the local `private-instance-key.pem` into a file called `private-instance-key.pem` in the ec2 instance.

![ssh-ec2](/exercices/day2/images/private-instance-ssh.png)

### Permanant fix
> [!NOTE]
* I am currently looking for a solution the wsl linux file permissins issue.


# Questions
1. Are ec2 instance keys only restriced to .pem files?

- 

