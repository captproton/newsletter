# Read about factories at https://github.com/thoughtbot/factory_bot
class DesignFactory
  def self.import_design(file=nil, name=nil)
    name ||= FFaker::Company.name
    file ||= File.join(Newsletter::Engine.plugin_root_path,'designs','exports','example-export.yaml')
    design = Newsletter::Design.import(file,name)
    design.update_attribute(:stylesheet_text, ".blah{background-color: red}")
    design
  end
end

FactoryBot.define do
  file ||= File.join(Newsletter::Engine.plugin_root_path,'designs','exports','example-export.yaml')

  factory :design, class: Newsletter::Design do
    name { "My Design" }
    
  # name: string
  # description: string
  # html_design: text
  # updated_by: integer
  # stysheet_text: text
    name {FFaker::Number.number(digits: 9) }
    description {FFaker::Internet.email}
    html_design {FFaker::Internet.password}
    updated_by_ {FFaker::Name.first_name}
    stysheet_text {FFaker::Name.last_name}
    # Add additional fields as required via your User model
  end

end
