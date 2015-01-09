require 'test_helper'

class LocationLinkersControllerTest < ActionController::TestCase
  setup do
    @location_linker = location_linkers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:location_linkers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location_linker" do
    assert_difference('LocationLinker.count') do
      post :create, location_linker: { description: @location_linker.description, location: @location_linker.location }
    end

    assert_redirected_to location_linker_path(assigns(:location_linker))
  end

  test "should show location_linker" do
    get :show, id: @location_linker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location_linker
    assert_response :success
  end

  test "should update location_linker" do
    patch :update, id: @location_linker, location_linker: { description: @location_linker.description, location: @location_linker.location }
    assert_redirected_to location_linker_path(assigns(:location_linker))
  end

  test "should destroy location_linker" do
    assert_difference('LocationLinker.count', -1) do
      delete :destroy, id: @location_linker
    end

    assert_redirected_to location_linkers_path
  end
end
