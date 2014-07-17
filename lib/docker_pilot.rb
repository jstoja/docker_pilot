require 'json'
require 'uri'
require 'net/http'

require 'docker_pilot/version'
require 'docker_pilot/utils'

module DockerPilot
  @@docker_host = "0.0.0.0"
  @@docker_port = 2375

  def self.version
    query_and_parse "/version"
  end

  def self.info
    query_and_parse "/info"
  end

  def self.events
    # TODO
  end

  def self.ping
    res = send_query "/_ping"
    (res.body == "OK") ? (true) : (false)
  end

  def self.host=(docker_host)
    @@docker_host = docker_host
  end
  def self.host
    @@docker_host
  end
  def self.port=(docker_port)
    @@docker_port = docker_port
  end
  def self.port
    @@docker_port
  end
end
