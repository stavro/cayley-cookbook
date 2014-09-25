# Cayley Cookbook

Cayley is an open-source graph inspired by the graph database behind Freebase and Google's Knowledge Graph.

This cookbook sets up a Cayley instance through the Chef automation platform.

## Supported Platforms

* Ubuntu 14.04 LTS
* Amazon

## Supported Backends

* Memory
* MongoDB
* LevelDB (Coming soon!)


## Attributes


| Key                         | Type     | Default           | Description           |
|:----------------------------|:---------|:------------------|:----------------------|
| `node['cayley']['version']`     | String   | `0.3.0`           | Version of Cayley to manage. |
| `node['cayley']['backend']`     | String   | `mem`             | Determines the type of the underlying database. (`mem`|`leveldb`|`mongodb`) |
| `node['cayley']['directory']`   | String   | `/opt/cayley`     | Directory for Cayley to be installed |
| `node['cayley']['listen_host']` | String   | `0.0.0.0`         | The hostname or IP address for Cayley's HTTP server to listen on. |
| `node['cayley']['listen_port']` | String   | `64210`           | The port for Cayley's HTTP server to listen on. |
| `node['cayley']['read_only']`   | Boolean  | `false`           | If true, disables the ability to write to the database using the HTTP API. |
| `node['cayley']['log_dir']`     | String   | `/var/log/cayley` | Location to store runtime and error log messages. |
| `node['cayley']['db_path']`     | String   | `/tmp/testdb`     | Where the database actually lives. For `mem`, file location of initial data set. For `mongodb`, hostname and port. |
| `node['cayley']['db_options']`  | Object   | `{}`              | Per-Database Options. |

### Per-Database Options

#### Memory

No special options.

#### LevelDB

| Key                                                | Type      | Default     | Description           |
|:---------------------------------------------------|:----------|:------------|:----------------------|
| `node['cayley']['db_options']['write_buffer_mb']`  | Integer   | `20`        | The size in MiB of the LevelDB write cache. Increasing this number allows for more/faster writes before syncing to disk. Default is 20, for large loads, a recommended value is 200+. |
| `node['cayley']['db_options']['cache_size_mb']`    | Integer   | `2`         | The size in MiB of the LevelDB block cache. Increasing this number uses more memory to maintain a bigger cache of triple blocks for better performance. |

#### MongoDB

| Key                                              | Type     | Default           | Description           |
|:-------------------------------------------------|:---------|:------------------|:----------------------|
| `node['cayley']['db_options']['database_name']`  | String   | `cayley`          | The name of the database within MongoDB to connect to. Manages its own collections and indicies therein. |


## Usage

### cayley::setup

Include `cayley` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[cayley::setup]"
  ]
}
```

Or for OpsWorks:

![image](https://cloud.githubusercontent.com/assets/2391584/3450111/789d288a-0173-11e4-966f-9293236302f3.png)

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Sean Stavropoulos (sean.stavro@gmail.com)
