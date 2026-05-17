pipeline {
    agent any

    options {
        // Prevent Jenkins from automatically checking out source code
        // before stages begin.
        skipDefaultCheckout(true)

        // Adds timestamps to console logs
        timestamps()      
    }

    environment {
        // Optional: improves npm reliability in CI
        CI = 'true'
    }

    stages {

        stage('Prepare Workspace') {
            steps {

                echo 'Cleaning old workspace...'

                // Cleans previous build files
                cleanWs()

                echo 'Checking out source code...'

                // Manual SCM checkout
                checkout scm

                sh '''
                    echo "Workspace after checkout:"
                    pwd
                    ls -la
                '''
            }
        }
        stage('Build') {
            agent {
                docker {
                    image 'node:18-alpine'

                    // Reuse Jenkins workspace inside container
                    reuseNode true
                }
            }
            steps {
                sh '''
                    echo "===== BUILD STAGE ====="

                    node --version
                    npm --version

                    echo "Installing dependencies..."
                    npm ci

                    echo "Running production build..."
                    npm run build

                    echo "Listing workspace contents..."
                    ls -la

                    echo "Listing build directory..."
                    ls -la build || true
                '''
            }
        }        
        stage('Unit Testing') {
            agent {
                docker {
                    image 'node:18-alpine'
                    reuseNode true
                }
            }

            steps {
                sh '''
                    echo "===== TEST STAGE ====="
                    echo "Running unit tests..."
                    npm test -- --watchAll=false
                '''
            }
        }
        stage('E2E Testing') {
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
                    sleep 10
                    npx playwright test --reporter=html
                '''
            }
        }
    }
    post {
        always {
            junit 'jest-results/junit.xml'
            publishHTML([
                allowMissing: false, 
                alwaysLinkToLastBuild: false, 
                keepAll: false, 
                reportDir: 'playwright-report', 
                reportFiles: 'index.html', 
                reportName: 'Playwright HTML Report', 
                reportTitles: '', 
                useWrapperFileDirectly: true
            ])           
        }
    }
}
