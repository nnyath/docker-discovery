#TODO : Add vars instead of hardcoding names/locations/ports/etc 

build:
	@docker build -t myjenkins ./jenkins-master
	@docker build -t myjenkinsdata ./jenkins-data
	@docker build -t myjenkinsproxy ./jenkins-nginx
shell:
	@docker exec -it jenkins-master /bin/bash
shellnginx:
	@docker exec -it jenkins-nginx /bin/bash
runjenkins:
	@docker run -p 50000:50000 --name=jenkins-master --volumes-from=jenkins-data -d myjenkins
rundata:
	@docker run --name=jenkins-data myjenkinsdata
clearn:
	@docker stop jenkins-nginx
	@docker rm -v jenkins-nginx	
runnginx:
	@docker run -p 80:80 --name=jenkins-nginx --link jenkins-master -d myjenkinsproxy
start:
	@docker start jenkins-master
	@docker start jenkins-data
stop:
	@docker stop jenkins-master
	@docker stop jenkins-data
clean:	stop
	@docker rm -v jenkins-master	
ps:
	@docker exec jenkins-master ps -ef | grep java
tail:
	@docker exec jenkins-master tail -f /var/log/jenkins/jenkins.log
initpass:
	@docker exec jenkins-master  cat /var/jenkins_home/secrets/initialAdminPassword
