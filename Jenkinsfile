pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub-cred-sritarlada')
	}

	stages {

		stage('Build') {

			steps {
				sh 'sudo docker image rm -f jcal'
				sh 'sudo docker build -f Dockerfile -t jcal .'
				sh 'sudo docker image ls'
				sh 'sudo docker container rm -f jcal'
				sh 'sudo docker container run -dt --name jcal -P sritarlada/dopro'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u sritarlada --password dckr_pat_N0gg54OxqMXNPxzEt-b_dvJCJLo'
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
