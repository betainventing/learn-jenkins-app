using 0.docker-compose.yml
altered docker-compose.yml to change the name of the project and the ports used by Jenkins.

line 1 -> 
    name: project1
line 33,34,35 -> 
        ports:
      - "8081:8080"
      - "50001:50000"

student@murid:~/learn-jenkins-app/2.jenkins-backup-upgrade$ docker volume ls
DRIVER    VOLUME NAME
local     1docker-compose-dind_jenkins-data
local     1docker-compose-dind_jenkins-docker-certs
local     1e22df72ad1ee6e58e7caf175ec0a7732f34f29147c56e9a4394d307298accd3
local     3c539145b5a3215396b4cbe606393f55781091a6c555aacea26084a4aa2defc8
local     4fa9c2e2380ff3357e4ccc6c8659a77b01b9653510ecc625ea3e34ed4c20042f
local     7d5839b9f029a6ee7b6a2df84dde5eb39af5cefac67bcfd56f02a1337edfe228
local     8e06c988ffc2159238349c4cc3723543a1027533d9caf234af984bc3deb12ca7
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
local     e19a267abc2a64a586b1a233ed09b8909685080741628cbffdbc60cefaf00fb3
local     f0cab7953ff0859a68c764b555f0633a342a8ebae56a4dc43696a6822bb1a98d
local     f084bef0594837c23ff6ef6ccbbca9b207d6bea66492bbe35870559b9660b962
local     fa38d2b1527ee54077d2944dcba3ee5f59f2175d42fa941fa731cbe1b7ad1bc8
local     myapp_jenkins-data
local     myapp_jenkins-docker-certs
student@murid:~/learn-jenkins-app/2.jenkins-backup-upgrade$ docker compose up -d
[+] up 4/5
 ✔ Network... Created                                                                                                           0.1s
 ✔ Volume ... Created                                                                                                           0.0s
 ✔ Volume ... Created                                                                                                           0.0s
 ✘ Contain... Error response from daemon: Conflict. The container name "/my-jenkins" is already in use by container "a02558cb09853b241fbdd0082605ddc55b066b45ad6add9b807c83bc31051cb4". You have to remove (or rename) that container to be able to reuse that name. 0.4s
 ⠼ Contain... Creating                                                                                                          0.4s
Error response from daemon: Conflict. The container name "/my-jenkins" is already in use by container "a02558cb09853b241fbdd0082605ddc55b066b45ad6add9b807c83bc31051cb4". You have to remove (or rename) that container to be able to reuse that name.
student@murid:~/learn-jenkins-app/2.jenkins-backup-upgrade$

-------------------------------------------------------------------

using 1.docker-compose.yml

student@murid:~/learn-jenkins-app/2.jenkins-backup-upgrade$ docker compose up -d
no configuration file provided: not found
student@murid:~/learn-jenkins-app/2.jenkins-backup-upgrade$ ll
total 24
drwxr-xr-x 2 student student 4096 Mar 10 10:12 ./
drwxr-xr-x 8 student student 4096 Mar  6 09:22 ../
-rw-r--r-- 1 student student  916 Mar 10 09:54 0.docker-compose.yml
-rw-r--r-- 1 student student 3344 Mar 10 10:16 0.sh
-rw-r--r-- 1 student student  964 Mar 10 10:18 1.docker-compose.yml
-rw-r--r-- 1 student student  498 Feb  7 06:59 Dockerfile
student@murid:~/learn-jenkins-app/2.jenkins-backup-upgrade$ docker compose -f 1.docker-compose.yml up -d
[+] up 2/2
 ✔ Container project1-my-jenkins     Created                                                                                    0.7s
 ✔ Container project1-jenkins-docker Created                                                                                    0.6s
Error response from daemon: failed to set up container networking: driver failed programming external connectivity on endpoint project1-jenkins-docker (937c4a1ff2bb71aae958706d3cf6bad231e6984d8074a196e4e416d4b9d9297f): Bind for 0.0.0.0:2376 failed: port is already allocated
student@murid:~/learn-jenkins-app/2.jenkins-backup-upgrade$

----------------------------------------------------------------------

using 2.docker-compose.yml

change the ports used by Jenkins in 1.docker-compose.yml to the following:

        ports:
      - "2377:2376"

student@murid:~/learn-jenkins-app/2.jenkins-backup-upgrade$ docker compose -f 2.docker-compose.yml up -d
[+] up 2/2
 ✔ Container project1-my-jenkins     Running                                                                                    0.0s
 ✔ Container project1-jenkins-docker Recreated                                                                                  1.6s
student@murid:~/learn-jenkins-app/2.jenkins-backup-upgrade$

-------------------------------------------------------------

