require File.expand_path('../test_helper', __FILE__)

module Loquor
  class PostsTest < Minitest::Test
    def test_post_should_call_new
      url = "foobar"
      payload = {y: false}
      deps = {x: true}
      Posts.expects(:new).with(url, payload, deps).returns(mock(post: nil))
      Posts.post(url, payload, deps)
    end

    def test_post_should_call_post
      Posts.any_instance.expects(:post)
      Posts.post("foobar", {}, {})
    end

    def test_post_parses_request
      output = {'foo' => 'bar'}
      json = output.to_json
      posts = Posts.new("", {}, {})
      posts.expects(signed_request: mock(execute: json))
      assert_equal output, posts.post
    end

    def test_request_is_generated_correctly
      url = "/foobar"
      payload = {foo: true, bar: false}
      endpoint = "http://thefoobar.com"
      config = mock(endpoint: endpoint)
      full_url = "#{endpoint}#{url}"
      deps = {config: config}

      RestClient::Request.expects(:new).with(
        url: full_url,
        accept: :json,
        payload: payload.to_json,
        headers: {'Content-type' => 'application/json'},
        method: :post
      )
      Posts.new(url, payload, deps).send(:request)
    end

    def test_request_is_signed_correctly
      access_id = "foobar1"
      secret_key = "foobar2"
      config = mock(access_id: access_id, secret_key: secret_key)
      deps = {config: config}

      posts = Posts.new("", {}, deps)
      request = RestClient::Request.new(url: "http://localhost:3000", method: :post)
      posts.expects(request: request)
      ApiAuth.expects(:sign!).with(request, access_id, secret_key)
      posts.send(:signed_request)
    end

  end
end

