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
			stage("Teststing the code"){
						steps{
						        sh "echo testing successfully"
						}
				}
				
				stage("create docker image"){
						steps{
						        sh "docker build . -t samplewebapp:${env.BUILD_ID}"
						}
				}	

				/* stage("create & run service on testing environment"){
					steps{
						sh "docker service update --image samplewebapp:${env.BUILD_ID} my_project_testing "
					}
				} */


				stage("uploading to production environment"){
					steps{
						sh "docker run -p 8081:8080 -d --name javaapp${env.BUILD_ID} samplewebapp:${env.BUILD_ID} "
						sh " echo SUCCESSFULLY UPLOADED go to link localhost:8081/Devops_prac-0.0.1-SNAPSHOT/index.jsp"
					}


				}
				
				
		}
}
