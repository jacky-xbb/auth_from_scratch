FactoryBot.define do
  factory :user do
    email { 'user@example.org' }
    password { 'oldpassword' }
    # other attributes like password, name, etc.
  end
end
