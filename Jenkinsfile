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
		stage('Deploy to K8s')
		{
			steps{
				sshagent(['k8s-jenkins'])
				{
					sh 'scp -r -o StrictHostKeyChecking=no jcal-deployment.yml username@10.0.0.12:/path'
					
					script{
						try{
							sh 'ssh username@10.0.0.12 kubectl apply -f /home/centos/jcal-deployment.yml --kubeconfig=/path/kube.yaml'

							}catch(error)
						{
							
						}
							
					}
				}
			}
		}
	}

    }
	post {
		always {
			sh 'docker logout'
		}
	}
