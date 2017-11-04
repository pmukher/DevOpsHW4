# HW4
**Pratik Mukherjee** <br />
**Unity ID: pmukher** <br />
**Masters in Computer Science** <br />
**North Carolina State University** <br />

**Part 1: Set Up Containers** </br> 

**Part 1:Set Up Containers** 
**ScreenCast Link:** https://www.youtube.com/watch?v=bS1aqTkI_Pg

The folder **Part1SetUpContainers** consists of the following:-  
* **docker-compose.yml:** The yml file for building the multi-container docker applications.  
* **redisDocker**: The folder consists of the *Dockerfile* which has the commands for building a container for the Redis service. 
* **nodeDocker**: The folder consists of the *Dockerfile* which has the commands for building a container for the Node.js application. It also has the *main.js* and the *package.json* file which will be deployed in the docker container. 
* **proxyDocker**: The folder consists of the *Dockerfile* which has the commands for building a container for the proxy. It also has the *proxy.js* and the *package.json* file which will be deployed in the docker container. 

The *docker-compose.yml* file consists of all the specifications for building multi-container docker applications. To create the docker containers we run the command *docker-compose build*. After the containers have been built, the command *docker-compose up* was ran. This results in running all the docker containers. On running the command *docker-compose ps*, the three docker containers are seen to be up and running. </br>

**Part 1: Spawn Containers** </br> 

**Part 1: Spawn Containers** 
**ScreenCast Link:** https://www.youtube.com/watch?v=yU8d03XWWFY 

The folder **Part1Spawning** consists of the  files:-  
* **Dockerfile:** The file consists of commands used for building a container for deploying the main.js file.  
* **main.js**: The file which will be deployed. 
* **infrastructure.js**: The js file that periodically spawns a container for the main.js file by geenrating a port number and a docker name and passing them as paramaters to the dockerSpawn.sh file which will spawn the docker containers. 
* **dockerSpawn.sh**: The sh script which spawns a docker container based upon the port number and the docker name that it recieves from the infrastructure.js. 
* **package.json**: The file that enlists the external modules on which the main.js file has dependencies.  

For deploying docker containers, the *infrastructure.js* was modified. The **setInterval** functionality was used to spawn a container every 3 seconds. A random port number was generated between *1025* and *65535*. A docker image name was generated using the port number as well by concatenating the string *docker* and the port number. The docker port number and the image name was passed to the unix script *dockerSpawn.sh* which was called by the **infrastructure.js** application. The script *dockerSpawn* ran the command *docker build* and the *docker run* command to build the docker container and run it. Run the command *docker-compose ps -a* to see the spawned docker containers. </br> 

**Part 2**

**Part 2:** 
**ScreenCast Link:** https://www.youtube.com/watch?v=WFsE6yO-eVU
* **Deployment:**  The folder contains a folder called deploy. The folder contains the following folders <br/> 
* **blue-www, green-www:** The folders contain the deployed node app. The folders contains the *"main.js"* file which is to be deployed in the docker container as well as the Dockerfile which contains the instructions to install node.js in the docker container and run the main.js file. 
* **blue.git, green.git:**The folders contains the ost-recieve file in the hooks directory which is responsible for creating a docker container and running it. As soon as a push is made in the main.js file in the blue-www/green-www directory the post-recieve file will be trigerred. A docker container will be created and the main.js file will be deployed in the container. 

First a private registry was created using the command "*docker run -d -p 5000:5000 --restart=always --name registry registry:2*" </br> 

The post-receive fie was modified to build a docker image and run it. 
Commands were added to push the contents to registry, pull from it, stop and restart the docker container.  
In the App folder a comment was added/modified. The changes were committed and pushed to the blue master. This trigerred the post-recieve fucntionality which would build and run a docker container, push and pull from the registry, start and restart the container. The output can be seen in the terminal.  

**Part Bonus** </br> 

**Part Bonus** 
**ScreenCast Link:** https://www.youtube.com/watch?v=lXgYtUDrRBk

The folder **PartBonus** consists of the following folders:-  
* **ReadFile** The folder contains the **Dockerfile** that installs socat, creates a file **file1.txt**, writes a text to it and allows to read the file over port 9001. 
* **ContainerLink**: The folder contains the file **DockerFile** which installs curl.  

The **Dockerfile** in the folder **ReadFile** installs socat. It touches a file called **file1.txt** aand writes **"Hello World"** inside it. It then allows the file to be read over the port **9001** using the **TC4-LISTEN** command and the **SYSTEM** command. A docker container was built and ran with respect to the Dockerfile which would create a conmtainer with socat installed in it and create a file called **file1.txt** with the text **Hello World**. The file is also enabled to be read from port **9001**. Let this container be named as **bonus1** The other folder **ContainerLink** contains a **DockerFile** that installs the curl command. The docker container with respect to this image was built. Let this conatiner be called **link2**. Then using the command **docker run -it --link --name link1 link1 curl bonus1:9001**, the file **file1** was read by the container **link1**.  


