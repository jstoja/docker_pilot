require 'spec_helper'
require 'docker_pilot/images'

describe DockerPilot::Images do
    it "#all" do
      DockerPilot.host = "192.168.59.103"
      res = DockerPilot::Images.all
      expect(res).to be_an_instance_of(Array)
    end

    it "#all with all param" do
      DockerPilot.host = "192.168.59.103"
      res = DockerPilot::Images.all({all: true})
      expect(res).to be_an_instance_of(Array)
    end

    xit "#search an image on the hub" do
      res = DockerPilot::Images.search "sshd"
      expect(res).to be_an_instance_of(Array)
    end
end
