# Read about factories at https://github.com/thoughtbot/factory_bot
FactoryBot.define do
  factory :design, class: Newsletter::Design do
    
  # name: string
  # description: string
  # html_design: text
  # updated_by: integer
  # stysheet_text: text
    name {FFaker::Number.number(digits: 9) }
    description {FFaker::Name.last_name}
    html_design {FFaker::Internet.password}
    updated_by { FactoryBot.create(:user) }
    stylesheet_text {FFaker::Name.last_name}
    # Add additional fields as required via your User model
  end

end
