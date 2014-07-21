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
    it "should work with several params but not the wrong ones" do
      DockerPilot.host = "192.168.59.103"
      res = DockerPilot::Images.all(all: 1, foo: :bar, filters: "")
      expect(res).to be_an_instance_of(Array)
    end
  end

  describe "#create" do
    it "should work with several params (even wrong ones)" do
      DockerPilot.host = "192.168.59.103"
      res = DockerPilot::Images.all(all: 1, foo: :bar, filters: "")
      expect(res).to be_an_instance_of(Array)
    end
  end

    xit "#search an image on the hub" do
      res = DockerPilot::Images.search "sshd"
      expect(res).to be_an_instance_of(Array)
    end
end
