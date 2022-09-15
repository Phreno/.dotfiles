#!/bin/bash 
cd ~/.dotfiles/conf/neuron/
ls *md  | entr -r /usr/local/bin/neuron -d ~/neuron gen -ws localhost:4321
