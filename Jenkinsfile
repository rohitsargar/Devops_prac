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

				stage("create & run service on testing environment"){
					steps{
						
						sh "docker service rm my_project_testing"
						sh "docker service create -p 9095:8080 --name my_project_testing samplewebapp:${env.BUILD_ID}"

					}


				}


				stage("uploading to production environment"){
					steps{
						sh "echo hii"
					}


				}
				
				
		}
}