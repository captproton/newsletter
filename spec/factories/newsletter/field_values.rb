FactoryBot.define do
  factory :field_value do
    newsletter_piece { nil }
    newsletter_field { nil }
    key { "MyString" }
    value { "MyText" }
    updated_by { 1 }
    deleted_at { "2022-06-25 16:01:11" }
  end
end
