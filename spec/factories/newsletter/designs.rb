def import_design(file=nil, name=nil)
  name ||= Faker::Company.bs.split(/\s+/).each(&:capitalize).join(' ')
  file ||= File.join(Newsletter::PLUGIN_ROOT,'designs','exports','example-export.yaml')
  design = Newsletter::Design.import(file,name)
  design.update_attribute(:stylesheet_text, ".blah{background-color: red}")
  design
end

FactoryBot.define do
  factory :design, class: Newsletter::Design do
    
  end
end
