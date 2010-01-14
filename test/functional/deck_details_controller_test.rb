require 'test_helper'

class DeckDetailsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deck_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deck_detail" do
    assert_difference('DeckDetail.count') do
      post :create, :deck_detail => { }
    end

    assert_redirected_to deck_detail_path(assigns(:deck_detail))
  end

  test "should show deck_detail" do
    get :show, :id => deck_details(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => deck_details(:one).to_param
    assert_response :success
  end

  test "should update deck_detail" do
    put :update, :id => deck_details(:one).to_param, :deck_detail => { }
    assert_redirected_to deck_detail_path(assigns(:deck_detail))
  end

  test "should destroy deck_detail" do
    assert_difference('DeckDetail.count', -1) do
      delete :destroy, :id => deck_details(:one).to_param
    end

    assert_redirected_to deck_details_path
  end
end
