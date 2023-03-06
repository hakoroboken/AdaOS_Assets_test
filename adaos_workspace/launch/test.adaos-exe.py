from launch import LaunchDescription , actions
from launch_ros.actions import Node
from ament_index_python.packages import get_package_share_directory
import os.path


def generate_launch_description():    
    return LaunchDescription([
        # Physical Controller
        Node(
            package='sc_client',
            executable='server',
            parameters=[{'nic' : 'eno1'} , 
                        {'c1' : 'Up'} , 
                        {'c2' : 'Down'} , 
                        {'s1' : 'Fir power'} , 
                        {'s2' : "🦅 Eagle"} , 
                        {'debug' : False}],
            on_exit=actions.Shutdown(),
            remappings=[
                ('sc_client/error' , 'safe_extensions/error'),
            ]
        ),
        # Joysic to vector
        Node(
            package='robo2022',
            executable='joy2vel',
            remappings=[
                ('/joy' , '/sc_client/joy'),
                ('/SmartUI' , '/sc_client/SmartUI'),
            ],
            on_exit=actions.Shutdown(),
        )
    ])
