ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def sign_up
    user = users(:one)
    post login_path, params: { 
      session: {
        email: user.email,
        password: "vrauu"
      }
    }
    assert_response :redirect
    follow_redirect!
    assert_select "h1", "Projetos"
  end
end
