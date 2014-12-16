# P9 Controller Testing in RSpec

##Learning Competencies 
* Write RSpec tests around a working application.
* Familiarity with the Rack::Test library.
* Testing complex controller actions that are dependent on paramaters and session values.
* Managing test dependencies and isolation.

##Summary

For this challenge, you'll be writing tests around a half-constructed application. There are ten pending RSpec tests in the `/spec/controllers/` folder – your task is to write valid tests for each. 

##Releases

### Release 1: Gadgets

Complete all the tests in `/spec/controllers/gadgets_spec.rb`. You will need to use the [Rack::Test](http://www.sinatrarb.com/testing.html) library and [basic RSpec](https://github.com/rspec/rspec-expectations) to do so. Make sure your tests are valid (aka, that their assertions match their descriptions) and that they can run independent of each other.

### Release 2: Widgets

Complete all the tests in `/spec/controllers/widgets_spec.rb`. The route there is dependent on sessions, which will cause your tests to break. But that's okay! You can simply fake a user's session using Rack::Test, as the `get` and `post` methods take an optional third argument which correspond to the rack environment hash, where information about the client's session is stored. It would look something like this:

```ruby
it "should create a new post" do
  fake_params = { foo: "some foo", bar: "some bar" }
  fake_session = { 'rack.session' => { baz: 20 } }
  expect{
    post '/some_route', fake_params, fake_session
  }.to change{ Post.count }.by(1)
end
```

You may also choose to write this test [using a stub](https://github.com/rspec/rspec-mocks).
