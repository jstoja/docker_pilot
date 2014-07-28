require 'active_support/core_ext'

module DockerPilot
  class DockerPilotObject
    def initialize(values={})
      @values = values
    end

    def update_values(values)
      @values.reverse_merge(values)
    end
  end
end
