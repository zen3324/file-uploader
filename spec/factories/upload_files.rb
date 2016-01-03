# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :upload_file do
    name "file_name"
    expiry_date "2015-12-28"
    password "password"
    private_mode false
  end
end
