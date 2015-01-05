require 'test_helper'

class CommonLinkersControllerTest < ActionController::TestCase
  setup do
    @common_linker = common_linkers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:common_linkers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create common_linker" do
    assert_difference('CommonLinker.count') do
      post :create, common_linker: { cliche: @common_linker.cliche, description: @common_linker.description }
    end

    assert_redirected_to common_linker_path(assigns(:common_linker))
  end

  test "should show common_linker" do
    get :show, id: @common_linker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @common_linker
    assert_response :success
  end

  test "should update common_linker" do
    patch :update, id: @common_linker, common_linker: { cliche: @common_linker.cliche, description: @common_linker.description }
    assert_redirected_to common_linker_path(assigns(:common_linker))
  end

  test "should destroy common_linker" do
    assert_difference('CommonLinker.count', -1) do
      delete :destroy, id: @common_linker
    end

    assert_redirected_to common_linkers_path
  end
end
