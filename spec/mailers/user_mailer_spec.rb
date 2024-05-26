require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'password_reset' do
    let(:user) { User.create!(email: 'to@example.org', password: 'password', reset_token: 'dummy_token') }
    let(:mail) { UserMailer.password_reset(user) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Password reset instructions')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['from@example.com']) # Ensure this matches your actual from address
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Reset password') # Ensure this matches the actual content of your email
    end
  end
end
