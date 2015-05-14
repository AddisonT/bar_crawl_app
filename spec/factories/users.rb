require 'ffaker'

FactoryGirl.define do
  factory :user do |f|
    f.name { FFaker::Name.name }
    f.email { FFaker::Internet.email }
    f.password { FFaker::Internet.password }
  end

# FactoryGirl.define do
#   factory :user do |f|
#     f.name { FFaker::HipsterIpsum.name }
#     f.email { FFaker::HipsterIpsum.email }
#     f.password { FFaker::HipsterIpsum.password }
#   end
end
