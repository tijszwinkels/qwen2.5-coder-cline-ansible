# Ollama Setup

This repository contains an Ansible playbook to set up Ollama on a remote host, create a new model using a provided model file, and establish an SSH tunnel to make Ollama available locally.

## Prerequisites
- Ansible installed on your local machine.
- SSH access to the target host with appropriate permissions.

## Instructions

1. **Install Ansible** (if not already installed):
   ```sh
   brew install ansible
   ```

2. **Create `hosts.ini` File**:
   Create a file named `hosts.ini` in the root of this repository with the following content, replacing the placeholders with your actual host details:
   ```
   [ollama_host]
   <hostname> ansible_user=<username> ansible_ssh_private_key_file=<path_to_private_key>
   ```

   Example:
   ```
   [ollama_host]
   192.168.1.100 ansible_user=root ansible_ssh_private_key_file=/path/to/private/key
   ```

3. **Run the Ansible Playbook**:
   ```sh
   ansible-playbook -i hosts.ini setup_ollama.yml
   ```

4. **Start SSH Tunnel**:
   After running the playbook, you can start an SSH tunnel to make Ollama available on `localhost` at port `11435`. Run the following script:
   ```sh
   ./start_tunnel.sh
   ```

## Files

- `README.md`: Instructions for setting up Ollama using Ansible.
- `setup_ollama.yml`: Ansible playbook to set up Ollama, create a new model, and start an SSH tunnel.
- `qwen2.5-coder-cline.modelfile`: Model file used for creating the new model.
- `start_tunnel.sh`: Script to establish the SSH tunnel.
