//Unused Sample for Pipeline Shell

node {
   stage('Prep Java App') {
        git url: 'git://github.com/nnyath/hello-jenkins-server', branch: 'master'
        echo 'GIT'
   }
   stage('Build Java App') {      
        sh "gradle war"
   }
   stage('Deploy Java App') {
        sh "curl  http://jenkinstomcat:8080/manager/text/undeploy?path=/app --user script:scr1pt"
        sh "curl --upload-file ./build/libs/hello-jenkins.war http://jenkinstomcat:8080/manager/text/deploy?path=/app --user script:scr1pt"
   }
}