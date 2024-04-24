require 'rails_helper'

RSpec.describe 'Registrations', type: :system do
  it 'allow users to sign up' do
    visit '/'
    click_on 'user-sign-up'
    fill_in 'user-email', with: 'bxb@gmail.com'
    fill_in 'user-password', with: 'secret123'
    click_on 'user-submit'
    expect(page).to have_content('Welcome bxb@gmail.com')
  end
end
