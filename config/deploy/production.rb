require 'json'
ansible_web_servers = JSON.load(`./ansible/ec2.py --list`)['tag_Name_webserver']
ansible_web_servers.each do |ansible_server|
   server ansible_server, user: 'susecon14', roles: %w{ web }
end

set :ssh_options, {
   keys: %w(/home/achernikov/.ssh/susecon_14)
}
