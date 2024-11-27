# Ollama Setup

Goal of this repository is to quickly deploy a ollama model capable of running cline on an empty GPU host. Mostly tested using 1x A100 80G from Datacrunch.
If you want to run a smaller model, adjust the first line of the .modelfile to point to a smaller model.

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
- `.env` (optional): File containing client ID and secret for DataCrunch API authentication, only necessary for the `start_all_hibernated_instances.sh` script.
- `start_all_hibernated_instances.sh`: Script to start all instances that are in the 'hibernating' state.

## .env File

If you plan to use the `start_all_hibernated_instances.sh` script, create a file named `.env` in the root of this repository with the following content, replacing the placeholders with your actual client ID and secret:
```
CLIENT_ID=your_client_id
CLIENT_SECRET=your_client_secret
```

## Credits

Got a .modelfile that works well from the https://ollama.com/hhao/qwen2.5-coder-tools model.
Had to adjust this because this ollama model does not come in the larger 32b-fp16 variation.
