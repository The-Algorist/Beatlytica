# Set up Kafka VM

***To set up Kafka and eventsim in two separate Docker processes in a dedicated compute instance, follow these steps:***

1. Establish an SSH connection to the compute instance.

   ```bash
   ssh beatlytica-kafka-instance
   ```

2. Clone the git repo and cd into the Kafka folder.

   ```bash
   git clone  https://github.com/The-Algorist/Beatlytica.git && \ 
   cd  Beatlytica/kafka
   ```

3. Install Anaconda, Docker, and Docker Compose by running the `vm_setup.sh` script.

   ```bash
   bash ~/Beatlytica/scripts/vm_setup.sh && exec newgrp docker
   ```

4. Set the `KAFKA_ADDRESS` environment variable to the external IP of the Kafka VM.

   ```bash
   export KAFKA_ADDRESS=IP.ADD.RE.SS
   ```

   **Note:** ***You will need to set up this environment variable every time you create a new shell session or if you stop/start your VM.***

5. Start Kafka by running `docker-compose build` and then `docker-compose up` in the Kafka directory.

   ```bash
   docker-compose build && docker-compose up
   ```

   **Note:** ***Sometimes the `broker` and `schema-registry` containers die during startup. If this happens, stop all the containers with `docker-compose down` and then rerun `docker-compose up`.***

6. Verify that Kafka Control Center is available on port `9021`. Check if everything is working fine.

7. Open another terminal session for the Kafka VM and start sending messages to your Kafka broker with Eventsim.

   ```bash
   bash ~/Beatlytica/scripts/eventsim_startup.sh
   ```

   This will start creating events for 1 Million users spread out from the current time to the next 24 hours. The container will run in detached mode. Follow the logs to see the progress.

8. To follow the logs of the Eventsim container, run the following command:

   ```bash
   docker logs --follow million_events
   ```

9. The messages should start flowing in a few minutes.

10. You should see four topics:

    - listen_events
    - page_view_events
    - auth_events
    - status_change_events

    

11. Note: If you happen to rerun the Eventsim container and face the following error:
  
    >docker: Error response from daemon: Conflict. The container name "/million_events" is already in use by container.

    Then run the following command to remove unused containers:

    ```bash
    docker system prune
    ```