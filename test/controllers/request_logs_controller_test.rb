require 'test_helper'

class RequestLogsControllerTest < ActionController::TestCase
  setup do
    @request_log = request_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:request_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request_log" do
    assert_difference('RequestLog.count') do
      post :create, request_log: { url: @request_log.url }
    end

    assert_redirected_to request_log_path(assigns(:request_log))
  end

  test "should show request_log" do
    get :show, id: @request_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request_log
    assert_response :success
  end

  test "should update request_log" do
    patch :update, id: @request_log, request_log: { url: @request_log.url }
    assert_redirected_to request_log_path(assigns(:request_log))
  end

  test "should destroy request_log" do
    assert_difference('RequestLog.count', -1) do
      delete :destroy, id: @request_log
    end

    assert_redirected_to request_logs_path
  end
end
