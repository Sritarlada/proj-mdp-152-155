pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub-cred-sritarlada')
	}

	stages {

		stage('Build') {

			steps {
				sh 'docker image rm -f jcal'
				sh 'docker build -f Dockerfile -t jcal .'
				sh 'docker image ls'
				sh 'docker container rm -f jcal'
				sh 'docker container run -dt --name jcal -P sritarlada/dopro'
			}
		}

		stage('Login') {

			steps {
				sh 'docker login -u sritarlada --password dckr_pat_N0gg54OxqMXNPxzEt-b_dvJCJLo'
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
