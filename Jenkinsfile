pipeline {
    agent any

    stages {
        stage("Build") {
            steps {
                withCredentials([
                    usernamePassword(credentialsId: 'docker-host-credentials', passwordVariable: 'ANSIBLE_PASSWORD', usernameVariable: 'dockerUser'),
                    file(credentialsId: 'vault-password-file', variable: 'vault_passfile')
                ]) {
                    sh ''' echo "user is $dockerUser and its password is $ANSIBLE_PASSWORD (this should be masked!)" ''';
                    sh ''' ansible-playbook -i inventory  --vault-password-file \$vault_passfile -e ansible_password='{{ lookup("env", "ANSIBLE_PASSWORD") }}' playbook.yml '''
                }
            }
        }
    }
    post {
        success {
            emailext(
                subject: "Job SUCCEEDED!",
                to: 'otaviokr@nowhere.com',
                body: """<p>Job ${env.JOB_NAME} [${env.BUILD_NUMBER}] executed <b>successfully</b>! For more details, please go to <a href='${env.BUILD_URL}'>Job Page at Jenkins UI</a>.""",
                recipientProviders:[[$class: 'DevelopersRecipientProvider']]
            )
        }
        failure {
            emailext(
                subject: "Job FAILED!",
                body: """<p>Job ${env.JOB_NAME} [${env.BUILD_NUMBER}] has <b>failed</b>! For more details, please go to <a href='${env.BUILD_URL}'>Job Page at Jenkins UI</a>.""",
                to: 'otaviokr@nowhere.com',
                recipientProviders:[[$class: 'DevelopersRecipientProvider']]
            )
        }
    }
}
