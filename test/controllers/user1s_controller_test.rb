require 'test_helper'

class User1sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user1 = user1s(:one)
  end

  test "should get index" do
    get user1s_url
    assert_response :success
  end

  test "should get new" do
    get new_user1_url
    assert_response :success
  end

  test "should create user1" do
    assert_difference('User1.count') do
      post user1s_url, params: { user1: { email: @user1.email, login: @user1.login, name: @user1.name } }
    end

    assert_redirected_to user1_url(User1.last)
  end

  test "should show user1" do
    get user1_url(@user1)
    assert_response :success
  end

  test "should get edit" do
    get edit_user1_url(@user1)
    assert_response :success
  end

  test "should update user1" do
    patch user1_url(@user1), params: { user1: { email: @user1.email, login: @user1.login, name: @user1.name } }
    assert_redirected_to user1_url(@user1)
  end

  test "should destroy user1" do
    assert_difference('User1.count', -1) do
      delete user1_url(@user1)
    end

    assert_redirected_to user1s_url
  end
end
