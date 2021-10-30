pipeline {
    agent {
        kubernetes {
            yaml '''
apiVersion: v1
kind: Pod
spec:
  securityContext:
    runAsUser: 0
  containers:
  - name: gradle
    image: gradle:jdk8
    command:
    - sleep
    args:
    - 30d
  restartPolicy: Never
            '''
        }
    }
    environment {
        CALCIP = "10.108.229.3"
    }
    stages {
        stage('Acceptance Test') {
            steps {
                sh '''
                echo $CALCIP
                chmod +x gradlew
                ./gradlew acceptanceTest -Dcalculator.url=http://$CALCIP:8080
                '''
            }
            post {
                always {
                    publishHTML (target: [ 
                        allowMissing: false,
                        alwaysLinkToLastBuild: false,
                        reportDir: './build/reports/tests/acceptanceTest', 
                        reportFiles: 'index.html', 
                        reportName: "Acceptance Test Report" 
                    ])
                }
            }
        }
    }
}