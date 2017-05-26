require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
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

  # test "should create new post" do
  #
  # end

  test "should show post" do
    get post_path(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_path(@post)
    assert_response :success
    assert_select "title", "Edit | #{@base_title}"
  end

  test "should update post" do
    patch post_url(@post), params: { post: { caption: @post.caption } }
    assert_redirected_to post_url(@post)
  end

  test "should delete post" do
    assert_difference('Post.count', -1) do
      delete post_path(@post)
    end

    assert_redirected_to root_path
  end
end
