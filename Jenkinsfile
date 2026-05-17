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

            environment {
                PLAYWRIGHT_HTML_REPORT = 'playwright-report'
            }

            steps {
                sh '''
                    bash -c '

                        set -euxo pipefail

                        echo "===== E2E TEST STAGE ====="

                        node --version
                        npm --version

                        npm ci

                        npm install --no-save serve

                        npx serve -s build -l 3000 > serve.log 2>&1 &

                        SERVER_PID=$!

                        cleanup() {
                            kill ${SERVER_PID} || true
                        }

                        trap cleanup EXIT

                        timeout 60 bash -c "
                            until curl -fs http://127.0.0.1:3000 > /dev/null
                            do
                                echo Waiting for app...
                                sleep 2
                            done
                        "

                        npx playwright test --reporter=html
                    '
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
