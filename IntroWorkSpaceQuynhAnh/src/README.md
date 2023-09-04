# HOW TO RUN PUBLISHER & SUBSCRIBER IN PY_PUBSUB

## 1. Sourcing ROS environment
### Source the ROS 2 environment setup script to set up necessary environment variables.
#### This allows ROS 2 tools and packages to function properly.
`source /opt/ros/foxy/setup.bash`

## 2. Build the package (assuming you're in the root workspace "IntroWorkSpaceQuynhAnh")
### Use 'colcon' to build the 'py_pubsub' package.
#### This command compiles the package and its dependencies.
`colcon build --packages-select py_pubsub`

### Source the setup script for the workspace.
#### This step is essential to make your built package accessible within your current shell session.
`. install/setup.bash`

## 3. Run the publisher
### Execute the 'unix_time_pub' node from the 'py_pubsub' package.
#### This node publishes Unix timestamps.
`ros2 run py_pubsub unix_time_pub`

### In a different terminal (do not repeat step 2), run the subscriber:
### Execute the 'unix_time_sub' node from the 'py_pubsub' package.
#### This node subscribes to the Unix timestamps published by the publisher.
`ros2 run py_pubsub unix_time_sub`



