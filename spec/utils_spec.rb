require 'spec_helper'
require 'docker_pilot/utils'

describe DockerPilot do
  it "#dockerURI without params" do
    uri = URI("http://0.0.0.0:2375/")
    expect(DockerPilot.dockerURI).to eq(uri)
  end
  it "#dockerURI with params" do
    uri = URI("http://0.0.0.0:2375/_ping")
    expect(DockerPilot.dockerURI("/_ping")).to eq(uri)
  end

  xit "#query_and_parse" do
    res = DockerPilot.query_and_parse
    expect(res).to be_an_instance_of(Hash)
  end
end
