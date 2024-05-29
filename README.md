# medtrac


##### 1. Network Shareholders

There are five stakeholders organisation
1. Manufacturers
2. Distributors
3. Transporters
4. Retailers
5. Consumers

##### 2. Network Properties
1. Network Name: medtrac-network
2. Channel Name: medtracchannel
3. Orderer Type: Solo
4. Chaincode Name: medtracnet
5. Each of the organisations has one certificate authority has two peers namely peer0 and peer1
6. peer0 of each organisation is the anchor peer.
7. Each organisation has a fabric-ca service.
8. Each organisation has only ‘Admin’ user
9. TLS is disabled
10. The chaincode is installed on both the peers of all the organisations.
11. Endorsement Policy: Any one of the organisations endorses the transaction.

##### 3. To set-up the network following steps needs to be taken

###### 1. Make sure node, npm, docker and postman are already installed
###### 2. Install hyperledger fabric using the following command and make sure that fabric
version 1.4.7 and fabric-ca version 1.5.1 is the latest among the docker images

> curl -sSL https://bit.ly/2ysbOFE | bash -s -- 1.4.7 1.5.1

###### 3. You can check the docker images version using the docker command

> docker images

###### 4. Check if no containers are running using docker commands

> docker ps

and 

> docker ps -a

###### 5. Starting the network

To start the network first we to navigate to using follwing command

> cd medtrac/network 

and change script file permission as such

> chmod +x fabricNetwork.sh

Similarly navigate to the scripts folder 

> cd ../scripts

and change those files' permissions as such

> chmod +x bootstrap.sh

> chmod +x installChaincode.sh

> chmod +x updateChaincode.sh

> chmod +x utils.sh


###### 6. Generate Crypto Materials

To generate cypto materials for the network first navigate to 

> cd medtrac/network 

and use fabric network command. This will generate channel-artifacts and crypto-config folders inside the network.

> ./fabricNetwork.sh generate

###### 7. To up the network use this command

> ./fabricNetwork up

We can check if all the container are running using the docker command

> docker ps -a

###### 8. Now we open another terminal tab and navigate to the chaincode folder and open the chaincode container using this docker command

> docker exec -it chaincode /bin/bash

here we install node modules using this command

> npm install

Then run the application using following script command

> npm run start-dev

###### 9. Install and Instantiate the Chaincode

To install and instantiate the chaincode we need to run the following command in the network terminal tab.

> ./fabricNetwork install

###### 10. Run the Pharmanet Application

To run the application first navigate to the application folder and install node modules using this command

> npm install

Now to run the application using this command
> node .

###### 11. To add keys to peers navigate to network tab of terminal and run this command

> ./addKeysToPeers.sh 

###### 12. Import Postman Scripts

To test the network first we have to import the postman scripts. First, open the Postman application and click on the import button

Navigate to the Files tab and click on Upload files
Then navigate to medtrac/tests folder and select all files and click 'Open'
Then click 'Import'
This will import all the Postman scripts

###### 13. Initiation of Application
Here we register all the organisations and medicines. These requests might take up to five minutes.

1. First Register Organisations in Initiation folder
- Click Send on 'manufacturer-sunmedtrac-registerCompany' to Register Sun Pharma : Manufacturer (MAN001)
- Click Send on 'distributor-VGmedtrac-registerCompany' to Register VG Pharma : Distributor (DIST001)
- Click Send on 'retailer-upgrad-registerCompany' to Register upgrad : Retailer (RET002)
- Click Send on 'transporter-fedex-registerCompany' to Register FedEx : Transporter (TRA001)
- Click Send on 'transporter-bluedart-registerCompany' to Register Blue Dart : Transporter(TRA002)

2. Now to register medicines/drugs

- Click Send on 'manufacturer-Paracetamol-001-addDrug' to Add Paracetemol : 001 (serial number)
- Click Send on 'manufacturer-Paracetamol-002-addDrug' to Add Paracetemol : 002 (serial number)
- Click Send on 'manufacturer-Paracetamol-003-addDrug' to Add Paracetemol : 003 (serial number)
- Click Send on 'manufacturer-Paracetamol-004-addDrug' to Add Paracetemol : 004 (serial number)

3. Then on the Supply chain folder 
- Click Send on 'part-a-1-distributor-createPO' to create purchase order of 3 paracetemol from manfacturer (MAN001) to distributor (DIST001)
- Click Send on 'part-a-2-manufacturer-createShipment' to create shipment for 3 paracetemol(001, 002, 003) from manfacturer (MAN001) to transporter (TRA001)
- Click Send on 'part-a-3-transporter-updateShipment' to update shipment of paracetemols from disptributor (DIST001) to transporter(TRA001)
- Click Send on 'part-b-1-retailer-createPO' to create purchase order of 2 paracetemol from distributor (DIST001) to retailer (RET002)
- Click Send on 'part-b-2-distributor-createShipment' to create shipment for 2 paracetemol(001, 002) from transporter (TRA001) to retailer (RET002)
- Click Send on 'part-b-3-transporter-updateShipment' to update shipment of paracetemols from transporter(TRA002) to retailer (RET002)
- Click Send on 'part-c-1-retailer-retailDrug' to sell drug to end consumer from retailer(RET001) to consumer(with aadhar 'Sahil')

4. Now view history or current state go to History folder
- Click Send on 'viewHistory' to view history of Paracetemol of serial number 001
- Click Send on 'viewDrugCurrentState' to view the current state of medicine
