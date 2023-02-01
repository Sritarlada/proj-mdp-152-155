pipeline {

	agent any

	stages {

   		stage('remove docker container') {

			steps { 
                sh 'docker container rm -f jcal'
            }
        }
      

		stage('Build docker image') {

			steps { 
                sh 'docker build -f Dockerfile -t jcal .'
            }
        }

              
				
        stage('build docker container') {

			steps { 
                sh 'docker container run -dt --name jcal -p 8081:8080 jcal'
            }
        }
		

	    stage('Login') {

			steps {
				sh 'docker login -u sritarlada --password-stdin'
			}
		}

	    stage('Push') {

			steps {
				sh 'docker push jcal'
			}
		}
    }
	post {
		always {
			sh 'docker logout'
		}
	}
}

