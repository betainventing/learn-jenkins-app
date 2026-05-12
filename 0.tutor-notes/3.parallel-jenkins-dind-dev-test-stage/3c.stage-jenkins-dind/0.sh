student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3c.stage-jenkins-dind$ docker compose ls
NAME                STATUS              CONFIG FILES
dev                 running(2)          /home/student/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3a.dev-jenkins-dind/1.dev.docker-compose.yml
test                running(2)          /home/student/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3b.test-jenkins-dind/2.test.docker-compose.yml
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3c.stage-jenkins-dind$ docker images
                                                                                                 i Info →   U  In Use
IMAGE                       ID             DISK USAGE   CONTENT SIZE   EXTRA
alpine:latest               25109184c71b       13.1MB         3.95MB        
docker:dind                 1ba18449911d        544MB          145MB    U   
jenkins-controller:latest   b37828bc9781       1.08GB          365MB    U   
my-jenkins:latest           e33bd01425b3       1.08GB          365MB        
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3c.stage-jenkins-dind$ docker ps
CONTAINER ID   IMAGE                COMMAND                  CREATED         STATUS         PORTS                                                                                          NAMES
2cf8319f470e   jenkins-controller   "/usr/bin/tini -- /u…"   3 minutes ago   Up 3 minutes   0.0.0.0:8081->8080/tcp, [::]:8081->8080/tcp, 0.0.0.0:50001->50000/tcp, [::]:50001->50000/tcp   test-jenkins-controller
1235d66a568f   docker:dind          "dockerd-entrypoint.…"   3 minutes ago   Up 3 minutes   0.0.0.0:2377->2376/tcp, [::]:2377->2376/tcp                                                    test-docker-daemon
577d4e61d828   jenkins-controller   "/usr/bin/tini -- /u…"   9 minutes ago   Up 9 minutes   0.0.0.0:8080->8080/tcp, [::]:8080->8080/tcp, 0.0.0.0:50000->50000/tcp, [::]:50000->50000/tcp   dev-jenkins-controller
c70deab93155   docker:dind          "dockerd-entrypoint.…"   9 minutes ago   Up 9 minutes   0.0.0.0:2376->2376/tcp, [::]:2376->2376/tcp                                                    dev-docker-daemon
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3c.stage-jenkins-dind$ docker volume ls
DRIVER    VOLUME NAME
local     1docker-compose-dind_jenkins-data
local     1docker-compose-dind_jenkins-docker-certs
local     1e22df72ad1ee6e58e7caf175ec0a7732f34f29147c56e9a4394d307298accd3
local     2d560485f5d2ba6042cfc366d14ca03f8e51d1ead31f362f493e4b8dcce472e7
local     3c539145b5a3215396b4cbe606393f55781091a6c555aacea26084a4aa2defc8
local     4fa9c2e2380ff3357e4ccc6c8659a77b01b9653510ecc625ea3e34ed4c20042f
local     7d5839b9f029a6ee7b6a2df84dde5eb39af5cefac67bcfd56f02a1337edfe228
local     8b821a1948f94746b266aa3daaca662b3d9395bda93bba21b15d63f3066822e4
local     8e06c988ffc2159238349c4cc3723543a1027533d9caf234af984bc3deb12ca7
local     43cf756f2504707bc922de27ca8f40adf78f745ec7a8fdd66d82d98c9cd63e4d
local     50a5b69d1a5d58568d3981d556df500086d5410c86166559f184569fd4b28430
local     72e424036e71db23de1aa7dbc7b0f64b4331c5540a3c92bd927f6effd4cb09e2
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
local     test_jenkins-data
local     test_jenkins-docker-certs
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3c.stage-jenkins-dind$ docker network ls
NETWORK ID     NAME           DRIVER    SCOPE
39fd64926ab9   bridge         bridge    local
9777b255a977   dev_jenkins    bridge    local
11977d7f2431   host           host      local
5b94d347eab6   none           null      local
6615af3ddf01   test_jenkins   bridge    local
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3c.stage-jenkins-dind$ docker compose up -d
[+] up 2/2
 ✔ Container test-docker-daemon      Recreated                                                                   4.5s
 ✔ Container test-jenkins-controller Recreated                                                                   3.6s
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3c.stage-jenkins-dind$ docker compose down  
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3c.stage-jenkins-dind$ docker compose up -d
[+] up 5/5
 ✔ Network stage_jenkins              Created                                                                    0.1s
 ✔ Volume stage_jenkins-docker-certs  Created                                                                    0.0s
 ✔ Volume stage_jenkins-data          Created                                                                    0.1s
 ✔ Container stage-docker-daemon      Created                                                                    0.6s
 ✔ Container stage-jenkins-controller Created                                                                    0.6s
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3c.stage-jenkins-dind$ docker ps
CONTAINER ID   IMAGE                COMMAND                  CREATED          STATUS          PORTS                                                                                          NAMES
c54a5d94a4cb   jenkins-controller   "/usr/bin/tini -- /u…"   8 seconds ago    Up 7 seconds    0.0.0.0:8082->8080/tcp, [::]:8082->8080/tcp, 0.0.0.0:50002->50000/tcp, [::]:50002->50000/tcp   stage-jenkins-controller
a21ed25747d4   docker:dind          "dockerd-entrypoint.…"   8 seconds ago    Up 7 seconds    0.0.0.0:2378->2376/tcp, [::]:2378->2376/tcp                                                    stage-docker-daemon
c1a31f3c9467   docker:dind          "dockerd-entrypoint.…"   40 seconds ago   Up 38 seconds   0.0.0.0:2377->2376/tcp, [::]:2377->2376/tcp                                                    test-docker-daemon
d5766acb3ac4   jenkins-controller   "/usr/bin/tini -- /u…"   40 seconds ago   Up 38 seconds   0.0.0.0:8081->8080/tcp, [::]:8081->8080/tcp, 0.0.0.0:50001->50000/tcp, [::]:50001->50000/tcp   test-jenkins-controller
577d4e61d828   jenkins-controller   "/usr/bin/tini -- /u…"   12 minutes ago   Up 12 minutes   0.0.0.0:8080->8080/tcp, [::]:8080->8080/tcp, 0.0.0.0:50000->50000/tcp, [::]:50000->50000/tcp   dev-jenkins-controller
c70deab93155   docker:dind          "dockerd-entrypoint.…"   12 minutes ago   Up 12 minutes   0.0.0.0:2376->2376/tcp, [::]:2376->2376/tcp                                                    dev-docker-daemon
student@murid:~/learn-jenkins-app/3.parallel-jenkins-dind-dev-test-stage/3c.stage-jenkins-dind$
