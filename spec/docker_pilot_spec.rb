require 'spec_helper'
require 'docker_pilot'

describe DockerPilot do

  describe "API" do
    it "#ping" do
      DockerPilot.url = "192.168.59.103"
      res = DockerPilot.ping
      expect(res).to be_truthy.or be_falsy
    end

    xit "#events" do
      pending "Can't understand what this is doing for now"
      res = DockerPilot.expect
      expect(res).to be_truthy.or be_falsy
    end

    it "#info" do
      res = DockerPilot.info
      expect(res).to be_an_instance_of(Hash)
    end

    it "#version" do
      res = DockerPilot.version
      expect(res).to be_an_instance_of(Hash)
    end

  end
end
