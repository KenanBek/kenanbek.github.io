
Clean up Docker images, containers, volumes, networks and build cache
Kanan Rahimov	General	March 19, 2018	0 Minutes	

Task: remove everything related to Docker and cleanup

Solution:
1
	
sudo docker system prune

If you want to remove any stopped containers and all unused images, not just dangling images use it with “-a” option:
1
	
sudo docker system prune -a

Why: after playing with Docker and Docker Compose at some point you may have tons of unused images and containers which occupy disk space. I do not like keeping unnecessary files on my system 🙂

Links:
How To Remove Docker Images, Containers, and Volumes (DigitalOcean)
Docker Pruning (official docs)
