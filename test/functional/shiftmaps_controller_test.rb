require 'test_helper'

class ShiftmapsControllerTest < ActionController::TestCase
  setup do
    @shiftmap = shiftmaps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shiftmaps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shiftmap" do
    assert_difference('Shiftmap.count') do
      post :create, shiftmap: { keystroke: @shiftmap.keystroke, letter: @shiftmap.letter }
    end

    assert_redirected_to shiftmap_path(assigns(:shiftmap))
  end

  test "should show shiftmap" do
    get :show, id: @shiftmap
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shiftmap
    assert_response :success
  end

  test "should update shiftmap" do
    put :update, id: @shiftmap, shiftmap: { keystroke: @shiftmap.keystroke, letter: @shiftmap.letter }
    assert_redirected_to shiftmap_path(assigns(:shiftmap))
  end

  test "should destroy shiftmap" do
    assert_difference('Shiftmap.count', -1) do
      delete :destroy, id: @shiftmap
    end

    assert_redirected_to shiftmaps_path
  end
end
