
# Before run

We have to generate PublicKey from our terminal, then put it into DigitalOcean Dashboard. At main.tf , refer to it as well

`ssh-keygen -t rsa -b 4096 -C aaaa@bbbb.com`

# How to run

`terraform init`

`terraform apply`

(we have to put the TokenAccessKey from DigitalOcean after this command.)


# Reference 

https://www.youtube.com/watch?v=U5suIJwobiQ&t=1120s


