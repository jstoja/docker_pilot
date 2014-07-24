require 'net/http'
require 'active_support/all'

module DockerPilot

  #def self.build_query(params, defaults)
  #  "?" + params.compact.extract!(*defaults).to_query
  #end

  #def self.post_and_parse(query_path = "/", data = "")
  #  parse_query post_query(query_path, data)
  #end

  #def self.get_and_parse(query_path = "/")
  #  parse_query get_query(query_path)
  #end

  #def self.parse_query(result)
  #  if result.instance_of? Net::HTTPOK and result.body
  #    JSON.parse(result.body)
  #  else
  #    {}
  #  end
  #end

  #def self.post_query(query_path = "/", data = "")
  #  uri = dockerURI query_path
  #  http = Net::HTTP.new(uri.host, DockerPilot::port)
  #  http.request_post(uri.path, data, {'Content-Type' =>'application/json'})
  #end

  #def self.get_query(query_path = "/")
  #  uri = dockerURI query_path
  #  Net::HTTP.get_response uri
  #end

  #def self.dockerURI(query_path = "/")
  #  URI("http://" + @@docker_host + ":" + @@docker_port.to_s + query_path)
  #end
end
