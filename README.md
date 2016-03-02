# pi-ros-ansible  
Setup and Configure Raspbian in Raspberry Pi 2 and install ROS  

### Instructions  
- Edit hosts and change the ip address to the one of your pi. Then, Copy "hosts" to /etc/ansible on the host computer.  
- Replace default raspbian user "pi" (password="raspberry") by running:  
`$ ansible-playbook -s pi_users_playbook.yml -k --extra-vars "user=<your_username> password=<your_password>"`  

- Configure bash and install vim(+plugins) by running:  
`$ ansible-playbook -s pi_raspbian_playbook.yml -k --extra-vars "user=<your_username>"`  

- Install ROS by running:  
`$ ansible-playbook -s pi_ros_playbook.yml -k --extra-vars "user=<your_username>"`  
