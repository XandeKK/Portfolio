require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_path
    assert_response :success
    assert_select "h2", "Admin login"
  end

  test "should login" do
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

  test "should not login without email" do
    post login_path, params: { 
      session: {
        email: "",
        password: "vrauu"
      }
    }
    assert_response :unauthorized
  end
end
