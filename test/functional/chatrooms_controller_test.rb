require 'test_helper'

class ChatroomsControllerTest < ActionController::TestCase
  setup do
    @chatroom = chatrooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chatrooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chatroom" do
    assert_difference('Chatroom.count') do
      post :create, chatroom: { lat: @chatroom.lat, long: @chatroom.long, number: @chatroom.number }
    end

    assert_redirected_to chatroom_path(assigns(:chatroom))
  end

  test "should show chatroom" do
    get :show, id: @chatroom
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chatroom
    assert_response :success
  end

  test "should update chatroom" do
    put :update, id: @chatroom, chatroom: { lat: @chatroom.lat, long: @chatroom.long, number: @chatroom.number }
    assert_redirected_to chatroom_path(assigns(:chatroom))
  end

  test "should destroy chatroom" do
    assert_difference('Chatroom.count', -1) do
      delete :destroy, id: @chatroom
    end

    assert_redirected_to chatrooms_path
  end
end
