echo "openstack server list"
openstack server list

echo "openstack keypair list"
openstack keypair list

echo "openstack network list"
openstack network list

echo "openstack image list"
openstack image list

sleep 5

echo "
openstack server create 'CLI Rocks!' \
--max 5 \
--flavor m1.small \
--image ubuntu-14.04-server-amd64 \
--security-group default \
--security-group management \
--nic net-id=11ee7077-99ac-4f74-8382-9e4715a90f6a \
--key-name=demo-keypair
"
sleep 1
openstack server create 'CLI Rocks!' \
--max 5 \
--flavor m1.small \
--image ubuntu-14.04-server-amd64 \
--security-group default \
--security-group management \
--nic net-id=11ee7077-99ac-4f74-8382-9e4715a90f6a \
--key-name=demo-keypair