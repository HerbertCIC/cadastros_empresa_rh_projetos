require "test_helper"

class HumanResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @human_resource = human_resources(:one)
  end

  test "should get index" do
    get human_resources_url
    assert_response :success
  end

  test "should get new" do
    get new_human_resource_url
    assert_response :success
  end

  test "should create human_resource" do
    assert_difference('HumanResource.count') do
      post human_resources_url, params: { human_resource: { company_id: @human_resource.company_id, cpf: @human_resource.cpf, description: @human_resource.description, email: @human_resource.email, phone_number: @human_resource.phone_number } }
    end

    assert_redirected_to human_resource_url(HumanResource.last)
  end

  test "should show human_resource" do
    get human_resource_url(@human_resource)
    assert_response :success
  end

  test "should get edit" do
    get edit_human_resource_url(@human_resource)
    assert_response :success
  end

  test "should update human_resource" do
    patch human_resource_url(@human_resource), params: { human_resource: { company_id: @human_resource.company_id, cpf: @human_resource.cpf, description: @human_resource.description, email: @human_resource.email, phone_number: @human_resource.phone_number } }
    assert_redirected_to human_resource_url(@human_resource)
  end

  test "should destroy human_resource" do
    assert_difference('HumanResource.count', -1) do
      delete human_resource_url(@human_resource)
    end

    assert_redirected_to human_resources_url
  end
end
