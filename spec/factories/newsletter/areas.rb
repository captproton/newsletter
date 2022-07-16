FactoryBot.define do
  factory :area, class: 'Newsletter::Area' do
    name { "MyString" }
    description { "MyString" }
    design { nil }
    updated_by { FactoryBot.create(:user) }
    delelted_at { "2022-06-24 19:12:15" }
  end
end
