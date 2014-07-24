require 'spec_helper'
require 'docker_pilot/utils'

describe DockerPilot do
  xit "#dockerURI without params" do
    DockerPilot.host = "192.168.59.103"
    uri = URI("http://192.168.59.103:2375/")
    expect(DockerPilot.dockerURI).to eq(uri)
  end
  xit "#dockerURI with params" do
    DockerPilot.host = "192.168.59.103"
    uri = URI("http://192.168.59.103:2375/_ping")
    expect(DockerPilot.dockerURI("/_ping")).to eq(uri)
  end

  describe "#build_query" do
    xit "should be ok with an empty hash in either way" do
      res = DockerPilot::build_query({}, [])
      expect(res).to eq("?")
    end

    xit "should work with 1 param not in defaults" do
      res = DockerPilot::build_query({all: 1}, [])
      expect(res).to eq("?")
    end

    xit "should work with 1 param not in defaults" do
      res = DockerPilot::build_query({all: 1}, [:all])
      expect(res).to eq("?all=1")
    end

    xit "should work with several params" do
      res = DockerPilot::build_query({all: 1, limit: 10, size: false}, [:all, :limit, :size])
      expect(res).to eq("?all=1&limit=10&size=false")
    end
  end

  xit "#query_and_parse" do
    res = DockerPilot.query_and_parse
    expect(res).to be_an_instance_of(Hash)
  end
end
