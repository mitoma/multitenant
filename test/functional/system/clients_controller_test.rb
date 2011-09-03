require 'test_helper'

class System::ClientsControllerTest < ActionController::TestCase
  setup do
    @system_client = system_clients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:system_clients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create system_client" do
    assert_difference('System::Client.count') do
      post :create, :system_client => @system_client.attributes
    end

    assert_redirected_to system_client_path(assigns(:system_client))
  end

  test "should show system_client" do
    get :show, :id => @system_client.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @system_client.to_param
    assert_response :success
  end

  test "should update system_client" do
    put :update, :id => @system_client.to_param, :system_client => @system_client.attributes
    assert_redirected_to system_client_path(assigns(:system_client))
  end

  test "should destroy system_client" do
    assert_difference('System::Client.count', -1) do
      delete :destroy, :id => @system_client.to_param
    end

    assert_redirected_to system_clients_path
  end
end
