# Read about factories at https://github.com/thoughtbot/factory_bot
def import_design(file=nil, name=nil)
  name ||= FFaker::Company.name
  file ||= File.join(Newsletter::PLUGIN_ROOT,'designs','exports','example-export.yaml')
  design = Newsletter::Design.import(file,name)
  design.update_attribute(:stylesheet_text, ".blah{background-color: red}")
  design
end

FactoryBot.define do
  factory :design, class: Newsletter::Design do
    name { "My Design" }
    
  # name: string
  # description: string
  # html_design: text
  # updated_by: integer
  # stysheet_text: text
  end
end
