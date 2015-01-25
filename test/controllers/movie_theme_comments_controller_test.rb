require 'test_helper'

class MovieThemeCommentsControllerTest < ActionController::TestCase
  setup do
    @movie_theme_comment = movie_theme_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movie_theme_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movie_theme_comment" do
    assert_difference('MovieThemeComment.count') do
      post :create, movie_theme_comment: { description: @movie_theme_comment.description, title: @movie_theme_comment.title }
    end

    assert_redirected_to movie_theme_comment_path(assigns(:movie_theme_comment))
  end

  test "should show movie_theme_comment" do
    get :show, id: @movie_theme_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movie_theme_comment
    assert_response :success
  end

  test "should update movie_theme_comment" do
    patch :update, id: @movie_theme_comment, movie_theme_comment: { description: @movie_theme_comment.description, title: @movie_theme_comment.title }
    assert_redirected_to movie_theme_comment_path(assigns(:movie_theme_comment))
  end

  test "should destroy movie_theme_comment" do
    assert_difference('MovieThemeComment.count', -1) do
      delete :destroy, id: @movie_theme_comment
    end

    assert_redirected_to movie_theme_comments_path
  end
end
