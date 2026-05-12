pipeline {
    agent any
    
    stages {

        stage('BUILD') {
            agent {
                docker {
                    image 'node:18-alpine'
                    reuseNode true
                }
            }
            steps {
                sh '''
                    npm ci
                    npm run build
                '''
            }
        }

        stage('TEST') {
            agent {
                docker {
                    image 'node:18-alpine'
                    reuseNode true
                }
            }
            steps {
                sh '''
                   CI=true npm test -- --watchAll=false
                   echo "=== TEST RESULTS ==="
                   find . -name "*.xml"
                '''
            }            
        }

        stage('E2E') {
            agent {
                docker {
                    image 'mcr.microsoft.com/playwright:v1.39.0-jammy'
                    reuseNode true
                }
            }
            steps {
                sh '''
                   npm install serve
                   node_modules/.bin/serve -s build &
                   sleep 15

                   npx playwright test

                   echo "=== PLAYWRIGHT RESULTS ==="
                   find . -name "*.xml"
                '''
            }
        }
    }
    
    post {
        always {
            junit 'test-results/*.xml'
        }
    }
}