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

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['cayley']['version']</tt></td>
    <td>String</td>
    <td>Version of Cayley to manage</td>
    <td><tt>0.3.0</tt></td>
  </tr>
  <tr>
    <td><tt>['cayley']['backend']</tt></td>
    <td>String</td>
    <td>Determines the type of the underlying database. (`mem`|`leveldb`|`mongodb`)</td>
    <td><tt>mem</tt></td>
  </tr>
  <tr>
    <td><tt>['cayley']['directory']</tt></td>
    <td>String</td>
    <td>Directory for Cayley to be installed</td>
    <td><tt>/opt/cayley</tt></td>
  </tr>
  <tr>
    <td><tt>['cayley']['listen_host']</tt></td>
    <td>String</td>
    <td>The hostname or IP address for Cayley's HTTP server to listen on.</td>
    <td><tt>0.0.0.0</tt></td>
  </tr>
  <tr>
    <td><tt>['cayley']['listen_port']</tt></td>
    <td>String</td>
    <td>The port for Cayley's HTTP server to listen on.</td>
    <td><tt>64210</tt></td>
  </tr>
  <tr>
    <td><tt>['cayley']['read_only']</tt></td>
    <td>Boolean</td>
    <td>If true, disables the ability to write to the database using the HTTP API.</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['cayley']['log_dir']</tt></td>
    <td>String</td>
    <td>Location to store runtime and error log messages.</td>
    <td><tt>/var/log/cayley</tt></td>
  </tr>
  <tr>
    <td><tt>['cayley']['db_path']</tt></td>
    <td>String</td>
    <td>Where the database actually lives. For `mem`, file location of initial data set. For `mongodb`,
    hostname and port.</td>
    <td><tt>/tmp/testdb</tt></td>
  </tr>
</table>

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

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Sean Stavropoulos (sean.stavro@gmail.com)
