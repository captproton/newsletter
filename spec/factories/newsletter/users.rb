FactoryBot.define do
  factory :user do
    first_name { "MyFirstName" }
    last_name { "MyLastName" }
    email { "MyString@mystring.com" }
    phone { "555-555-1212" }
  end
end
