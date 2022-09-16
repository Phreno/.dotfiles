#!/bin/bash
alias wiki.reload_daemon='systemctl --user daemon-reload'
alias wiki.status='systemctl --user status neuron.service'
alias wiki.enable='systemctl --user enable neuron.service'
alias wiki.stop='systemctl --user stop neuron.service'
alias wiki.start='systemctl --user start neuron.service'
alias wiki.restart='wiki.stop; wiki.start'
alias wiki.files='find -L ~/neuron -type f -name "*md"'
alias wiki.watch='find -L ~/neuron -type f -name "*md" | entr -s "systemctl --user stop neuron.service;systemctl --user start neuron.service"'

