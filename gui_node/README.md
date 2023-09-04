# HOW TO USE GUI NODE 

1. Open terminal and run these commands:
   - `source /opt/ros/foxy/setup.bash`
   - (in workspace that contains **gui_node** package) run:
     - Build **gui_node** package: `colcon build --packages-select gui_node`
     - Source setup script in workspace: `. install/setup.bash` 
     - Run **gui_node**: `ros2 run gui_node gui_exec`
2. In the homepage, select the nodes you want to enable (brain, mediator or pid) and click **Start**
* Navigate to different pages using buttons on the side bar
  * **PID Controller:**
    - Tune PID values in the line edits (hit **Enter/Return** keys to send the values)
    - Only accepting float values ranging from 0 to 1
    - Switching between line edits using **Up/Down** arrow keys
    - On the right are text boxes that display the pid values being sent through ros
    - Use **Clear** or **Clear All** buttons to empty the text boxes
    - Click on **ros topic list** button to see active ros topics
