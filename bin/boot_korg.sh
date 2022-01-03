#!/bin/bash

echo mainOutput = $(python3 ~/bin/nanoKontrol.py -l | grep pci | awk {'print $2'} | grep -v monitor)
echo headsetOutput = $(python3 ~/bin/nanoKontrol.py -l | head -n 1 | awk {'print $2'})
echo ""
echo headsetInput = $(python3 ~/bin/nanoKontrol.py -l | grep input | awk {'print $2'} | grep -v monitor)
