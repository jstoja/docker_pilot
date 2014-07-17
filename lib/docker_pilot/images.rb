require 'docker_pilot/utils'

module DockerPilot
  class Images
    def self.all(full = false)
      query = "/images/json?all="
      query += (full ? "1" : "0")
      DockerPilot::query_and_parse(query)
    end

    def self.all_a
      all(true)
    end
  end
end
