require 'docker_pilot/utils'

module DockerPilot
  class Image < ApiRessource
    def self.all(params = {})
      #**all** – 1/True/true or 0/False/false, default false
      #**filters** – a json encoded value of the filters (a map[string][]string) to process on the images list.
      query = "/images/json"
      #defaults = [
      #  :all,
      #  :filter
      #]

      #query += DockerPilot::build_query(params, defaults)
      res = DockerPilot::request(:get, query, params: params)
      images = []
      if res.kind_of? Array
        images = res.inject(images) { |acc, val| acc << Image.new(val) }
      elsif res.kind_of? Hash
        images << Image.new(res)
      end
      images
    end

    def self.create(query_parameters = {})
      #**fromImage** – name of the image to pull
      #**fromSrc** – source to import, - means stdin
      #**repo** – repository
      #**tag** – tag
      #**registry** – the registry to pull from
      query = "/images/create"
      defaults = [
        :fromImage,
        :fromSrc,
        :repo,
        :tag,
        :registry
      ]
      
      # TODO: Need to add and check the header in some way (with a mocking ?)
      #Header: **X-Registry-Auth** – base64-encoded AuthConfig object
      
      query += DockerPilot::build_query(query_parameters, defaults)
      DockerPilot::post_and_parse(query)
    end

    ##Only for <= 1.10
    #def self.insert(name, params = {})
    #  query = "/images/#{name}/insert"
    #  defaults = [
    #    :url,
    #    :path
    #  ]
    #    #**url** – The url from where the file is taken
    #    #**path** – The path where the file is stored
    #  

    #  query += DockerPilot::build_query(params, defaults)
    #  DockerPilot::post_and_parse(query)
    #end

    def self.inspect(name)
      query = "/images/#{name}/inspect"
      DockerPilot::post_and_parse(query)
    end

    def self.history(name)
      query = "/images/#{name}/history"
      DockerPilot::post_and_parse(query)
    end

    def self.search(term)
      query = "/images/search?term=" + term
      DockerPilot::get_and_parse(query)
    end
  end
end
