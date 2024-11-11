Below are the steps that needs to be followed for applying the changes available in this repo to any non-production cluster

1. Clone this GitHub repo into your machine using below command:
git clone https://github.com/Vikram8130/DevOPs_DBS_Task.git

2. For any python application a virtual environment needs to be activated in the directory where the source code will cloned and synced with remote repository by using given commands.

pip install virtualenv


virtualenv env          # create virtual environment with name ENV


.\env\Scripts\activate  # activate virtual environment   

3. After that run below commands in the given same order on the machine where the cluster is deployed.

chmod +x scripts/deploy.sh


./scripts/deploy.sh start  # To deploy


./scripts/deploy.sh stop   # To tear down
