require 'test_helper'

class MovieThemesControllerTest < ActionController::TestCase
  setup do
    @movie_theme = movie_themes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movie_themes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movie_theme" do
    assert_difference('MovieTheme.count') do
      post :create, movie_theme: { description: @movie_theme.description, title: @movie_theme.title }
    end

    assert_redirected_to movie_theme_path(assigns(:movie_theme))
  end

  test "should show movie_theme" do
    get :show, id: @movie_theme
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movie_theme
    assert_response :success
  end

  test "should update movie_theme" do
    patch :update, id: @movie_theme, movie_theme: { description: @movie_theme.description, title: @movie_theme.title }
    assert_redirected_to movie_theme_path(assigns(:movie_theme))
  end

  test "should destroy movie_theme" do
    assert_difference('MovieTheme.count', -1) do
      delete :destroy, id: @movie_theme
    end

    assert_redirected_to movie_themes_path
  end
end
