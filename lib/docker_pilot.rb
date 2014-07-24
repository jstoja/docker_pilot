require 'json'
require 'uri'
require 'net/http'
require 'rest_client'

require 'docker_pilot/version'
require 'docker_pilot/docker_pilot_object'
require 'docker_pilot/api_ressource'
require 'docker_pilot/utils'

module DockerPilot
  @url = "0.0.0.0"
  @docker_port = 2375

  class << self
    attr_accessor :docker_host, :url
  end

  def self.version
    request(:get, '/version')
    #get_and_parse "/version"
  end

  def self.info
    request(:get, '/info')
    #get_and_parse "/info"
  end

  def self.events
    # TODO
  end

  def self.ping
    res = request(:get, '/_ping')
    (res == "OK") ? (true) : (false)
  end

  def self.request(method, url, params={}, headers={})
    url = "#{@url}:#{@docker_port}" + url
    request_opts = {}
    request_opts.update(:method => method, :open_timeout => 30,
                        :url => url, :timeout => 80)
    begin
       response = execute_request(request_opts)
    rescue SocketError => e
    rescue NoMethodError => e
    rescue RestClient::ExceptionWithResponse => e
    rescue RestClient::Exception, Errno::ECONNREFUSED => e
    end
     #rescue SocketError => e
     #  #handle_restclient_error(e)
     #rescue NoMethodError => e
     #  # Work around RestClient bug
     #  if e.message =~ /\WRequestFailed\W/
     #    #e = APIConnectionError.new('Unexpected HTTP response code')
     #    #handle_restclient_error(e)
     #  else
     #    raise
     #  end
     #rescue RestClient::ExceptionWithResponse => e
     #  if rcode = e.http_code and rbody = e.http_body
     #    #handle_api_error(rcode, rbody)
     #  else
     #    #handle_restclient_error(e)
     #  end
     #rescue RestClient::Exception, Errno::ECONNREFUSED => e
     #  #handle_restclient_error(e)
     #end
    parse(response)
  end

  def self.execute_request(opts)
    RestClient::Request.execute(opts)
  end

  def self.parse(response)
    begin
      # Would use :symbolize_names => true, but apparently there is
      # some library out there that makes symbolize_names not work.
      response = JSON.parse(response)
    rescue JSON::ParserError
      #TODO: make more specific
    end

    response
  end
end
