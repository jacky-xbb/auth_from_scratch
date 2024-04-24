module SystemHelpers
  def sign_up
    visit '/'
    click_on 'user-sign-up'
    fill_in 'user-email', with: 'bxb@gmail.com'
    fill_in 'user-password', with: 'secret123'
    click_on 'user-submit'
  end

  def sign_out
    click_on 'user-sign-out'
  end
end
