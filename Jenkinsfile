pipeline {
    agent {
        label 'system-1'
    }
    stages {
        stage('update git repo') {
            steps {
                dir('/home/Akash/project'){
                    sh 'pwd'
                    sh 'git pull origin master'
                }
            }
        }
        stage('Build terraform vm') {
            steps {
                dir('/home/Akash/project'){
                    sh 'pwd'
                    sh 'terraform init'
                    sh 'terraform validate'
                    sh 'terraform apply --auto-approve'
                }
            }
        }
        stage('Delay Before Deploy') {
            steps {
                echo 'Pausing for 10 seconds...'
                sleep 10
                echo 'Resuming execution.'
            }
        }
        stage('RUN Docker in New VM') {
            steps {
                dir('/home/Akash/project'){
                    sh 'ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i /home/Akash/vm_public_ip.txt /home/Akash/install_docker.yaml --private-key=/home/Akash/.ssh/id_rsa'
                }
            }
        }
    }
}