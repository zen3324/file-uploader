# Read about factories at https://github.com/thoughtbot/factory_girl
include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :upload_file do
    # upload_file { fixture_file_upload Rails.root.join('spec', 'factories', 'avatar.png'), 'image/png' }
    name "file_name"
    expiry_date "2015-12-28"
    password "password"
    private_mode false
  end
end
