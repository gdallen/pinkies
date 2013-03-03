require 'test_helper'

class CharmapsControllerTest < ActionController::TestCase
  setup do
    @charmap = charmaps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:charmaps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create charmap" do
    assert_difference('Charmap.count') do
      post :create, charmap: { keystroke: @charmap.keystroke, letter: @charmap.letter }
    end

    assert_redirected_to charmap_path(assigns(:charmap))
  end

  test "should show charmap" do
    get :show, id: @charmap
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @charmap
    assert_response :success
  end

  test "should update charmap" do
    put :update, id: @charmap, charmap: { keystroke: @charmap.keystroke, letter: @charmap.letter }
    assert_redirected_to charmap_path(assigns(:charmap))
  end

  test "should destroy charmap" do
    assert_difference('Charmap.count', -1) do
      delete :destroy, id: @charmap
    end

    assert_redirected_to charmaps_path
  end
end
