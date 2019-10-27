
Best way to force Docker to rebuild Docker Compose images
Kanan Rahimov	General	April 4, 2018	0 Minutes	

Sorry, it is again about Docker 🙂 I use it more and more last days.

At some point we need to rebuild images from scratch without using cache. You can use following commands to achieve best results:
1
2
	
docker system prune
docker-compose build --no-cache

Then you can use up command as usual:
1
	
docker-compose up
