FactoryBot.define do
  factory :element do
    name { "MyString" }
    description { "MyString" }
    html_design { "MyText" }
    design { nil }
    updated_by { 1 }
    deleted_at { "2022-06-24 18:51:45" }
  end
end
