require 'test_helper'

class Owner::ClientsControllerTest < ActionController::TestCase
  setup do
    @owner_client = owner_clients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:owner_clients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create owner_client" do
    assert_difference('Owner::Client.count') do
      post :create, :owner_client => @owner_client.attributes
    end

    assert_redirected_to owner_client_path(assigns(:owner_client))
  end

  test "should show owner_client" do
    get :show, :id => @owner_client.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @owner_client.to_param
    assert_response :success
  end

  test "should update owner_client" do
    put :update, :id => @owner_client.to_param, :owner_client => @owner_client.attributes
    assert_redirected_to owner_client_path(assigns(:owner_client))
  end

  test "should destroy owner_client" do
    assert_difference('Owner::Client.count', -1) do
      delete :destroy, :id => @owner_client.to_param
    end

    assert_redirected_to owner_clients_path
  end
end
