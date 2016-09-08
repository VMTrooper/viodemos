echo "openstack security group list"
openstack security group list
read -n1 -r key

echo "openstack security group rule list management"
openstack security group rule list management
read -n1 -r key

echo "openstack security group create cli-group"
openstack security group create cli-group
read -n1 -r key

echo "openstack security group rule create --src-ip 0.0.0.0/0 --dst-port 33333 cli-group"
openstack security group rule create --src-ip 0.0.0.0/0 --dst-port 33333 cli-group
read -n1 -r key

echo 'openstack server add security group "CLI Rocks!-1" cli-group'
openstack server add security group 'CLI Rocks!-1' cli-group
