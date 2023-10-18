#!/bin/bash

# Define the YAML file path
yaml_file="caliper-config.yaml"

# Define the directory containing the target file
manufacturerDirectory="./crypto-config/peerOrganizations/manufacturer.medtrac-network.com/peers/peer0.manufacturer.medtrac-network.com/msp/keystore/"

# Get the absolute filename of the file in the directory
manufacturer_file_name=$(ls -1 "$manufacturerDirectory")

# Generate the absolute file path
manufacturer_absolute_file_path="${manufacturerDirectory}${manufacturer_file_name}"

# Update the YAML file with the new absolute file path
sed -i "s|path: '$manufacturerDirectory.*'|path: '$manufacturer_absolute_file_path'|" "$yaml_file"

# Define the directory containing the target file
distributorDirectory="./crypto-config/peerOrganizations/distributor.medtrac-network.com/peers/peer0.distributor.medtrac-network.com/msp/keystore/"

# Get the absolute filename of the file in the directory
distributor_file_name=$(ls -1 "$distributorDirectory")

# Generate the absolute file path
distributor_absolute_file_path="${distributorDirectory}${distributor_file_name}"

# Update the YAML file with the new absolute file path
sed -i "s|path: '$distributorDirectory.*'|path: '$distributor_absolute_file_path'|" "$yaml_file"

# # Define the directory containing the target file
# transporterDirectory="./crypto-config/peerOrganizations/transporter.medtrac-network.com/peers/peer0.transporter.medtrac-network.com/msp/keystore/"

# # Get the absolute filename of the file in the directory
# transporter_file_name=$(ls -1 "$transporterDirectory")

# # Generate the absolute file path
# transporter_absolute_file_path="${transporterDirectory}${transporter_file_name}"

# # Update the YAML file with the new absolute file path
# sed -i "s|path: '$transporterDirectory.*'|path: '$transporter_absolute_file_path'|" "$yaml_file"

# # Define the directory containing the target file
# retailerDirectory="./crypto-config/peerOrganizations/retailer.medtrac-network.com/peers/peer0.retailer.medtrac-network.com/msp/keystore/"

# # Get the absolute filename of the file in the directory
# retailer_file_name=$(ls -1 "$retailerDirectory")

# # Generate the absolute file path
# retailer_absolute_file_path="${retailerDirectory}${retailer_file_name}"

# # Update the YAML file with the new absolute file path
# sed -i "s|path: '$retailerDirectory.*'|path: '$retailer_absolute_file_path'|" "$yaml_file"

# # Define the directory containing the target file
# consumerDirectory="./crypto-config/peerOrganizations/consumer.medtrac-network.com/peers/peer0.consumer.medtrac-network.com/msp/keystore/"

# # Get the absolute filename of the file in the directory
# consumer_file_name=$(ls -1 "$consumerDirectory")

# # Generate the absolute file path
# consumer_absolute_file_path="${consumerDirectory}${consumer_file_name}"

# # Update the YAML file with the new absolute file path
# sed -i "s|path: '$consumerDirectory.*'|path: '$consumer_absolute_file_path'|" "$yaml_file"

echo "Updated the YAML file $yaml_file with the new absolute file path"
