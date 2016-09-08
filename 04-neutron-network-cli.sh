echo "openstack network list"
openstack network list

echo "openstack router list"
openstack router list

sleep 5

echo "neutron net-create demo-network-cli"
neutron net-create demo-network-cli

echo "neutron subnet-create --name demo-subnet-cli demo-network-cli 192.168.10.0/24"
neutron subnet-create --name demo-subnet-cli demo-network-cli 192.168.10.0/24

echo "neutron router-create --router_type=exclusive demo-router-cli"
neutron router-create --router_type=exclusive demo-router-cli
routerid=$(neutron router-list | grep cli | xargs -n 1 | sed -n '2 p')
subnetid=$(neutron subnet-list | grep cli | xargs -n 1 | sed -n '2 p')
externalid=$(neutron net-list | grep EXTNET | xargs -n 1 | sed -n '2 p')

echo "neutron router-gateway-set $routerid $externalid"
neutron router-gateway-set $routerid $externalid

echo "neutron router-interface-add $routerid $subnetid"
neutron router-interface-add $routerid $subnetid

echo "openstack network list"
openstack network list

echo "openstack router list"
openstack router list