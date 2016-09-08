echo "openstack volume list"
openstack volume list

read -n1 -r key

echo "openstack volume create --size 5 demo-volume-cli"
openstack volume create --size 5 demo-volume-cli
read -n1 -r key

echo "openstack server add volume 'VIO Rocks!-1' demo-volume-cli"
openstack server add volume 'VIO Rocks!-1' demo-volume-cli
