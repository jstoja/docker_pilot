require 'spec_helper'
require 'docker_pilot/images'

describe DockerPilot::Images do

  describe "#all" do
    it "should work with no params" do
      DockerPilot.host = "192.168.59.103"
      res = DockerPilot::Images.all
      expect(res).to be_an_instance_of(Array)
    end

    it "should work with one param" do
      DockerPilot.host = "192.168.59.103"
      res = DockerPilot::Images.all(all: 1)
      expect(res).to be_an_instance_of(Array)
    end

    it "should work with several params" do
      DockerPilot.host = "192.168.59.103"
      res = DockerPilot::Images.all(all: 1, filters: "")
      expect(res).to be_an_instance_of(Array)
    end
  end

  describe "#create" do
    it "should work with several params" do
      DockerPilot.host = "192.168.59.103"
      res = DockerPilot::Images.all(fromImage: 'base')
      expect(res).to be_an_instance_of(Array)
    end
  end

  describe "#insert" do
    it "should work with several params" do
      DockerPilot.host = "192.168.59.103"
      res = DockerPilot::Images.insert("test")
      #TODO: Need to have a streaming method to handle this since it comes Hash by Hash
      expect(res).to be_an_instance_of(Hash)
    end
  end

  describe "#inspect" do
    it "should work with the only param" do
      DockerPilot.host = "192.168.59.103"
      res = DockerPilot::Images.inspect("test")
      expect(res).to be_an_instance_of(Hash)
    end
  end
  describe "#history" do
    it "should work with the only param" do
      DockerPilot.host = "192.168.59.103"
      res = DockerPilot::Images.history("test")
      expect(res).to be_an_instance_of(Hash)
    end
  end

  xit "#search an image on the hub" do
    res = DockerPilot::Images.search "sshd"
    expect(res).to be_an_instance_of(Array)
  end
end
