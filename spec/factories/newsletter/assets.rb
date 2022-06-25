FactoryBot.define do
  factory :asset do
    newsletter_field { nil }
    newsletter_piece { nil }
    image { "MyString" }
    content_type { "MyString" }
    size { 1 }
    width { 1 }
    parent_id { 1 }
    thumbnail { "MyString" }
    updated_by { 1 }
    deleted_at { "2022-06-25 15:42:15" }
  end
end
