require 'spec_helper'
require 'docker_pilot/image'

describe DockerPilot::Image do

  describe "#all" do
    it "should work with no params" do
      DockerPilot.url = "192.168.59.103"
      res = DockerPilot::Image.all
      expect(res).to be_an_instance_of(Array)
      expect(res[0]).to be_an_instance_of(DockerPilot::Image)
    end

    xit "should work with one param" do
      DockerPilot.host = "192.168.59.103"
      res = DockerPilot::Image.all(all: 1)
      expect(res).to be_an_instance_of(Array)
    end

    xit "should work with several params" do
      DockerPilot.host = "192.168.59.103"
      res = DockerPilot::Image.all(all: 1, filters: "")
      expect(res).to be_an_instance_of(Array)
    end
  end

  describe "#create" do
    xit "should work with several params" do
      DockerPilot.host = "192.168.59.103"
      res = DockerPilot::Image.all(fromImage: 'base')
      expect(res).to be_an_instance_of(Array)
    end
  end

  describe "#insert" do
    xit "should work with several params" do
      DockerPilot.host = "192.168.59.103"
      res = DockerPilot::Image.insert("test")
      #TODO: Need to have a streaming method to handle this since xit comes Hash by Hash
      expect(res).to be_an_instance_of(Hash)
    end
  end

  describe "#inspect" do
    xit "should work with the only param" do
      DockerPilot.host = "192.168.59.103"
      res = DockerPilot::Image.inspect("test")
      expect(res).to be_an_instance_of(Hash)
    end
  end
  describe "#history" do
    xit "should work with the only param" do
      DockerPilot.host = "192.168.59.103"
      res = DockerPilot::Image.history("test")
      expect(res).to be_an_instance_of(Hash)
    end
  end

  xit "#search an image on the hub" do
    res = DockerPilot::Image.search "sshd"
    expect(res).to be_an_instance_of(Array)
  end
end
