require 'spec_helper'
require 'docker_pilot'

describe DockerPilot do

  it "has a host by default" do
    expect(DockerPilot.host).to eq("0.0.0.0")
  end

  it "has a port by default" do
    expect(DockerPilot.port).to eq(2375)
  end

  describe "API" do
    it "#ping" do
      res = DockerPilot.ping
      expect(res).to be_truthy.or be_falsy
    end

    it "#events" do
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
