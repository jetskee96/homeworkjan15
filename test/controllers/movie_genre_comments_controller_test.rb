require 'test_helper'

class MovieGenreCommentsControllerTest < ActionController::TestCase
  setup do
    @movie_genre_comment = movie_genre_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movie_genre_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movie_genre_comment" do
    assert_difference('MovieGenreComment.count') do
      post :create, movie_genre_comment: { description: @movie_genre_comment.description, title: @movie_genre_comment.title }
    end

    assert_redirected_to movie_genre_comment_path(assigns(:movie_genre_comment))
  end

  test "should show movie_genre_comment" do
    get :show, id: @movie_genre_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movie_genre_comment
    assert_response :success
  end

  test "should update movie_genre_comment" do
    patch :update, id: @movie_genre_comment, movie_genre_comment: { description: @movie_genre_comment.description, title: @movie_genre_comment.title }
    assert_redirected_to movie_genre_comment_path(assigns(:movie_genre_comment))
  end

  test "should destroy movie_genre_comment" do
    assert_difference('MovieGenreComment.count', -1) do
      delete :destroy, id: @movie_genre_comment
    end

    assert_redirected_to movie_genre_comments_path
  end
end
