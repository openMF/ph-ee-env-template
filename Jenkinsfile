pipeline {
    agent any
    stages {
        stage('deploy helm chart') {
            steps {
                sh 'cd helm && helm package ph-ee-engine && helm repo index . && cp *.tgz index.yaml /srv/data/helm-charts/ '
            }
        }
    }
}
