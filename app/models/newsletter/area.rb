module Newsletter
  class Area < ApplicationRecord
    belongs_to :design, :class_name => 'Newsletter::Design'
    # FIX_ME this should be has_many through:
    has_many :area_elements
    has_many :elements, -> { order("name")},
              through: :area_elements, 
              :class_name => 'Newsletter::Element'
    # the above should update the commented out below (pre-rails-4)
    # has_and_belongs_to_many :elements, :order => 'name', :join_table => 
    #   "#{::Newsletter.table_prefix}areas_#{::Newsletter.table_prefix}elements",
    #   :class_name => 'Newsletter::Element'
    has_many :pieces, -> { order("sequence")}, class_name: 'Newsletter::Piece'

    belongs_to :updated_by, :class_name => 'User'
  
    # FIX_ME uncomment attr_accessor :_destroy
    # attr_accessor :_destroy

    # FIX_ME uncomment attr_protected :id
    # attr_protected :id
  
    validates_presence_of :name
    #FIXME: make this work with deletable or convert to auditable, and extend it to access destroyed records
    #validates_uniqueness_of :name, :scope => :design_id
  
    # FIX_ME uncomment scopes
    # scope :active, :conditions => {:deleted_at => nil}
    # scope :by_name, lambda {|name| {:conditions => {:name => name}}}

    # FIX_ME uncomment Deleteable
    # include Deleteable
  
    # returns field data so that Newsletter::Design.export(instance) can export itself to a YAML file
    def export_fields
      { :name => name,
        :description => description 
      }
    end

    # builds areas from data pulled out of an exported YAML file by Newsletter::Design.import(class)
    def self.import(design,data)
      area = self.create!(name: data[:name], 
                        description: data[:description],
                        design: design
                        )
    end
  end
end