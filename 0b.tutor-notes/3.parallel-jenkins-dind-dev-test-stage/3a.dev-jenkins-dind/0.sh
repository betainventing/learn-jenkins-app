student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3a.dev-jenkins-dind$ pwd
/home/student/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3a.dev-jenkins-dind
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3a.dev-jenkins-dind$ docker compose up -d
[+] up 1/1
 ! Image j... pull access denied for jenkins-controller, repository does not exist or may require 'docker login' 2.8s
[+] Building 5.9s (12/12) FINISHED
 => [internal] load local bake definitions                                                                      0.0s
 => => reading from stdin 668B                                                                                  0.0s
 => [internal] load build definition from Dockerfile                                                            0.2s
 => => transferring dockerfile: 537B                                                                            0.0s
 => [internal] load metadata for docker.io/jenkins/jenkins:lts-jdk21                                            3.4s
 => [auth] jenkins/jenkins:pull token for registry-1.docker.io                                                  0.0s
 => [internal] load .dockerignore                                                                               0.1s
 => => transferring context: 2B                                                                                 0.0s
 => [1/5] FROM docker.io/jenkins/jenkins:lts-jdk21@sha256:23b84d1066dbe69f2c17288c83ac071127092d726f14b3b80444  0.1s
 => => resolve docker.io/jenkins/jenkins:lts-jdk21@sha256:23b84d1066dbe69f2c17288c83ac071127092d726f14b3b80444  0.1s
 => CACHED [2/5] RUN apt-get update && apt-get install -y lsb-release                                           0.0s
 => CACHED [3/5] RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc   https://download.docker.com/  0.0s
 => CACHED [4/5] RUN echo "deb [arch=$(dpkg --print-architecture)   signed-by=/usr/share/keyrings/docker-archi  0.0s
 => CACHED [5/5] RUN apt-get update && apt-get install -y docker-ce-cli                                         0.0s
 => exporting to image                                                                                          0.5s
 => => exporting layers                                                                                         0.1s
 => => exporting manifest sha256:e7d86e6adfb317894b12e9a9ff332c9b6357c063db5dc8a1cbbae1bae37e7859               0.1s
 => => exporting config sha256:7e6231db773ae19df03e42990e847a72e346013feed8c0708209d411a702d248                 0.0s
 => => exporting attestation manifest sha256:75a07a338db04bf1a2adff46ec04ce4aee1846e48b14d53630e06120e5ccc281   0.1s
 => => exporting manifest list sha256:b37828bc97817a9c5b110a1d94b62512cfb5af4668b303c67c9911ea92846bcb          0.0s
 => => naming to docker.io/library/jenkins-controller:latest                                                    0.0s
[+] up 6/6acking to docker.io/library/jenkins-controller:latest                                                 0.0s
 ✔ Image jenkins-controller         Built                                                                       10.2s
 ✔ Network dev_jenkins              Created                                                                     0.3s
