# catkin workspace, git and ros
alias ws="cd /home/gkouros/pandora_ws"
alias repos="cd ~/pandora_ws/src"
alias cmo="catkin_make --only-pkg-with-deps"
alias cmr="catkin_make catkin_make -DCATKIN_WHITELIST_PACKAGES="""
alias gits="git status"
alias rosdep-install='rosdep install --from-paths src --ignore-src --rosdistro $ROS_DISTRO  -r'

# tar/untar aliases
alias tar-gz='tar czf'
alias tar-bz2='tar cjf'
alias untar-gz='tar xzf'
alias untar-bz2='tar xjf'

# package management
alias install='sudo apt-get install'
alias remove='sudo apt-get remove'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias dist-upgrade='sudo apt-get dist-upgrade'
alias apt-search='sudo aptitude search'

# frequently used folders
alias home='cd ~'
alias desktop='cd ~/Desktop'
