require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  def setup
    @project = Project.new(
      name: "Hello World",
      slug: "hello-world",
      body: "Bla bla bla bla"
    )
  end

  test "should be valid" do
    assert @project.valid?, "Did not validate with project valid"
  end

  test "should be valid without slug" do
    @project.slug = nil
    assert @project.valid?, "Validated the project without slug"
  end

  test "should be invalid without name" do
    @project.name = nil
    assert @project.invalid?, "Validated the project without name"
  end

  test "should be invalid without body" do
    @project.body = nil
    assert @project.invalid?, "Validated the project without body"
  end

  test "should save" do
    assert_difference("Project.count") do
      assert @project.save, "Did not save with project valid"
    end
  end

  test "should destroy" do
    assert_difference("Project.count", -1) do
      assert projects(:one).destroy, "Did not destroy Project"
    end
  end
end
