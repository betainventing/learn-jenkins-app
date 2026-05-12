to fix error of 27b, install Docker Pipeline plugin in jenkins and then run the pipeline again. It should work fine.
run buld again
------------------------------

Started by user kallol c

[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins
 in /var/jenkins_home/workspace/2.27b
[Pipeline] {
[Pipeline] stage
[Pipeline] { (w/o docker)
[Pipeline] sh
+ echo Without docker
Without docker
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (w/ docker)
[Pipeline] node
Running on Jenkins
 in /var/jenkins_home/workspace/2.27b@2
[Pipeline] {
[Pipeline] isUnix
[Pipeline] withEnv
[Pipeline] {
[Pipeline] sh
+ docker inspect -f . node:18-alpine

error: no such object: node:18-alpine
[Pipeline] isUnix
[Pipeline] withEnv
[Pipeline] {
[Pipeline] sh
+ docker pull node:18-alpine
18-alpine: Pulling from library/node

f18232174bc9: Pulling fs layer
dd71dde834b5: Pulling fs layer
1e5a4c89cee5: Pulling fs layer
25ff2da83641: Pulling fs layer
25ff2da83641: Waiting

1e5a4c89cee5: Verifying Checksum
1e5a4c89cee5: Download complete

f18232174bc9: Verifying Checksum
f18232174bc9: Download complete
f18232174bc9: Pull complete

25ff2da83641: Verifying Checksum
25ff2da83641: Download complete
dd71dde834b5: Verifying Checksum
dd71dde834b5: Download complete

dd71dde834b5: Pull complete
1e5a4c89cee5: Pull complete
25ff2da83641: Pull complete
Digest: sha256:8d6421d663b4c28fd3ebc498332f249011d118945588d0a35cb9bc4b8ca09d9e
Status: Downloaded newer image for node:18-alpine
docker.io/library/node:18-alpine
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] withDockerContainer
Jenkins seems to be running inside container 0925c1047ed4a57714b19ca504ffd17088cb0a99b95ea2ef01a9b0692b6d9f49
but /var/jenkins_home/workspace/2.27b@2 could not be found among []
but /var/jenkins_home/workspace/2.27b@2@tmp could not be found among []
$ docker run -t -d -u 1000:1000 -w /var/jenkins_home/workspace/2.27b@2 -v /var/jenkins_home/workspace/2.27b@2:/var/jenkins_home/workspace/2.27b@2:rw,z -v /var/jenkins_home/workspace/2.27b@2@tmp:/var/jenkins_home/workspace/2.27b@2@tmp:rw,z -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** node:18-alpine cat

$ docker top 47e9336a5f9f0858197d2606406e4b9b8a924800d580c719bebc18186320f7bc -eo pid,comm
[Pipeline] {
[Pipeline] sh
+ echo 'With docker'
With docker
[Pipeline] sh

+ npm --version
10.8.2
[Pipeline] }
$ docker stop --time=1 47e9336a5f9f0858197d2606406e4b9b8a924800d580c719bebc18186320f7bc

$ docker rm -f --volumes 47e9336a5f9f0858197d2606406e4b9b8a924800d580c719bebc18186320f7bc
[Pipeline] // withDockerContainer
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
