export DISPLAY=:0
source /opt/ros/noetic/setup.bash
catkin_make
killall -9 gzserver
killall -9 gzclient
source activate
conda activate Noetic

DONT_RUN=1 make px4_sitl_default gazebo
px4_dir=~/PX4-Autopilot
source /opt/ros/noetic/setup.bash

export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$px4_dir
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$px4_dir/Tools/simulation/gazebo/sitl_gazebo
export GAZEBO_PLUGIN_PATH=$GAZEBO_PLUGIN_PATH:/usr/lib/x86_64-linux-gnu/gazebo-11/plugins
source ~/Project/HP2-Falcon/devel/setup.bash
source $px4_dir/Tools/simulation/gazebo/setup_gazebo.bash $px4_dir $px4_dir/build/px4_sitl_default
source ~/Project/Mav/devel/setup.bash
#roslaunch px4 mavros_posix_sitl.launch
roslaunch simulation sim.launch