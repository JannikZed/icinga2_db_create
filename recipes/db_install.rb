#
# Cookbook Name:: icinga2
# Recipe:: db_install
#
# Copyright 2014, Virender Khatri
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# This recipe enables the installation of a db-server and configures it for the ido-configuration
# Currently only postgresql is supported

include_recipe 'postgresql::server' if node['icinga2']['install_db']['enable'] == 'true' && node['icinga2']['ido']['type'] == 'pgsql'

# creates icinga db and user
# execute 'create_db_mysql' do
#  command <<-EOH
#  mysql -u root -p
#  && touch /etc/icinga2/database_created
#  EOH
#  creates '/etc/icinga2/database_created'
#  only_if { node['icinga2']['ido']['load_schema'] && node['icinga2']['ido']['type'] == 'mysql' }
# end

# creates icinga db and user
execute 'create_db_pgsql' do
  command "\
  cd /tmp
  sudo -u postgres psql -c \"CREATE ROLE #{node['icinga2']['ido']['db_user']} WITH LOGIN PASSWORD \'#{node['icinga2']['ido']['db_password']}\'\";
  sudo -u postgres createdb -O #{node['icinga2']['ido']['db_user']} -E UTF8 #{node['icinga2']['ido']['db_name']}
  sudo -u postgres createlang plpgsql icinga \
  && touch /var/lib/pgsql/db_created"
  creates '/var/lib/pgsql/db_created'
  only_if { node['icinga2']['ido']['load_schema'] && node['icinga2']['ido']['type'] == 'pgsql' }
end
