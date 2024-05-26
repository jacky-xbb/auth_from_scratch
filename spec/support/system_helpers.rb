module SystemHelpers
  def sign_up
    visit '/'
    click_on :user_sign_up
    fill_in :user_email, with: 'bxb@gmail.com'
    fill_in :user_password, with: 'secret123'
    click_on :user_submit
  end

  def sign_out
    click_on :user_sign_out
  end
end
