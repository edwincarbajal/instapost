require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Instagram Clone"
  end

  test "should get root" do
    get root_url
    assert_response :success
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get new" do
    get new_post_path
    assert_response :success
  end
end
