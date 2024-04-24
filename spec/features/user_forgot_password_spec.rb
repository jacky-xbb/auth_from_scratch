require 'rails_helper'

RSpec.describe 'User forgot password', type: :feature do
  let(:user) { create(:user) }

  scenario 'User resets password and logs in with new password' do
    visit new_password_reset_path

    fill_in :user_email, with: user.email
    click_button :reset_password_submit

    open_email(user.email)

    mail_body = current_email.body.encoded
    reset_url_match = mail_body.match(/href="(?<url>[^"]+)"/)
    reset_url = reset_url_match[:url]

    visit reset_url

    fill_in :password, with: 'newpassword'
    click_button :update_password_submit

    visit sign_in_path
    fill_in :email, with: user.email
    fill_in :password, with: 'newpassword'
    click_button :login_submit

    expect(page).to have_content("Welcome #{user.email}")
  end
end
