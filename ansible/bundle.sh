#!/usr/bin/env bash

# exit when any command fails

# Run lint
yamllint .
ansible-lint .
ansible-playbook --syntax-check site.yml
ansible-playbook --syntax-check test.yml
ansible-playbook --syntax-check create-users.yml
ansible-playbook --syntax-check awx.yml
ansible-playbook --syntax-check rundeck.yml
#ansible-test sanity
# ansible-test sanity --docker default
#python -m molecule check

# Line count
#scc
