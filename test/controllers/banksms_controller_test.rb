require 'test_helper'

class BanksmsControllerTest < ActionController::TestCase
  setup do
    @banksm = banksms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:banksms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create banksm" do
    assert_difference('Banksm.count') do
      post :create, banksm: {  }
    end

    assert_redirected_to banksm_path(assigns(:banksm))
  end

  test "should show banksm" do
    get :show, id: @banksm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @banksm
    assert_response :success
  end

  test "should update banksm" do
    patch :update, id: @banksm, banksm: {  }
    assert_redirected_to banksm_path(assigns(:banksm))
  end

  test "should destroy banksm" do
    assert_difference('Banksm.count', -1) do
      delete :destroy, id: @banksm
    end

    assert_redirected_to banksms_path
  end
end
