#- Mariano Soto 
#- MictlanTech
## ========================================================================================================##
#  Python script that reads a .json file, which is expected to contain the Terraform output in JSON format, #
#  and prints an inventory that Ansible can understand,  run the script from the terminal and provide the   #
#  path to your JSON file as an argument: "python generate_inventory.py /path/to/your/inventory.json"       #

import json
import sys
import argparse

def generate_ansible_inventory(inventory_json_path):
    try:
        # Load the JSON output of Terraform
        with open(inventory_json_path, 'r') as file:
            terraform_output = json.load(file)
        
        # Assuming the JSON has a key "instance_ips" which is a list of IP addresses
        instance_ips = terraform_output.get('instance_ips', {}).get('value', [])
        
        # Create an inventory string in INI format
        inventory = "[webservers]\n"
        for ip in instance_ips:
            inventory += f"{ip} ansible_user=ubuntu\n" # Customize the user as needed
        
        return inventory

    except Exception as e:
        print(f"Error reading inventory JSON: {e}", file=sys.stderr)
        sys.exit(1)

# Main function to print the inventory
def main():
    parser = argparse.ArgumentParser(description='Generate Ansible inventory from a JSON file.')
    parser.add_argument('json_file', help='Path to the JSON file containing Terraform output')
    args = parser.parse_args()
    
    inventory = generate_ansible_inventory(args.json_file)
    print(inventory)

if __name__ == '__main__':
    main()