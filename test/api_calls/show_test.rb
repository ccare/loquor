require File.expand_path('../../test_helper', __FILE__)

module Loquor
  class ApiCall::ShowTest < Minitest::Test

    class NormalResource < Resource
      self.path = '/normal'
    end

    class CachedResource < Resource
      self.path = '/cached'
      self.cache = true      
    end

    def test_request_correct_path
      show = ApiCall::Show.new(NormalResource, 42)
      Loquor.expects(:get).with('/normal/42').returns({}.to_json)
      show.execute
    end
    
    def test_request_correct_path_for_cachable_resources
      show = ApiCall::Show.new(CachedResource, 42)
      Loquor.expects(:get).with('/cached/42', cache=true).returns({}.to_json)
      show.execute
    end

    def test_response_is_a_representation
      show = ApiCall::Show.new(Resource, 1)
      Loquor.stubs(get: {foo: 'bar'}.to_json)
      response = show.execute
      assert response.is_a?(Resource)
    end
  end
end
