#!/bin/bash

hciconfig hci0 sspmode 1
hciconfig hci0 down
hciconfig hci0 up
