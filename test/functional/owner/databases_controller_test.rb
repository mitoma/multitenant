require 'test_helper'

class Owner::DatabasesControllerTest < ActionController::TestCase
  setup do
    @owner_database = owner_databases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:owner_databases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create owner_database" do
    assert_difference('Owner::Database.count') do
      post :create, :owner_database => @owner_database.attributes
    end

    assert_redirected_to owner_database_path(assigns(:owner_database))
  end

  test "should show owner_database" do
    get :show, :id => @owner_database.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @owner_database.to_param
    assert_response :success
  end

  test "should update owner_database" do
    put :update, :id => @owner_database.to_param, :owner_database => @owner_database.attributes
    assert_redirected_to owner_database_path(assigns(:owner_database))
  end

  test "should destroy owner_database" do
    assert_difference('Owner::Database.count', -1) do
      delete :destroy, :id => @owner_database.to_param
    end

    assert_redirected_to owner_databases_path
  end
end
