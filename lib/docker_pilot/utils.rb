require 'active_support/all'

module DockerPilot

  def self.build_query(params, defaults)
    "?" + params.compact.extract!(*defaults).to_query
  end

  def self.query_and_parse(query_path = "/")
    res = send_query query_path
    if res.instance_of? Net::HTTPOK and res.body != nil
      JSON.parse(res.body)
    else
      {}
    end
  end

  def self.send_query(query_path = "/")
    uri = dockerURI query_path
    Net::HTTP.get_response uri
  end

  def self.dockerURI(query_path = "/")
    URI("http://" + @@docker_host + ":" + @@docker_port.to_s + query_path)
  end
end
