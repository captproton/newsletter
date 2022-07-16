FactoryBot.define do
  factory :user do
    id {FFaker::Number.number(digits: 9) }
    email {FFaker::Internet.email}
    password {FFaker::Internet.password}
    first_name {FFaker::Name.first_name}
    last_name {FFaker::Name.last_name}
    # Add additional fields as required via your User model
  end

  # Not used in this tutorial, but left to show an example of different user types
  # factory :admin do
  #   id {2}
  #   email {"test@admin.com"}
  #   password {"qwerty"}
  #   admin {true}
  # end
end
