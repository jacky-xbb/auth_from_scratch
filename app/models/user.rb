class User < ApplicationRecord
  has_secure_password

  def create_reset_digest
    self.reset_token = SecureRandom.urlsafe_base64
    update_columns(reset_token:, reset_sent_at: Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at.present? && reset_sent_at < 2.hours.ago
  end
end