Error response from daemon: failed to set up container networking: driver failed programming external connectivity on endpoint dev-jenkins-controller (ffab5310c756dc1e54cc296590a0de81af70668b0235a4f12638c8c822f8f122): Bind for 0.0.0.0:8080 failed: port is already allocated
Error response from daemon: failed to set up container networking: driver failed programming external connectivity on endpoint dev-jenkins-controller (ffab5310c756dc1e54cc296590a0de81af70668b0235a4f12638c8c822f8f122): Bind for 0.0.0.0:8080 failed: port is already allocated
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3a.dev-jenkins-dind$ docker compose up -d   
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3a.dev-jenkins-dind$ docker compose ls      
NAME                STATUS              CONFIG FILES
dev                 running(2)          /home/student/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3a.dev-jenkins-dind/1.dev.docker-compose.yml
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3a.dev-jenkins-dind$ docker ps
CONTAINER ID   IMAGE                COMMAND                  CREATED         STATUS              PORTS                 NAMES
41354d879e79   jenkins-controller   "/usr/bin/tini -- /u…"   6 minutes ago   Up About a minute   8080/tcp, 50000/tcp   dev-jenkins-controller
08776d0ef231   docker:dind          "dockerd-entrypoint.…"   6 minutes ago   Up About a minute   2376/tcp              dev-docker-daemon
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3a.dev-jenkins-dind$ docker volume ls
DRIVER    VOLUME NAME
local     1docker-compose-dind_jenkins-data
local     1docker-compose-dind_jenkins-docker-certs
local     1e22df72ad1ee6e58e7caf175ec0a7732f34f29147c56e9a4394d307298accd3
local     3c539145b5a3215396b4cbe606393f55781091a6c555aacea26084a4aa2defc8
local     4fa9c2e2380ff3357e4ccc6c8659a77b01b9653510ecc625ea3e34ed4c20042f
local     7d5839b9f029a6ee7b6a2df84dde5eb39af5cefac67bcfd56f02a1337edfe228
local     8b821a1948f94746b266aa3daaca662b3d9395bda93bba21b15d63f3066822e4
local     8e06c988ffc2159238349c4cc3723543a1027533d9caf234af984bc3deb12ca7
local     43cf756f2504707bc922de27ca8f40adf78f745ec7a8fdd66d82d98c9cd63e4d
local     50a5b69d1a5d58568d3981d556df500086d5410c86166559f184569fd4b28430
local     78ca55c657189f364324551ecdeeecfd2101d07b1a0d8fc3009e38430a55ade7
local     82ajenkins-docker-install_jenkins-data
local     82ajenkins-docker-install_jenkins-docker-certs
local     82cjenkins-implement_jenkins-data
local     82cjenkins-implement_jenkins-docker-certs
local     269b0b2ef1c9c152baf84e1edf3de5735a4e011a2b1128f61018d56669a62c37
local     618e101ea88516fcda395ba73915a0d843217230cc211efc5464596d11ae491a
local     0625ca1e62f8138360ec62724e864590c45e152e92f652d0d41bf3e953e0e9b7
local     973d7106d8692783ce1d9d67c1e4b4ab3ff37e7bc853c8978d735d48925de3c9
local     29212f8b2902be8e3c1fe27518c83ce712e4f4afff2e019818350e457a9acc27
local     49006da7bbe25e174d7030aa186465dc62dbf677a8923392c54fed972c7e2a22
local     bc80dd583d42d3b4917c70f42c8b8985b4a1f9a8b47ab3c34df75890ba52139c
local     dev_jenkins-data
local     dev_jenkins-docker-certs
local     e19a267abc2a64a586b1a233ed09b8909685080741628cbffdbc60cefaf00fb3
local     f0cab7953ff0859a68c764b555f0633a342a8ebae56a4dc43696a6822bb1a98d
local     f084bef0594837c23ff6ef6ccbbca9b207d6bea66492bbe35870559b9660b962
local     fa38d2b1527ee54077d2944dcba3ee5f59f2175d42fa941fa731cbe1b7ad1bc8
local     myapp_jenkins-data
local     myapp_jenkins-docker-certs
local     project1_jenkins-data
local     project1_jenkins-docker-certs
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3a.dev-jenkins-dind$ docker network ls
NETWORK ID     NAME          DRIVER    SCOPE
39fd64926ab9   bridge        bridge    local
e87ed81bf9e2   dev_jenkins   bridge    local
11977d7f2431   host          host      local
5b94d347eab6   none          null      local
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3a.dev-jenkins-dind$ ll
total 20
drwxr-xr-x 2 student student 4096 Mar 10 15:29 ./
drwxr-xr-x 5 student student 4096 Mar 10 14:57 ../
-rw-r--r-- 1 student student  116 Mar 10 15:12 .env
-rw-r--r-- 1 student student 1174 Mar 10 15:02 1.dev.docker-compose.yml
-rw-r--r-- 1 student student  498 Feb  7 06:59 Dockerfile
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3a.dev-jenkins-dind$ cat .env 
COMPOSE_FILE=1.dev.docker-compose.yml
COMPOSE_PROJECT_NAME=dev
JENKINS_PORT=8080
AGENT_PORT=50000
DIND_PORT=2376student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3a.dev-jenkins-dind$
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3a.dev-jenkins-dind$ cat 1.dev.docker-compose.yml
name: ${COMPOSE_PROJECT_NAME}

