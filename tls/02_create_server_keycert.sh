#!/bin/bash

# The MIT License (MIT)
# Copyright (c) 2015 de-wiring.net
#
# EXAMPLE script, NOT READY FOR PRODUCTION USE
#

# --
# given a ca, create key and cert as intermediate

source '00_functions.sh'

if [[ ! -d $CA_PATH ]]; then
        echo ERROR did not find ca path
        exit 2
fi

create_key_req_cert wallet '/C=DE/L=Berlin/O=de-wiring.net/OU=containerwallet/CN=wallet'

F=/wallet/ca/private/dhparam.pem
if [[ ! -f $F ]]; then
	openssl dhparam -out $F 2048
fi
