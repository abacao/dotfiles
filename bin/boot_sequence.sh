#!/bin/bash

lapp(){
    /opt/Ferdi/ferdi </dev/null &>/dev/null &
    /usr/bin/slack </dev/null &>/dev/null &
    /usr/bin/zoom </dev/null &>/dev/null &
}

kapp() {
    pkill 'ferdi|slack|zoom'
}
