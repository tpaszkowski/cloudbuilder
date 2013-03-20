

default["cloudbuilder"]["default_hostname"] = "linux-pdfy"
default_hostname = default["cloudbuilder"]["default_hostname"]

default["cloudbuilder"]["hosts"][default_hostname]["roles"] = ["db", "mq", "keystone","glance", "nova-api", "conductor", "scheduler", "compute","quantum-server"]
default["cloudbuilder"]["hosts"]["linux-f0kx"]["roles"] = ["db", "mq", "keystone","glance", "nova-api", "conductor", "scheduler", "compute", "quantum-server"]


default["cloudbuilder"]["recipies"]["role"]["db"] = ["mysql::server", "keystone::db", "glance::db", "nova::db", "quantum::db"]
# need to setup Cloud:OpenStack:Grizzly repository on SLE for rabbitmq
default["cloudbuilder"]["recipies"]["role"]["mq"] = ["openstack-common", "rabbitmq"]
default["cloudbuilder"]["recipies"]["role"]["keystone"] = ["keystone::server"]
default["cloudbuilder"]["recipies"]["role"]["glance"] = ["glance::registry", "glance::api"]
default["cloudbuilder"]["recipies"]["role"]["nova-api"] = ["openstack-common", "nova::nova-setup", "nova::api-os-compute"]
default["cloudbuilder"]["recipies"]["role"]["conductor"] = ["openstack-common", "nova::conductor"]
default["cloudbuilder"]["recipies"]["role"]["scheduler"] = ["openstack-common", "nova::scheduler"]
default["cloudbuilder"]["recipies"]["role"]["compute"] = ["openstack-common", "nova::libvirt", "nova::compute"]
default["cloudbuilder"]["recipies"]["role"]["quantum-server"] = ["quantum::server"]
