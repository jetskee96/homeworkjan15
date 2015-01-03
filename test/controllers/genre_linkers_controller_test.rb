require 'test_helper'

class GenreLinkersControllerTest < ActionController::TestCase
  setup do
    @genre_linker = genre_linkers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:genre_linkers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create genre_linker" do
    assert_difference('GenreLinker.count') do
      post :create, genre_linker: { description: @genre_linker.description, genre: @genre_linker.genre }
    end

    assert_redirected_to genre_linker_path(assigns(:genre_linker))
  end

  test "should show genre_linker" do
    get :show, id: @genre_linker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @genre_linker
    assert_response :success
  end

  test "should update genre_linker" do
    patch :update, id: @genre_linker, genre_linker: { description: @genre_linker.description, genre: @genre_linker.genre }
    assert_redirected_to genre_linker_path(assigns(:genre_linker))
  end

  test "should destroy genre_linker" do
    assert_difference('GenreLinker.count', -1) do
      delete :destroy, id: @genre_linker
    end

    assert_redirected_to genre_linkers_path
  end
end
