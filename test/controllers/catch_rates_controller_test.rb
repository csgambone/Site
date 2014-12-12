require 'test_helper'

class CatchRatesControllerTest < ActionController::TestCase
  setup do
    @catch_rate = catch_rates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:catch_rates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create catch_rate" do
    assert_difference('CatchRate.count') do
      post :create, catch_rate: {  }
    end

    assert_redirected_to catch_rate_path(assigns(:catch_rate))
  end

  test "should show catch_rate" do
    get :show, id: @catch_rate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @catch_rate
    assert_response :success
  end

  test "should update catch_rate" do
    patch :update, id: @catch_rate, catch_rate: {  }
    assert_redirected_to catch_rate_path(assigns(:catch_rate))
  end

  test "should destroy catch_rate" do
    assert_difference('CatchRate.count', -1) do
      delete :destroy, id: @catch_rate
    end

    assert_redirected_to catch_rates_path
  end
end
