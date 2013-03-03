require 'test_helper'

class KeystrokesControllerTest < ActionController::TestCase
  setup do
    @keystroke = keystrokes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:keystrokes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create keystroke" do
    assert_difference('Keystroke.count') do
      post :create, keystroke: { keystroke: @keystroke.keystroke, name: @keystroke.name, order: @keystroke.order }
    end

    assert_redirected_to keystroke_path(assigns(:keystroke))
  end

  test "should show keystroke" do
    get :show, id: @keystroke
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @keystroke
    assert_response :success
  end

  test "should update keystroke" do
    put :update, id: @keystroke, keystroke: { keystroke: @keystroke.keystroke, name: @keystroke.name, order: @keystroke.order }
    assert_redirected_to keystroke_path(assigns(:keystroke))
  end

  test "should destroy keystroke" do
    assert_difference('Keystroke.count', -1) do
      delete :destroy, id: @keystroke
    end

    assert_redirected_to keystrokes_path
  end
end
