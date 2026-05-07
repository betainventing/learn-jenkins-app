Started by user kallol c

[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins
 in /var/jenkins_home/workspace/2.30.Workspace-synchronisation
[Pipeline] {
[Pipeline] stage
[Pipeline] { (w/o docker)
[Pipeline] sh
+ echo Without docker
Without docker
+ ls -la
total 8
drwxr-xr-x  2 jenkins jenkins 4096 Feb  9 13:41 .
drwxr-xr-x 16 jenkins jenkins 4096 Feb  9 13:41 ..
+ pwd
/var/jenkins_home/workspace/2.30.Workspace-synchronisation
+ touch without-docker.txt
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (w/ docker)
[Pipeline] node
Running on Jenkins
 in /var/jenkins_home/workspace/2.30.Workspace-synchronisation@2
[Pipeline] {
[Pipeline] isUnix
[Pipeline] withEnv
[Pipeline] {
[Pipeline] sh
+ docker inspect -f . node:18-alpine
.
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] withDockerContainer
Jenkins seems to be running inside container 0925c1047ed4a57714b19ca504ffd17088cb0a99b95ea2ef01a9b0692b6d9f49
but /var/jenkins_home/workspace/2.30.Workspace-synchronisation@2 could not be found among []
but /var/jenkins_home/workspace/2.30.Workspace-synchronisation@2@tmp could not be found among []
$ docker run -t -d -u 1000:1000 -w /var/jenkins_home/workspace/2.30.Workspace-synchronisation@2 -v /var/jenkins_home/workspace/2.30.Workspace-synchronisation@2:/var/jenkins_home/workspace/2.30.Workspace-synchronisation@2:rw,z -v /var/jenkins_home/workspace/2.30.Workspace-synchronisation@2@tmp:/var/jenkins_home/workspace/2.30.Workspace-synchronisation@2@tmp:rw,z -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** node:18-alpine cat
$ docker top 538947cbd96bbcb337ab1fa512d937e28eb0422bfb1779f9da6ce35d0e5b239e -eo pid,comm
[Pipeline] {
[Pipeline] sh
+ echo 'using docker agent'
using docker agent
+ ls -la
total 8
drwxr-xr-x    2 node     node          4096 Feb  9 13:41 .
drwxr-xr-x    4 root     root          4096 Feb  9 13:41 ..
+ pwd
/var/jenkins_home/workspace/2.30.Workspace-synchronisation@2
+ touch with-docker.txt
[Pipeline] }
$ docker stop --time=1 538947cbd96bbcb337ab1fa512d937e28eb0422bfb1779f9da6ce35d0e5b239e

$ docker rm -f --volumes 538947cbd96bbcb337ab1fa512d937e28eb0422bfb1779f9da6ce35d0e5b239e
[Pipeline] // withDockerContainer
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
