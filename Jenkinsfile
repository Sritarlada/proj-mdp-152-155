pipeline {

	agent any

	environment {
		DOCKERHUB_CREDENTIALS = credentials('sritarlada-dockerhub')
	}

	stages {

   		stage('remove docker container') {

			steps { 
                sh 'docker container rm -f jcal'
            }
        }
      

		stage('Build docker image') {

			steps { 
                sh 'docker build -f Dockerfile -t sritarlada/jcal .'
            }
        }

              
				
        stage('build docker container') {

			steps { 
                sh 'docker container run -dt --name jcal -p 8081:8080 jcal'
            }
        }
		

	    stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

	    stage('Push') {

			steps {
				sh 'docker push sritarlada/jcal'
			}
		}
    }
	post {
		always {
			sh 'docker logout'
		}
	}
}

