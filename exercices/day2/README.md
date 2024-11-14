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
I used ChatGpt to help me troubleshoot the issue. 

Please pay attention to the promt and the answer below:

![ssh-solved](/exercices/day2/images/chat-gpt-solution.png)

### Below is a end to end flow:
![solution](/exercices/day2/images/solution.png)
### Succesful private ec2 instance login
* Note that we are inside the private ec2 instance and we can validate that by running ping 8.8.8.8 which is google's ip address. We can see that 7661 packets were transmitted but all of them were lost.

![solution](/exercices/day2/images/private-instance-validation.png)

![TIP] I urge you to go through my blog if you still do not understand fully.


# Questions
1. Are ec2 instance keys only restriced to .pem files?

- 

