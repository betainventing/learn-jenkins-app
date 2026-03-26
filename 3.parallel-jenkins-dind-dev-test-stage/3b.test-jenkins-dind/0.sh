student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3b.test-jenkins-dind$ ll
total 20
drwxr-xr-x 2 student student 4096 Mar 10 15:40 ./
drwxr-xr-x 5 student student 4096 Mar 10 14:57 ../
-rw-r--r-- 1 student student  118 Mar 10 15:40 .env
-rw-r--r-- 1 student student    0 Mar 10 15:40 0.sh
-rw-r--r-- 1 student student  982 Mar 10 11:06 2.test.docker-compose.yml
-rw-r--r-- 1 student student  498 Feb  7 06:59 Dockerfile
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3b.test-jenkins-dind$ docker compose up -d
[+] up 5/5
 ✔ Network test_jenkins              Created                                                                     0.1s
 ✔ Volume test_jenkins-data          Created                                                                     0.0s
 ✔ Volume test_jenkins-docker-certs  Created                                                                     0.0s
 ✔ Container test-docker-daemon      Created                                                                     0.8s
 ✔ Container test-jenkins-controller Created                                                                     0.7s
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3b.test-jenkins-dind$ docker compose ls
NAME                STATUS              CONFIG FILES
dev                 running(2)          /home/student/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3a.dev-jenkins-dind/1.dev.docker-compose.yml
test                running(2)          /home/student/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3b.test-jenkins-dind/2.test.docker-compose.yml
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3b.test-jenkins-dind$ docker ps
CONTAINER ID   IMAGE                COMMAND                  CREATED          STATUS          PORTS                                                                                          NAMES
2cf8319f470e   jenkins-controller   "/usr/bin/tini -- /u…"   52 seconds ago   Up 50 seconds   0.0.0.0:8081->8080/tcp, [::]:8081->8080/tcp, 0.0.0.0:50001->50000/tcp, [::]:50001->50000/tcp   test-jenkins-controller
1235d66a568f   docker:dind          "dockerd-entrypoint.…"   52 seconds ago   Up 50 seconds   0.0.0.0:2377->2376/tcp, [::]:2377->2376/tcp                                                    test-docker-daemon
577d4e61d828   jenkins-controller   "/usr/bin/tini -- /u…"   6 minutes ago    Up 6 minutes    0.0.0.0:8080->8080/tcp, [::]:8080->8080/tcp, 0.0.0.0:50000->50000/tcp, [::]:50000->50000/tcp   dev-jenkins-controller
c70deab93155   docker:dind          "dockerd-entrypoint.…"   6 minutes ago    Up 6 minutes    0.0.0.0:2376->2376/tcp, [::]:2376->2376/tcp                                                    dev-docker-daemon
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3b.test-jenkins-dind$ 
