# ----------------------------------------------------------------------------
#  Copyright 2005-2013 WSO2, Inc. http://www.wso2.org
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
# ----------------------------------------------------------------------------
#

# ESB cartridge node
node /esb/ inherits base {
  $docroot = "/mnt/wso2esb-4.8.1"
  require java
  class {'agent':}
  class {'esb':

        version            => '4.8.1',
        sub_cluster_domain => 'test',
        members            => false,
	port_mapping	   => false,
        offset             => 0,
        hazelcast_port        => 4100,
        config_db          => 'ESB_CONFIG_DB',
	config_target_path => 'ESB_CONFIG_PATH',
        maintenance_mode   => 'zero',
        depsync            => false,
        clustering         => false,
        cloud              => true,
        owner              => 'root',
        group              => 'root',
        target             => '/mnt/'

  }

  Class['stratos_base'] -> Class['java'] -> Class['esb'] ~> Class['agent']
}
