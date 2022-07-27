pipeline{
		agent any
		stages{
				stage("build application"){
						steps{
					           sh "mvn -f pom.xml clean package"
						}
						post{
								success{
								echo "Now archiving artifacts.."
								archiveArtifacts artifacts: '**/*.war'
								}
						}
				}
				
				stage("create docker image"){
						steps{
						        sh "docker build . -t samplewebapp:${env.BUILD_ID}"
						}
				}	
				stage("uploading to testing"){
						steps{
						        sh "docker run -d -p 9092:8080 samplewebapp:${env.BUILD_ID}"
						}
				}
				
		}
}