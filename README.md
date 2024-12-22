# vLLM Setup

Goal of this repository is to quickly deploy a Qwen model capable of running Cline on an empty GPU host using vLLM. Mostly tested using 1x A100 80G from Datacrunch.

This repository contains an Ansible playbook to set up vLLM on a remote host, and start the vLLM service.

## Prerequisites

- Ansible installed on your local machine.
- SSH access to the target host with appropriate permissions.
- Python 3.9 - 3.12
- GPU with compute capability 7.0 or higher

## Instructions

1. **Create `hosts.ini` File**:
   Create a file named `hosts.ini` in the root of this repository with the following content, replacing the placeholders with your actual host details:

   ```
   [vllm_host]
   <hostname> ansible_user=<username> ansible_ssh_private_key_file=<path_to_private_key>
   ```

   Example:
   ```
   [vllm_host]
   192.168.1.100 ansible_user=root ansible_ssh_private_key_file=/path/to/private/key
   ```

2. **Run the Ansible Playbook**:

   ```sh
   ansible-playbook -i hosts.ini setup_vllm.yml
   ```

## Files

- `README.md`: Instructions for setting up vLLM using Ansible.
- `setup_vllm.yml`: Ansible playbook to set up vLLM and start the service.