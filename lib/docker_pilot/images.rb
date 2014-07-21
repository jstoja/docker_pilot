require 'docker_pilot/utils'

module DockerPilot
  class Images
    def self.all(params = {})
      #**all** – 1/True/true or 0/False/false, default false
      #**filters** – a json encoded value of the filters (a map[string][]string) to process on the images list.
      query = "/images/json"
      defaults = [
        :all,
        :filter
      ]

      query += DockerPilot::build_query(params, defaults)
      DockerPilot::query_and_parse(query)
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
      DockerPilot::query_and_parse(query)
    end

    def self.search(term)
      query = "/images/search?term=" + term
      DockerPilot::query_and_parse(query)
    end
  end
end
