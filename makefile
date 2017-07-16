#TODO : Add vars instead of hardcoding names/locations/ports/etc 

build:
	@docker-compose build
run:
	@docker-compose up -d
stop:
	@docker-compose stop
clean:
	@echo y | docker-compose rm jenkinsmaster jenkinsnginx jenkinstomcat
cleanall:
	@docker-compose rm
shellmaster:
	@docker exec -it jenkins_jenkinsmaster_1 /bin/bash
shellnginx:
	@docker exec -it jenkins_jenkinsnginx_1 /bin/bash
shelltomcat:
	@docker exec -it jenkins_jenkinstomcat_1 /bin/bash
ps:
	@docker-compose ps
tail:
	@docker exec jenkins_jenkinsmaster_1 tail -f /var/log/jenkins/jenkins.log
initpass:
	@docker exec jenkins_jenkinsmaster_1  cat /var/jenkins_home/secrets/initialAdminPassword