services:
  docker-daemon:
    image: docker:dind
    container_name: ${COMPOSE_PROJECT_NAME}-docker-daemon
    privileged: true
    environment:
      - DOCKER_TLS_CERTDIR=/certs
    volumes:
      - jenkins-docker-certs:/certs/client
      - jenkins-data:/var/jenkins_home
    ports:
      - "${DIND_PORT}:2376" # Dynamic host port
    networks:
      jenkins:
        aliases:
          - docker
    command: --storage-driver overlay2

  jenkins-controller:
    image: jenkins-controller
    build:
      context: .
    container_name: ${COMPOSE_PROJECT_NAME}-jenkins-controller
    restart: on-failure
    environment:
      - DOCKER_HOST=tcp://docker:2376
      - DOCKER_CERT_PATH=/certs/client
      - DOCKER_TLS_VERIFY=1
    volumes:
      - jenkins-data:/var/jenkins_home
      - jenkins-docker-certs:/certs/client:ro
    ports:
      - "${JENKINS_PORT}:8080"  # Dynamic host port
      - "${AGENT_PORT}:50000"   # Dynamic host port
    networks:
      - jenkins

networks:
  jenkins:
    driver: bridge

volumes:
  # Docker prefixes these with project name automatically (e.g. dev_jenkins-data)
  jenkins-docker-certs:
  jenkins-data:student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3a.dev-jenkins-dind$ ll      
total 20
drwxr-xr-x 2 student student 4096 Mar 10 15:29 ./
drwxr-xr-x 5 student student 4096 Mar 10 14:57 ../
-rw-r--r-- 1 student student  116 Mar 10 15:12 .env
-rw-r--r-- 1 student student 1174 Mar 10 15:02 1.dev.docker-compose.yml
-rw-r--r-- 1 student student  498 Feb  7 06:59 Dockerfile
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3a.dev-jenkins-dind$ cat Dockerfile
FROM jenkins/jenkins:lts-jdk21
USER root
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3a.dev-jenkins-dind$ docker images
                                                                                                 i Info →   U  In Use
IMAGE                       ID             DISK USAGE   CONTENT SIZE   EXTRA
alpine:latest               25109184c71b       13.1MB         3.95MB
docker:dind                 1ba18449911d        544MB          145MB    U 
jenkins-controller:latest   b37828bc9781       1.08GB          365MB    U 
my-jenkins:latest           e33bd01425b3       1.08GB          365MB
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3a.dev-jenkins-dind$ docker images --all    
                                                                                                 i Info →   U  In Use
IMAGE                       ID             DISK USAGE   CONTENT SIZE   EXTRA
alpine:latest               25109184c71b       13.1MB         3.95MB
docker:dind                 1ba18449911d        544MB          145MB    U 
jenkins-controller:latest   b37828bc9781       1.08GB          365MB    U 
my-jenkins:latest           e33bd01425b3       1.08GB          365MB
<untagged>                  8bcbad4b45f0        542MB          144MB
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3a.dev-jenkins-dind$ sudo lsof -i :8080
[sudo] password for student: 
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3a.dev-jenkins-dind$ docker compose down
[+] down 3/3
 ✔ Container dev-jenkins-controller Removed                                                                      0.7s
 ✔ Container dev-docker-daemon      Removed                                                                      1.4s
 ✔ Network dev_jenkins              Removed                                                                      0.5s
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3a.dev-jenkins-dind$ docker compose up -d
[+] up 3/3
 ✔ Network dev_jenkins              Created                                                                      0.1s
 ✔ Container dev-docker-daemon      Created                                                                      0.8s
 ✔ Container dev-jenkins-controller Created                                                                      0.7s
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3a.dev-jenkins-dind$ docker ps 
CONTAINER ID   IMAGE                COMMAND                  CREATED         STATUS         PORTS                                                                                          NAMES
577d4e61d828   jenkins-controller   "/usr/bin/tini -- /u…"   8 seconds ago   Up 7 seconds   0.0.0.0:8080->8080/tcp, [::]:8080->8080/tcp, 0.0.0.0:50000->50000/tcp, [::]:50000->50000/tcp   dev-jenkins-controller
c70deab93155   docker:dind          "dockerd-entrypoint.…"   8 seconds ago   Up 7 seconds   0.0.0.0:2376->2376/tcp, [::]:2376->2376/tcp                                                    dev-docker-daemon
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3a.dev-jenkins-dind$ 