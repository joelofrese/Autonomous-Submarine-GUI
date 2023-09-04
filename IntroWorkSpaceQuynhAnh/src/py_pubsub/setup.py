from setuptools import setup

package_name = 'py_pubsub'

setup(
    name=package_name,
    version='0.0.0',
    packages=[package_name],
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='haliedo',
    maintainer_email='doq300861@gmail.com',
    description='create publisher that generates current unix epoch time',
    license='Apache License 2.0',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
        	'unix_time_pub = py_pubsub.epoch_publisher:main',
        	'unix_time_sub = py_pubsub.epoch_subscriber:main',
        ],
    },
)



