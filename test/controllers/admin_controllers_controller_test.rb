require 'test_helper'

class AdminControllersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_controller = admin_controllers(:one)
  end

  test "should get index" do
    get admin_controllers_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_controller_url
    assert_response :success
  end

  test "should create admin_controller" do
    assert_difference('AdminController.count') do
      post admin_controllers_url, params: { admin_controller: {  } }
    end

    assert_redirected_to admin_controller_url(AdminController.last)
  end

  test "should show admin_controller" do
    get admin_controller_url(@admin_controller)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_controller_url(@admin_controller)
    assert_response :success
  end

  test "should update admin_controller" do
    patch admin_controller_url(@admin_controller), params: { admin_controller: {  } }
    assert_redirected_to admin_controller_url(@admin_controller)
  end

  test "should destroy admin_controller" do
    assert_difference('AdminController.count', -1) do
      delete admin_controller_url(@admin_controller)
    end

    assert_redirected_to admin_controllers_url
  end
end
