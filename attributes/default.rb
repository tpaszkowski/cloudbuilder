

default["cloudbuilder"]["default_hostname"] = "linux-pdfy"
default_hostname = default["cloudbuilder"]["default_hostname"]

default["cloudbuilder"]["roles"]["db_role"] = "db"
default["cloudbuilder"]["roles"]["mq_role"] = "mq"
default["cloudbuilder"]["roles"]["keystone_role"] = "keystone"
default["cloudbuilder"]["roles"]["nova_api_role"] = "nova_api"
default["cloudbuilder"]["roles"]["glance_role"] = "glance"
default["cloudbuilder"]["roles"]["scheduler_role"] = "scheduler"
default["cloudbuilder"]["roles"]["conductor_role"] = "conductor"
default["cloudbuilder"]["roles"]["compute_role"] = "compute"

#default["cloudbuilder"]["hosts"][default_hostname]["roles"] = ["db", "mq", "keystone", "glance", "nova-api", "scheduler", "conductor", "compute"]
default["cloudbuilder"]["hosts"][default_hostname]["roles"] = ["db", "mq", "keystone","glance", "nova-api", "conductor", "scheduler", "compute"]
default["cloudbuilder"]["hosts"]["linux-f0kx"]["roles"] = ["db", "mq", "keystone","glance", "nova-api", "conductor", "scheduler", "compute"]


default["cloudbuilder"]["recipies"]["role"]["db"] = ["mysql::server", "keystone::db", "glance::db", "nova::db"]
# need to setup Cloud:OpenStack:Grizzly repository on SLE for rabbitmq
default["cloudbuilder"]["recipies"]["role"]["mq"] = ["openstack-common", "rabbitmq"]
default["cloudbuilder"]["recipies"]["role"]["keystone"] = ["keystone::server"]
default["cloudbuilder"]["recipies"]["role"]["glance"] = ["glance::registry", "glance::api"]
default["cloudbuilder"]["recipies"]["role"]["nova-api"] = ["openstack-common", "nova::nova-setup", "nova::api-os-compute"]
default["cloudbuilder"]["recipies"]["role"]["conductor"] = ["openstack-common", "nova::conductor"]
default["cloudbuilder"]["recipies"]["role"]["scheduler"] = ["openstack-common", "nova::scheduler"]
default["cloudbuilder"]["recipies"]["role"]["compute"] = ["openstack-common", "nova::libvirt", "nova::compute"]
