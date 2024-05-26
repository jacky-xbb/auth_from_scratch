require 'rails_helper'

RSpec.describe 'Sessions', type: :system do
  it 'allows users to sign in' do
    sign_up
    sign_out
    visit '/'
    click_on :user_login
    fill_in :user_email, with: 'bxb@gmail.com'
    fill_in :user_password, with: 'secret123'
    click_on :login_submit
    expect(page).to have_content('Welcome bxb@gmail.com')
  end
end
