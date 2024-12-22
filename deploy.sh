#!/bin/bash

# Run the ansible playbook for setting up vLLM
ansible-playbook -i hosts.ini setup_vllm.yml