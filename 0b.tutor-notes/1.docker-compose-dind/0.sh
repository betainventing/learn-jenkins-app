student@murid:~/learn-jenkins-app/1.docker-compose-dind$ docker volume ls
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
student@murid:~/learn-jenkins-app/1.docker-compose-dind$ docker volume inspect '1docker-compose-dind_jenkins-data'
[
    {
        "CreatedAt": "2026-02-07T13:46:52Z",
        "Driver": "local",
        "Labels": {
            "com.docker.compose.config-hash": "052280078b00e71207f6ca5eb96454a08e1e8232a6551b78e7b9e08f669aa9eb",
            "com.docker.compose.project": "1docker-compose-dind",
            "com.docker.compose.version": "5.0.2",
            "com.docker.compose.volume": "jenkins-data"
        },
        "Mountpoint": "/var/lib/docker/volumes/1docker-compose-dind_jenkins-data/_data",
        "Name": "1docker-compose-dind_jenkins-data",
        "Options": null,
        "Scope": "local"
    }
]
student@murid:~/learn-jenkins-app/1.docker-compose-dind$ docker run --rm \
  -v '1docker-compose-dind_jenkins-data':/data \
  -v $(pwd):/backup \
  alpine tar czf /backup/jenkins-backup-$(date +%Y-%m-%d_%H-%M-%S).tar.gz -C /data .
Unable to find image 'alpine:latest' locally
latest: Pulling from library/alpine
caa817ad3aea: Download complete                                                                                                     
9e595aac14e0: Download complete                                                                                                     
Digest: sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20acb8f2198c3f659
Status: Downloaded newer image for alpine:latest
student@murid:~/learn-jenkins-app/1.docker-compose-dind$ ll
total 288432
drwxr-xr-x 2 student student      4096 Mar 10 09:33 ./
drwxr-xr-x 8 student student      4096 Mar  6 09:22 ../
-rw-r--r-- 1 student student       498 Feb  7 06:59 Dockerfile
-rw-r--r-- 1 student student       901 Mar 10 09:21 docker-compose.yml
-rw-r--r-- 1 root    root    295330404 Mar 10 09:34 jenkins-backup-2026-03-10_09-33-37.tar.gz
student@murid:~/learn-jenkins-app/1.docker-compose-dind$