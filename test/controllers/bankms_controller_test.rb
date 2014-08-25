require 'test_helper'

class BankmsControllerTest < ActionController::TestCase
  setup do
    @bankm = bankms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bankms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bankm" do
    assert_difference('Bankm.count') do
      post :create, bankm: {  }
    end

    assert_redirected_to bankm_path(assigns(:bankm))
  end

  test "should show bankm" do
    get :show, id: @bankm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bankm
    assert_response :success
  end

  test "should update bankm" do
    patch :update, id: @bankm, bankm: {  }
    assert_redirected_to bankm_path(assigns(:bankm))
  end

  test "should destroy bankm" do
    assert_difference('Bankm.count', -1) do
      delete :destroy, id: @bankm
    end

    assert_redirected_to bankms_path
  end
end
