Below are the steps that needs to be followed for applying the changes available in this repo to any non-production cluster

# 1. Clone this GitHub repo into your machine using below command:

git clone https://github.com/Vikram8130/DevOPs_DBS_Task.git

# 2. For any python application a virtual environment needs to be activated in the directory where the source code will cloned and synced with remote repository by using given commands.

pip install virtualenv

# create virtual environment with name ENV
virtualenv env          

# activate virtual environment   
.\env\Scripts\activate  

# 3. After that run below commands in the given same order on the machine where the cluster is deployed.

chmod +x scripts/deploy.sh


./scripts/deploy.sh start  # To deploy


./scripts/deploy.sh stop   # To tear down

# We can access google-status-checker application deployed as well as prometheus and grafana dashboards using cluster localhost and port 8080 or node ip and  by port forwarding using the following commands


kubectl port-forward -n monitoring <google-checker-pod-name> 8080:5000

http://localhost:8080

http://<your-node-ip>:<node-port-ip>

kubectl port-forward -n monitoring <prometheus-pod-name> 8080:9090 

http://localhost:8080

http://<your-node-ip>:30000

kubectl port-forward -n monitoring <grafana-pod-name> 8080:3000 

http://localhost:8080

http://<your-node-ip>:32000
