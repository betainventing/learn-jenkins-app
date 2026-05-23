pipeline {
    agent any

    options {
        skipDefaultCheckout(true)
        timestamps()
    }

    environment {
        CI = 'true'
    }

    stages {

        stage('Prepare Workspace') {
            steps {

                cleanWs()

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
                    reuseNode true
                }
            }

            steps {

                sh '''
                    echo "===== BUILD STAGE ====="

                    node --version
                    npm --version

                    npm ci
                    npm run build

                    ls -la
                    ls -la build || true
                '''

                /*
                 Save source + build artifacts
                */
                stash name: 'app-source',
                    includes: '''
                        build/**,
                        src/**,
                        public/**,
                        e2e/**,
                        package.json,
                        package-lock.json,
                        playwright.config.js
                        tests-examples/**
                    '''
            }
        }

        stage('Run Tests') {

            parallel {

                stage('Unit Testing') {

                    agent {
                        docker {
                            image 'node:18-alpine'
                            reuseNode true
                        }
                    }

                    steps {

                        /*
                         Fresh isolated workspace
                        */
                        deleteDir()

                        unstash 'app-source'

                        sh '''
                            echo "===== UNIT TEST STAGE ====="

                            node --version
                            npm --version

                            npm ci

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

                        /*
                         Fresh isolated workspace
                        */
                        deleteDir()

                        unstash 'app-source'

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