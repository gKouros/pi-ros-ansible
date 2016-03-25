# pi-ros-ansible  
Setup and Configure Raspbian in Raspberry Pi 2 and install ROS  

### Instructions  
- Edit hosts and change the ip address to the one of your pi. Then, Copy "hosts" to /etc/ansible on the host computer.  

- (optional) Configure bash, install vim(+plugins), etc by running:  
`$ ansible-playbook -s pi_raspbian_playbook.yml -k --extra-vars "user=<your_username>"`  

- Install ROS from source (takes hours!!!) by running:  
`$ ansible-playbook -s pi_ros_playbook.yml -k --extra-vars "user=<your_username>"`  
