# Cayley config
default['cayley'] = {
  version: '0.3.0',
  directory: '/opt/cayley',
  listen_host: '0.0.0.0',
  listen_port: '64210',
  read_only: false,
  load_size: 10000,
  backend: 'mem',
  log_directory: '/var/log/cayley',
  db_path: '/tmp/testdb'
}

# Cayley Archive Attributes
default[:cayley][:archive_name] = "cayley_#{node.cayley.version}_linux_386"
default[:cayley][:archive_url] = "https://github.com/google/cayley/releases/download/v#{node.cayley.version}/#{node.cayley.archive_name}.tar.gz"
