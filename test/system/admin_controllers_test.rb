require "application_system_test_case"

class AdminControllersTest < ApplicationSystemTestCase
  setup do
    @admin_controller = admin_controllers(:one)
  end

  test "visiting the index" do
    visit admin_controllers_url
    assert_selector "h1", text: "Admin Controllers"
  end

  test "creating a Admin controller" do
    visit admin_controllers_url
    click_on "New Admin Controller"

    click_on "Create Admin controller"

    assert_text "Admin controller was successfully created"
    click_on "Back"
  end

  test "updating a Admin controller" do
    visit admin_controllers_url
    click_on "Edit", match: :first

    click_on "Update Admin controller"

    assert_text "Admin controller was successfully updated"
    click_on "Back"
  end

  test "destroying a Admin controller" do
    visit admin_controllers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Admin controller was successfully destroyed"
  end
end
