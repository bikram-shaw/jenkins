node('staging'){


        stage('SCM Checkout')
        {

                git credentialsId: 'git_cred', url: 'https://github.com/bikram-shaw/jenkins.git'

        }
        stage('Build Website')
        {

                sh 'sudo docker build  /home/ubuntu/jenkins/workspace/angular -t biku8293/angular'

        }
        stage('Deploy Website')
        {
            //sh 'sudo docker rm -f $(sudo docker ps -a -q)'
                sh 'sudo docker run -it -p 84:80 -d biku8293/angular'

        }

}
