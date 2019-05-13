pipeline {

	agent { label 'linux' }

	stages {

	stage('Setup') {

		steps {

			git credentialsId: 'gitcredential', url: 'https://github.com/Tafessek/Final-sample.git'

			//sh 'rm -r webapp'

			//sh 'mkdir webapp'
      sh "flake8 webapp/appserver.py"
			

		}

	}
	stage('Build') {

		steps {

			    sh "docker build -t dynacorpweb:${env.BUILD_NUMBER} ."

		}

	}

	stage('Deploy DB') {

		steps {

			withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'jenkinscredential', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {

	                sh 'ls'

	                sh "docker service create website --env WEBSITE_TABLE=dynacorp-database --env AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID} --env AWS_SECRET_ACCESS_KEY=${env.AWS_ACCESS_KEY_ID}"

                        }

		   }

	}

	
	stage('Test Webapp') {

		steps {

		 
			 sh "docker service create website --env WEBSITE_TABLE=dynacorp-database --env AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID} --env AWS_SECRET_ACCESS_KEY=${env.AWS_ACCESS_KEY_ID}"
	  
		     }
	}

	

}	

}


