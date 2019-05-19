require "application_system_test_case"

class UserAddressesTest < ApplicationSystemTestCase
  setup do
    @user_address = user_addresses(:one)
  end

  test "visiting the index" do
    visit user_addresses_url
    assert_selector "h1", text: "User Addresses"
  end

  test "creating a User address" do
    visit user_addresses_url
    click_on "New User Address"

    fill_in "Alias", with: @user_address.alias
    fill_in "City", with: @user_address.city
    fill_in "Contact", with: @user_address.contact
    fill_in "Country", with: @user_address.country
    fill_in "Door apartment", with: @user_address.door_apartment
    fill_in "Is home", with: @user_address.is_home
    fill_in "Locality", with: @user_address.locality
    fill_in "Name", with: @user_address.name
    fill_in "Pincode", with: @user_address.pincode
    fill_in "State", with: @user_address.state
    fill_in "User", with: @user_address.user_id
    click_on "Create User address"

    assert_text "User address was successfully created"
    click_on "Back"
  end

  test "updating a User address" do
    visit user_addresses_url
    click_on "Edit", match: :first

    fill_in "Alias", with: @user_address.alias
    fill_in "City", with: @user_address.city
    fill_in "Contact", with: @user_address.contact
    fill_in "Country", with: @user_address.country
    fill_in "Door apartment", with: @user_address.door_apartment
    fill_in "Is home", with: @user_address.is_home
    fill_in "Locality", with: @user_address.locality
    fill_in "Name", with: @user_address.name
    fill_in "Pincode", with: @user_address.pincode
    fill_in "State", with: @user_address.state
    fill_in "User", with: @user_address.user_id
    click_on "Update User address"

    assert_text "User address was successfully updated"
    click_on "Back"
  end

  test "destroying a User address" do
    visit user_addresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User address was successfully destroyed"
  end
end
