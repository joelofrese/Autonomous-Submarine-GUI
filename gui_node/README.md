# HOW TO USE GUI NODE 

## 1. Open terminal and run these commands:
   - Source the ROS environment:
     ```
     source /opt/ros/foxy/setup.bash
     ```
   - In the workspace that contains **gui_node** package, run:
     - Build **gui_node** package: `colcon build --packages-select gui_node`
     - Source setup script in workspace: `. install/setup.bash` 
     - Run **gui_node**: `ros2 run gui_node gui_exec`
      ```
      // Build the gui_node package
      colcon build --packages-select gui_node
      // Source setup script in workspace
      . install/setup.bash
      //Run gui_node
      ros2 run gui_node gui_exec
      ```
## 2. Homepage
* In the homepage, select the ROS nodes you want to enable:
  -  Main nodes: `brain`, `mediator` or `pid`
  -  Launch nodes:
    - These are nodes to be added in a Python launch file that will run every sensor in the robot (for more details, please visit the [SDSU Mechatronics 2024](https://github.com/Mechatronics-SDSU/Mechatronics-2024) repository)
  -  Once finished, click `Start`
* Navigate to different pages using buttons on the side bar
  * **PID Controller:**
    - Tune PID values in the line edits (hit `Enter` or `Return` keys to send the values)
       - Only accepting float values ranging from `0` to `1`
       - Switching between line edits using `Up` or `Down` arrow keys
    - On the right are text boxes that display the pid values being sent through ros
       - Use `Clear` or `Clear All` buttons to empty the text boxes
    - Click on `ros topic list` button to see active ros topics
