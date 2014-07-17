require 'spec_helper'
require 'docker_pilot/images'

describe DockerPilot::Images do
    it "#all" do
      res = DockerPilot::Images.all
      expect(res).to be_an_instance_of(Array)
    end

    it "#all_a" do
      res = DockerPilot::Images.all_a
      expect(res).to be_an_instance_of(Array)
    end
end
