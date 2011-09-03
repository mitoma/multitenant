require 'test_helper'

class System::DatabasesControllerTest < ActionController::TestCase
  setup do
    @system_database = system_databases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:system_databases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create system_database" do
    assert_difference('System::Database.count') do
      post :create, :system_database => @system_database.attributes
    end

    assert_redirected_to system_database_path(assigns(:system_database))
  end

  test "should show system_database" do
    get :show, :id => @system_database.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @system_database.to_param
    assert_response :success
  end

  test "should update system_database" do
    put :update, :id => @system_database.to_param, :system_database => @system_database.attributes
    assert_redirected_to system_database_path(assigns(:system_database))
  end

  test "should destroy system_database" do
    assert_difference('System::Database.count', -1) do
      delete :destroy, :id => @system_database.to_param
    end

    assert_redirected_to system_databases_path
  end
end
