=begin rdoc
Author::    Chris Hauboldt (mailto:biz@lnstar.com)
Copyright:: 2009 Lone Star Internet Inc.

Newsletter::Designs define a main layout, with areas to group Elements/Pieces.


=end

module Newsletter
  class Design < ApplicationRecord
    # has_many :elements, -> { order("name") }, class_name: 'Newsletter::Element', foreign_key: :newsletter_element_id
    has_many :newsletters, foreign_key: :newsletter_design_id
    belongs_to :updated_by, required: true, class_name: "User"
    #relationships above

    scope :active, -> { where("deleted_at is null") }
    # scopes above

    # validates :name, presence: true, uniqueness: true
    # validations above

    # attr_protected :id
    #FIXME: make this work with deletable or convert to auditable, and extend it to access destroyed records
    #validates_uniqueness_of :name

    # Export a design's data to a YAML file. 
    def export(filename=nil)
      filename = "#{Newsletter.settings.designs_path}/exports/#{name_as_path}-export.yaml" unless filename
      FileUtils.mkdir_p(File.dirname(filename))
      File.open(filename,'w') do |file|
        YAML.dump( {
          :name => name,
          :html_text => html_text,
          :stylesheet_text => stylesheet_text,
          :description => description,
          :areas => areas.collect{|area| area.export_fields}, 
          :elements => elements.collect{|element| element.export_fields},
          :images => base64_encoded_images
        },file)
      end
    end
  
    # Import a design from a YAML file, 
    # Parameters:
    #   filename - path/name of file on filesystem
    #   design_name => rename design if already taken
    def self.import(filename,design_name=nil, current_user)
      raise "You must give a filename to import!" unless filename
      data = YAML.load_file(filename)
      design = nil
      transaction do 
        # begin transaction
        # set design_name from given input
        data[:name] = design_name if design_name
        # create a design with that name
        # use data for model values
        design = Design.create(:name => data[:name], 
          html_text:          data[:html_text],
          description:        data[:description],
          stylesheet_text:    data[:stylesheet_text],
          author:         current_user)
        # create child areas, based on data provided
        # data[:areas].each do |area_data|
        # Area.create!(name: data[:name], 
        #                 description: data[:description],
        #                 design: design
        #                 )
        # end

        # create child elements, based on data provided
        # data[:elements].each do |element_data|
        #   Element.import(design,element_data)
        # end

        # import images, based on data provided
        # design.import_images(data[:images])
        # end of transaction
      end

      raise "Error importing design: #{design.errors.full_messages.join("\n  ")}" unless design.valid?
      design
    end

    # returns path to newsletter design for use in views and is the same for actual file
    def view_path(this_name=nil)
      this_name ||= name
      File.join(base_design_path(this_name),'layout.html.erb')
    end
  
    # returns the path to the base of the design's files
    def base_design_path(this_name=nil)
      this_name ||= name
      ndp = 
      File.join(::Newsletter::Design.designs_path,'designs',name_as_path(this_name))
    end

    # returns the image filenames inside a design
    def images
      Dir.glob(File.join(images_path,'*.*')).map{|f| File.basename(f)} || []
    rescue => e
      []
    end

    # returns the images as an array of base64 encoded strings
    def base64_encoded_images
      images.map {|image| {
        name: image,
        data: Base64.encode64(File.binread(File.join(images_path,image)))
      }}
    end

    # returns where a design's images should go, can override for 'old_name'
    def images_path(the_name=nil)
      the_name ||= name
      File.join('public','images',name_as_path(the_name)) 
    end

    # move a design's images on name change
    def move_images(old_name=nil, new_name=nil)
      old_name ||= @old_name
      name ||= new_name
      return unless old_name && old_name != name
      FileUtils.mv(images_path(old_name),images_path)
    end

    # imports images from array of base64 encoded images
    def import_images(image_imports)
      image_imports ||= []
      FileUtils.mkdir_p(images_path)
      image_imports.each do |image|
        File.binwrite(File.join(images_path,image[:name]),
          Base64.decode64(image[:data])
        )
      end
    end

    def html_text
      return @html_text if @html_text.present?
      @html_text = read_design
    end
  
    def html_text=(text)
       @html_text = text
    end
  
    def name=(new_name)
      return if self[:name].eql?(new_name)
      @old_name = self[:name] unless @old_name
      self[:name] = new_name
    end
  
    # def save(*args)
    #   transaction do 
    #     move_design_on_name_change
    #     write_design
    #     super
    #   end
    # end  
  
    # returns a version of name that is nice for filesytem use
    def name_as_path(this_name=nil)
      this_name = name unless this_name
      this_name.gsub(/[^a-zA-Z0-9-]/,'_')
    end
    # FIX_ME turn Deletable back on
    # include Deleteable

    def self.designs_path
      Rails.application.config_for(:newsletter).designs_path
    end
        
    protected
    def read_design
      File.readlines(view_path).join
    rescue => e
      #flash[:warning] << "Couldn't open design for element '#{name}' which should exist at: #{file_path} #{e.message}"
      ""
    end

    def write_all_designs
      areas.collect{|area| area.elements}.flatten.uniq.each{|element| element.send(:write_design)}
      write_design
    end
  
    def move_design_on_name_change
      return unless @old_name and File.exists?(view_path(@old_name))
      FileUtils.mv(base_design_path(@old_name),base_design_path)
      move_images(@old_name, name)
    end

    def write_design
      FileUtils.mkdir_p(File.dirname(view_path)) unless File.exists?(File.dirname(view_path))
      File.open(view_path,File::WRONLY|File::TRUNC|File::CREAT) do |file|
        file.write html_text
      end
    end

    # methods above
  end
end
