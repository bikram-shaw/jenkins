node{


        stage('SCM Checkout')
        {

                git credentialsId: 'git_cred', url: 'https://github.com/bikram-shaw/jenkins.git'
                echo 'Website Successfully Clone From Git Hub'
        }
        stage('Build Docker Image')
        {

                sh 'docker build -t biku8293/angular .'
                 echo 'Website Successfully Build'

        }
        stage('Push Docker Image')
        {
 withCredentials([string(credentialsId: 'docker_hub_pwd', variable: 'DockerHubPwd')]) {
     sh "docker login -u biku8293 -p ${DockerHubPwd}"
        }

                sh 'docker push biku8293/angular'
        }
        stage('Run Docker Container')
        {
                 sh 'docker rm -f angular'
                sh 'docker run -it -p 84:80 -d --name angular biku8293/angular'
                echo 'Congrats! Website Successfully Deploy'

        }
        stage('Run Container On Production Server')
        {
                //sh 'sudo docker rm -f biku8293/mariposa'
                //sh 'sudo docker rm -f mariposa'
                //sh 'sudo docker run -it -p 82:80 -d --name mariposa biku8293/mariposa'
                echo 'successfully deploy'

        }

}
