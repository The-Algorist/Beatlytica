# **VM SSH Setup**

***To set up SSH access to the VM instances for the Beatlytica project, follow these steps:***

1. Create an SSH key pair in your local system's `.ssh` folder. You can follow the guide available [here](https://cloud.google.com/compute/docs/connect/create-ssh-keys#linux-and-macos) to generate SSH keys.

2. Add the public key (`.pub`) to your VM instance. You can follow the guide available [here](https://cloud.google.com/compute/docs/access/create-enable-service-accounts-for-instances#addanexistingkey) to add the SSH keys.

3. Create a `config` file in your `.ssh` folder using the following command:

    ```bash
    touch ~/.ssh/config
    ```

4. Edit the `config` file with the following snippet. Replace the values enclosed in `<>` with the corresponding values.

    ```bash
    Host beatlytica-kafka-instance
        HostName <External IP Address>
        User <username>
        IdentityFile <path/to/home/.ssh/keyfile>

    Host beatlytica-spark-instance
        HostName <External IP Address Of Master Node>
        User <username>
        IdentityFile <path/to/home/.ssh/keyfile>

    Host beatlytica-airflow-instance
        HostName <External IP Address>
        User <username>
        IdentityFile <path/to/home/.ssh/keyfile>
    ```

5. Once the SSH access is set up, you can SSH into the servers using the below commands in separate terminals. Replace the IP addresses with the external IP addresses of the corresponding VMs. 

    ```bash
    ssh beatlytica-kafka-instance
    ```

    ```bash
    ssh beatlytica-spark-instance
    ```

    ```bash
    ssh beatlytica-airflow-instance
    ```

6. To view Kafka and Airflow UIs, you will have to forward the ports from the VM to your local machine. You can follow the steps in the video available [here](https://youtu.be/ae-CV2KfoN0?t=1074) to set up port forwarding.

***Note that these steps will allow you to access the VMs via SSH, and you can use the same SSH keys and config file for future access.***

**Tip:** *For a better understanding of how to set up SSH keys and connect to VM instances, I recommend watching the first few minutes of this video by Alexey: [https://www.youtube.com/watch?v=ae-CV2KfoN0&list=PL3MmuxUbc_hJed7dXYoJw8DoCuVHhGEQb].*

