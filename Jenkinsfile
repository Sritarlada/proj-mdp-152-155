pipeline {

	agent any

	stages {

		stage('Build docker image') {

			steps { 
                sh 'docker build -f Dockerfile -t jcal .'
            }
        }

        stage('remove docker image') {

			steps { 
                sh 'docker image rm -f jcal'
            }
        }

        stage('list docker image') {

			steps { 
                sh 'docker image ls'
            }
        }
        
        stage('remove docker container') {

			steps { 
                sh 'docker container rm -f jcal'
            }
        }
				
        stage('build docker container') {

			steps { 
                sh 'docker container run -dt --name jcal -p 8081:8080 sritarlada/dopro'
            }
        }
		}

	stage('Login') {

			steps {
				sh 'docker login -u sritarlada --password sri@tarlada14'
			}
		}

	stage('Push') {

			steps {
				sh 'docker push jcal'
			}
		}

	post {
		always {
			sh 'docker logout'
		}
	}
}
