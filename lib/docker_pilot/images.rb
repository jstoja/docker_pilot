require 'docker_pilot/utils'

module DockerPilot
  class Images
    def self.all(hash = {})
      #**all** – 1/True/true or 0/False/false, Show all containers. Only running containers are shown by default
      #**limit** – Show `limit` last created containers, include non-running ones.
      #**since** – Show only containers created since Id, include non-running ones.
      #**before** – Show only containers created before Id, include non-running ones.
      #**size** – 1/True/true or 0/False/false, Show the containers sizes

      query = "/images/json"
      DockerPilot::query_and_parse(query)
    end

    def self.search(term)
      query = "/images/search?term=" + term
      DockerPilot::query_and_parse(query)
    end
  end
end
