require 'test_helper'

class ThemeLinkersControllerTest < ActionController::TestCase
  setup do
    @theme_linker = theme_linkers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:theme_linkers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create theme_linker" do
    assert_difference('ThemeLinker.count') do
      post :create, theme_linker: { description: @theme_linker.description, theme: @theme_linker.theme }
    end

    assert_redirected_to theme_linker_path(assigns(:theme_linker))
  end

  test "should show theme_linker" do
    get :show, id: @theme_linker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @theme_linker
    assert_response :success
  end

  test "should update theme_linker" do
    patch :update, id: @theme_linker, theme_linker: { description: @theme_linker.description, theme: @theme_linker.theme }
    assert_redirected_to theme_linker_path(assigns(:theme_linker))
  end

  test "should destroy theme_linker" do
    assert_difference('ThemeLinker.count', -1) do
      delete :destroy, id: @theme_linker
    end

    assert_redirected_to theme_linkers_path
  end
end
