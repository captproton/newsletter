FactoryBot.define do
  factory :field do
    name { "MyString" }
    element { nil }
    label { "MyString" }
    sequence { 1 }
    is_required { false }
    description { "MyString" }
    type { "" }
    updated_by { 1 }
    deleted_at { "2022-06-28 19:50:42" }
  end
end
