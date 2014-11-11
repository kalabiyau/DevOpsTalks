ansible_web_servers = `ansible -i ansible/hosts webservers --list-hosts`
ansible_web_servers.split('\n').map(&:strip).each do |ansible_server|
   server ansible_server, user: 'susecon14', roles: %w{ web }
end

set :ssh_options, {
   keys: %w(/home/kalabiyau/.ssh/achernikov_virginia.pem)
}
