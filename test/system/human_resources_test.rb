require "application_system_test_case"

class HumanResourcesTest < ApplicationSystemTestCase
  setup do
    @human_resource = human_resources(:one)
  end

  test "visiting the index" do
    visit human_resources_url
    assert_selector "h1", text: "Human Resources"
  end

  test "creating a Human resource" do
    visit human_resources_url
    click_on "New Human Resource"

    fill_in "Company", with: @human_resource.company_id
    fill_in "Cpf", with: @human_resource.cpf
    fill_in "Description", with: @human_resource.description
    fill_in "Email", with: @human_resource.email
    fill_in "Phone number", with: @human_resource.phone_number
    click_on "Create Human resource"

    assert_text "Human resource was successfully created"
    click_on "Back"
  end

  test "updating a Human resource" do
    visit human_resources_url
    click_on "Edit", match: :first

    fill_in "Company", with: @human_resource.company_id
    fill_in "Cpf", with: @human_resource.cpf
    fill_in "Description", with: @human_resource.description
    fill_in "Email", with: @human_resource.email
    fill_in "Phone number", with: @human_resource.phone_number
    click_on "Update Human resource"

    assert_text "Human resource was successfully updated"
    click_on "Back"
  end

  test "destroying a Human resource" do
    visit human_resources_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Human resource was successfully destroyed"
  end
end
