icinga2_db_create Cookbook
==========================
This cookbook is a wrapper cookbook for the icinga2-cookbook. "https://github.com/Icinga/chef-icinga2".
It is used to create an empty database (currently only postgresql is supported) and configures it with user and password.

Requirements
------------
This cookbook needs attributes coming from the icinga2-cookbook.


Attributes
----------
default['icinga2_db_create']['install_db']['enable'] == 'true'

Attributes configured in the icinga2-cookbook:
default['icinga2']['ido']['type'] == 'pgsql' 
default['icinga2']['ido']['db_user']
default['icinga2']['ido']['db_password']
default['icinga2']['ido']['db_name']
default['icinga2']['ido']['load_schema']

Usage
-----
#### icinga2_db_create::default
Just include in your runlist recipe['icinga2_db_create'] before the icinga2-cookbook
['icinga2']['ido']['load_schema'] need to be 'true' to use this cookbook

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: JannikZed
