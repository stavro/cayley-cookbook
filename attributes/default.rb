# Cayley config

default[:cayley][:version]      = '0.3.0'
default[:cayley][:directory]    = '/opt/cayley'
default[:cayley][:listen_host]  = '0.0.0.0'
default[:cayley][:listen_port]  = '64210'
default[:cayley][:read_only]    = false
default[:cayley][:load_size]    = 10000
default[:cayley][:backend]      = 'mem'
default[:cayley][:log_dir]      = '/var/log/cayley'
default[:cayley][:db_path]      = '/tmp/testdb'

# Cayley archive

default[:cayley][:archive_name] = "cayley_#{node.cayley.version}_linux_386"
default[:cayley][:archive_url]  = "https://github.com/google/cayley/releases/download/v#{node.cayley.version}/#{node.cayley.archive_name}.tar.gz"
