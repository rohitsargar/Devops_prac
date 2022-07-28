pipeline{
		agent any
		stages{
				stage("Build application"){
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

				stage("uploading to testing environment"){
					steps{
						sh "docker stop my_project"
						sh "docker rm my_project"
						sh "docker run -d -p 9095:8080 --name my_project samplewebapp:${env.BUILD_ID}"
					}


				}


				stage("uploading to production environment"){
					steps{
						sh "echo hii"
					}


				}
				
				
		}
}