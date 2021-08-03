docker build -t ubuntu_image . && docker run -it -p 80:80 --name ubuntu_pod ubuntu_image
# to run again 'docker start -ai ubuntu_pod'