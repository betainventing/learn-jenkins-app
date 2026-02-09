pipeline {
    agent any

    stages {
        stage('w/o docker') {
            steps {
                sh 'echo "without docker"'
            }
        }
        
        stage('w/ docker') {
            agent {
                docker {
                    image: 'node:18-alpine'
                }
            }
            steps {
                sh 'echo "using docker"'
            }
        }        
    }
}

------------------------------------------------------

Started by user kallol c

org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
WorkflowScript: 13: Expected to find ‘someKey "someValue"’ @ line 13, column 24.
                   docker {
                          ^

WorkflowScript: 13: Invalid agent type "docker" specified. Must be one of [any, label, none] @ line 13, column 17.
                   docker {
                   ^

2 errors

	at org.codehaus.groovy.control.ErrorCollector.failIfErrors(ErrorCollector.java:309)
	at org.codehaus.groovy.control.CompilationUnit.applyToPrimaryClassNodes(CompilationUnit.java:1107)
	at org.codehaus.groovy.control.CompilationUnit.doPhaseOperation(CompilationUnit.java:624)
	at org.codehaus.groovy.control.CompilationUnit.processPhaseOperations(CompilationUnit.java:602)
	at org.codehaus.groovy.control.CompilationUnit.compile(CompilationUnit.java:579)
	at groovy.lang.GroovyClassLoader.doParseClass(GroovyClassLoader.java:323)
	at groovy.lang.GroovyClassLoader.parseClass(GroovyClassLoader.java:293)
	at PluginClassLoader for script-security//org.jenkinsci.plugins.scriptsecurity.sandbox.groovy.GroovySandbox$Scope.parse(GroovySandbox.java:162)
	at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.CpsGroovyShell.doParse(CpsGroovyShell.java:202)
	at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.CpsGroovyShell.reparse(CpsGroovyShell.java:186)
	at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.CpsFlowExecution.parseScript(CpsFlowExecution.java:669)
	at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.CpsFlowExecution.start(CpsFlowExecution.java:615)
	at PluginClassLoader for workflow-job//org.jenkinsci.plugins.workflow.job.WorkflowRun.run(WorkflowRun.java:341)
	at hudson.model.ResourceController.execute(ResourceController.java:97)
	at hudson.model.Executor.run(Executor.java:456)
Finished: FAILURE


-----------------------------------------------------------------

have to install the docker plugin in jenkins to use the docker agent.
To resolve the issue, you need to install the Docker Pipeline plugin in Jenkins. Here are the steps to do that:
1. Log in to your Jenkins dashboard.
2. Click on "Manage Jenkins" from the left-hand menu.
3. Click on "Manage Plugins."
4. Go to the "Available" tab and search for "Docker Pipeline plugin."
5. Check the box next to the Docker Pipeline plugin and click "Install without restart" or "Download now and install after restart."
6. Once the installation is complete, you may need to restart Jenkins for the changes to take effect.
After installing the Docker Pipeline plugin, you should be able to use the docker agent in your Jenkins pipeline without encountering the compilation errors.