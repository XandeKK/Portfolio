require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  def project
    projects(:one)
  end

  test "should get show" do
    sign_up

    get project_path(project)
    assert_response :success
    assert_select "h1", project.name
  end

  test "should get new" do
    sign_up

    get new_project_path
    assert_response :success
    assert_select "h2", "New Project"
  end

  test "should create project" do
    sign_up

    assert_difference("Project.count") do
      post projects_path, params: {
        project: {
          name: "Pokemon",
          body: "pichu"
        }
      }
    end
    assert_response :redirect
    follow_redirect!
    assert_select "h1", "Pokemon"
  end

  test "should not create project without name" do
    sign_up

    assert_no_difference("Project.count") do
      post projects_path, params: {
        project: {
          name: nil,
          body: "pichu"
        }
      }
    end
  end

  test "should not create project without body" do
    sign_up

    assert_no_difference("Project.count") do
      post projects_path, params: {
        project: {
          name: "pokemon",
          body: nil
        }
      }
    end
  end

  test "should get edit" do
    sign_up

    get edit_project_path(project)
    assert_response :success
    assert_select "input#project_name[value=?]", project.name
  end

  test "should not get edit project without sign up" do
    get edit_project_path(project)
    assert_response :redirect
    follow_redirect!
    assert_select "h1", "Projetos"
  end

  test "should update project" do
    sign_up

    put project_path(project), params: {
      project: {
        name: "Bye world",
        body: "end"
      }
    }

    assert_response :redirect
    follow_redirect!
    assert_select "h1", "Bye world"
  end

  test "should not update project without name" do
    sign_up

    put project_path(project), params: {
      project: {
        name: nil,
        body: "end"
      }
    }

    assert_response :unprocessable_entity
  end

  test "should not update project without sign up" do
    put project_path(project), params: {
      project: {
        name: "Bye world",
        body: "end"
      }
    }

    assert_response :redirect
    follow_redirect!
    assert_select "h1", "Projetos"
  end

  test "should destroy project" do
    sign_up

    assert_difference("Project.count", -1) do
      delete project_path(project)
    end

    assert_response :redirect
    follow_redirect!
    assert_select "h1", "Projetos"
  end

  test "should destroy project without sign up" do
    assert_no_difference("Project.count") do
      delete project_path(project)
    end

    assert_response :redirect
    follow_redirect!
    assert_select "h1", "Projetos"
  end
end
