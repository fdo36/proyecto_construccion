require 'test_helper'

class CustomAgentsControllerTest < ActionController::TestCase
  setup do
    @custom_agent = custom_agents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:custom_agents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create custom_agent" do
    assert_difference('CustomAgent.count') do
      post :create, custom_agent: { name: @custom_agent.name }
    end

    assert_redirected_to custom_agent_path(assigns(:custom_agent))
  end

  test "should show custom_agent" do
    get :show, id: @custom_agent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @custom_agent
    assert_response :success
  end

  test "should update custom_agent" do
    put :update, id: @custom_agent, custom_agent: { name: @custom_agent.name }
    assert_redirected_to custom_agent_path(assigns(:custom_agent))
  end

  test "should destroy custom_agent" do
    assert_difference('CustomAgent.count', -1) do
      delete :destroy, id: @custom_agent
    end

    assert_redirected_to custom_agents_path
  end
end
