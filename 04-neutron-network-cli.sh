echo "openstack network list"
openstack network list

echo "openstack router list"
openstack router list
read -n1 -r key

echo "neutron net-create demo-network-cli"
neutron net-create demo-network-cli
read -n1 -r key

echo "neutron subnet-create --name demo-subnet-cli demo-network-cli 192.168.10.0/24"
neutron subnet-create --name demo-subnet-cli demo-network-cli 192.168.10.0/24
read -n1 -r key

echo "neutron router-create --router_type=exclusive demo-router-cli"
neutron router-create --router_type=exclusive demo-router-cli
routerid=$(neutron router-list | grep cli | xargs -n 1 | sed -n '2 p')
subnetid=$(neutron subnet-list | grep cli | xargs -n 1 | sed -n '2 p')
externalid=$(neutron net-list | grep EXTNET | xargs -n 1 | sed -n '2 p')
read -n1 -r key

echo "neutron router-gateway-set $routerid $externalid"
neutron router-gateway-set $routerid $externalid
read -n1 -r key

echo "neutron router-interface-add $routerid $subnetid"
neutron router-interface-add $routerid $subnetid
read -n1 -r key

echo "openstack network list"
openstack network list

echo "openstack router list"
openstack router list