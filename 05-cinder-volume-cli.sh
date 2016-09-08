echo "openstack volume list"
openstack volume list

sleep 5

echo "openstack volume create --size 5 demo-volume-cli"
openstack volume create --size 5 demo-volume-cli

echo "openstack server add volume 'VIO Rocks!-1' demo-volume-cli"
openstack server add volume 'VIO Rocks!-1' demo-volume-cli
