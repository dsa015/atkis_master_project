#!/bin/bash

# Code from Bendik M Kuhlmann
# Load env variables
source .env


if [[ -z "${ONTOLOGY_NAME}" ]]; then
	echo "Environment variable for ONTOLOGY_NAME name not found. Please set this in a .env file in the same folder as this script and ontology files."
	exit
fi

# Check for ontology file and set var
if [[ -f "$ONTOLOGY_NAME.ttl" ]]; then
	ONTOLOGY="$ONTOLOGY_NAME.ttl"
else
	echo "! OWL ontology file for $ONTOLOGY_NAME not found. Exiting."
	exit
fi
echo "- Found ontology file: $ONTOLOGY"

# Mapping/OBDA file
if [[ -f "$ONTOLOGY_NAME.obda" ]]; then
	MAPPING="$ONTOLOGY_NAME.obda"
else
	echo "! Mapping file for $ONTOLOGY_NAME not found. Exiting."
	exit
fi
echo "- Found mapping file: $MAPPING"

# Properties file
if [[ -f "$ONTOLOGY_NAME.properties" ]]; then
	PROPERTIES="$ONTOLOGY_NAME.properties"
else
	echo "! Properties file for $ONTOLOGY_NAME not found. Exiting."
	exit
fi
echo "- Found properties file: $PROPERTIES"

# Portal.toml file
if [[ -f "$ONTOLOGY_NAME.portal.toml" ]]; then
	PORTAL="$ONTOLOGY_NAME.portal.toml"
else
	echo "! Portaø file for $ONTOLOGY_NAME not found. Exiting."
	exit
fi
echo "- Found Portal file: $PORTAL"

ONTOP_ENDPOINT_COMMAND="ontop endpoint -t $ONTOLOGY -m $MAPPING -p $PROPERTIES --portal $PORTAL --cors-allowed-origins=* --port=3001"

YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "\nThe following command will be run:\n"
echo "${YELLOW}$ONTOP_ENDPOINT_COMMAND${NC}"
echo ""

while true; do
    read -p "Do you want to continue? (y/n): " yn
    case $yn in
        [Yy]* ) echo "Continuing..."; break;;
        [Nn]* ) echo "Exiting..."; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

exec $ONTOP_ENDPOINT_COMMAND
