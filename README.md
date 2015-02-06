icinga2_db_create Cookbook
==========================
This cookbook is a wrapper cookbook for the icinga2-cookbook. "https://github.com/Icinga/chef-icinga2".
It is used to create an empty database (currently only postgresql is supported) and configures it with user and password.

Requirements
------------
This cookbook needs attributes coming from the icinga2-cookbook.


Attributes
----------


Usage
-----
#### icinga2_db_create::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `icinga2_db_create` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[icinga2_db_create]"
  ]
}
```

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
Authors: TODO: List authors
