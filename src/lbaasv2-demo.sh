echo "Create the LBaaS v2 Load Balancer"
echo "neutron lbaas-loadbalancer-create --name lbaasv2 dev-subnet-2"
neutron lbaas-loadbalancer-create --name lbaasv2 dev-subnet-2
sleep 3

echo "Create the Load Balancer Listener"
echo "neutron lbaas-listener-create --loadbalancer lbaasv2 --protocol HTTP --protocol-port 80 --name lbaasv2-listener"
neutron lbaas-listener-create --loadbalancer lbaasv2 --protocol HTTP --protocol-port 80 --name lbaasv2-listener
sleep 3

echo "Create the Load Balancer Pool"
echo "neutron lbaas-pool-create --lb-algorithm ROUND_ROBIN --listener lbaasv2-listener --protocol HTTP --name lbaasv2-pool"
neutron lbaas-pool-create --lb-algorithm ROUND_ROBIN --listener lbaasv2-listener --protocol HTTP --name lbaasv2-pool
sleep 3

echo "Add the web servers to the pool"
echo "neutron lbaas-member-create --subnet 2e69a0f9-f522-4fc6-a101-63cc2efe1284 --address 172.10.0.4 --protocol-port 80 lbaasv2-pool"
echo "neutron lbaas-member-create --subnet 2e69a0f9-f522-4fc6-a101-63cc2efe1284 --address 172.10.0.5 --protocol-port 80 lbaasv2-pool"
neutron lbaas-member-create --subnet 2e69a0f9-f522-4fc6-a101-63cc2efe1284 --address 172.10.0.4 --protocol-port 80 lbaasv2-pool
neutron lbaas-member-create --subnet 2e69a0f9-f522-4fc6-a101-63cc2efe1284 --address 172.10.0.5 --protocol-port 80 lbaasv2-pool
sleep 3

echo "Create the Server Health Monitor"
neutron lbaas-healthmonitor-create --delay 30 --type HTTP --max-retries 1 --timeout 30 --pool lbaasv2-pool