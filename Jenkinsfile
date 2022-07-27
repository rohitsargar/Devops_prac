pipeline{
agent any
stages{
stage("build application"){
steps{
sh 'mvn -f pom.xml clean package'
}
post{
success{
echo "Now archiving artifacts.."
archiveArtifacts artifacts: '**/*.war'

}}}

stage("create docker image"){
step {
sh 'docker build . -t samplewebapp:${env.BUILD_ID}'
}



}

}

}