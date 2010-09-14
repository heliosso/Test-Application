require 'test_helper'

class TaskStatusesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_status" do
    assert_difference('TaskStatus.count') do
      post :create, :task_status => { }
    end

    assert_redirected_to task_status_path(assigns(:task_status))
  end

  test "should show task_status" do
    get :show, :id => task_statuses(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => task_statuses(:one).to_param
    assert_response :success
  end

  test "should update task_status" do
    put :update, :id => task_statuses(:one).to_param, :task_status => { }
    assert_redirected_to task_status_path(assigns(:task_status))
  end

  test "should destroy task_status" do
    assert_difference('TaskStatus.count', -1) do
      delete :destroy, :id => task_statuses(:one).to_param
    end

    assert_redirected_to task_statuses_path
  end
end
