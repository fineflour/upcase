require "rails_helper"

feature "Account Settings" do
  scenario "user views subscription" do
    user = create(:subscriber)

    visit edit_my_account_path(as: user)

    expect_to_see_my_subscription
  end

  scenario "user edits account information" do
    user = create(:user, name: "Test User")

    visit edit_my_account_path(as: user)

    fill_in "Name", with: "Change Name"
    click_button "Update account"

    expect(page).to have_content I18n.t('users.flashes.update.success')

    visit edit_my_account_path(as: user)

    expect(field_labeled("Name").value).to eq "Change Name"
  end

  scenario "user edits address information" do
    user = create(:user, name: "Test User")

    visit edit_my_account_path(as: user)

    fill_in "Address 1", with: "New Address"
    click_button "Update address"

    expect(page).to have_content I18n.t('users.flashes.update.success')

    visit edit_my_account_path(as: user)

    expect(field_labeled("Address 1").value).to eq "New Address"
  end

  private

  def expect_to_see_my_subscription
    expect(page).to have_css("ol.subscription li")
  end
end
