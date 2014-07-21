require 'spec_helper'
require 'docker_pilot/utils'

describe DockerPilot do
  it "#dockerURI without params" do
    DockerPilot.host = "192.168.59.103"
    uri = URI("http://192.168.59.103:2375/")
    expect(DockerPilot.dockerURI).to eq(uri)
  end
  it "#dockerURI with params" do
    DockerPilot.host = "192.168.59.103"
    uri = URI("http://192.168.59.103:2375/_ping")
    expect(DockerPilot.dockerURI("/_ping")).to eq(uri)
  end

  it "#add_params should be ok with an empty hash in either way" do
    res = DockerPilot::add_params({}, {})
    expect(res).to eq("")
  end

  xit "#query_and_parse" do
    res = DockerPilot.query_and_parse
    expect(res).to be_an_instance_of(Hash)
  end
end
