pipeline{
	agent any
	environment {
		DOCKERHUB_PASS = 'Nani@6798'
	}
	stages{
		stage("Building the Student Survey Image"){
			steps{
				script{
					checkout scm
					sh 'rm -rf *.war'
					sh 'jar -cvf SWE645HW2.war *'
					sh 'echo ${BUILD_TIMESTAMP}'
					sh 'docker login -u nehanth67 -p ${DOCKERHUB_PASS}'
					sh 'docker build -t nehanth67/swe645 .'
				}
			}
		}
		stage("Pushing image to docker"){
			steps{
				script{
					sh 'docker push nehanth67/swe645'
				}
			}
		}
		stage("Deploying to rancher"){
			steps{
				script{
					sh 'kubectl rollout restart deploy surveydeployment -n survey'
				}
			}
		}
	}
}
