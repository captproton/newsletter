require 'rails_helper'

module Newsletter
  RSpec.describe Design, type: :model do
    # pending "add some examples to (or delete) #{__FILE__}"
    before(:each) do 
      FileUtils.rm_rf(File.join(Rails.root, 'public', 'images', 'My_Design'))
      design_name  =    "My Design"
      filename ||= File.join(Engine.plugin_root_path,'designs','exports','example-export.yaml')
      # p "********************************"
      # p "file: #{file}"
      # p "********************************"
      @design = Design.import(filename,design_name, FactoryBot.build(:user))
      @design.update_attribute(:stylesheet_text, ".blah{background-color: red}")
    end

    it "sets the name correctly" do
      # passed 7/8/22
      expect(@design.name).to eq("My Design")
    end

    it "sets the stylesheet_text correctly" do
      # PASSED: 7/8/22
      expect(@design.stylesheet_text).to eq(".blah{background-color: red}")
    end

    context "when name changed/moved" do
      pending "waiting on image processor"
### this context is messed up rigth now with original_design and fresh_design
      let(:original_design) do
        original_design = @design
      end

      let(:old_images_path) do
        original_design.images_path
      end

      let(:old_name) do
        original_design.name
      end

      let(:new_name) do
        original_design.name + " NEW!"
      end

      let(:design_with_name_change) do
        fresh_design = @design
        fresh_design.update(name: new_name)        
      end
      it "should have the @design images_path include the design name in path" do
        expect(original_design.images_path).to include("public/images/#{@design.name_as_path(@design.name)}")
      end

      it "should have the existing design image path" do
        expect(File.exist?(original_design.images_path)).to be true        
      end

      it "changing the name should not raise an error" do
        # update_attributes deprecated in favor of def update
        # https://blog.saeloun.com/2019/04/15/rails-6-deprecates-update-attributes.html
        expect{@design.update(name: new_name)}.not_to raise_error
        expect(@design.name).to eq new_name        
      end
            
      it "moves its images" do
        pending "this is OK for now, and it will be irrelevant once switched to active_storage"
        old_images_path = @design.images_path
        old_name = @design.name
        expect(@design.images_path).to include("public/images/#{@design.name_as_path(@design.name)}")
        expect(File.exist?(@design.images_path)).to be true
        new_name = @design.name + " NEW!"

        # remove old designs
        FileUtils.rm_rf(File.join(Rails.application.config_for(:newsletter).designs_path,'designs',
          'My_Design_NEW_'))
        # remove old images
        FileUtils.rm_rf(File.join(Rails.root, 'public', 'images', 
          'My_Design_NEW_'))
        expect{@design.update(name: new_name)}.not_to raise_error
        expect(@design.name).to eq new_name
        expect(@design.images_path).to include("public/images/#{@design.name_as_path(new_name)}")
        # fails to rename the image
        expect(File.exist?(old_images_path)).to be false
        expect(File.exist?(@design.images_path)).to be true
      end
    end

    context "has an associated stylesheet" do
      # PASSED: 6/29/22
      it "that is accessible" do
        expect{@design.stylesheet_text}.not_to raise_error
      end
    end

    context "whether it exports and imports correctly" do
      # PASSED: 7/8/22
      let(:reimported_design) do
        reimported_design = nil
        Tempfile.open(["design", ".yml"], 'tmp') do |design_file|
          design_file.close
          @design.export(design_file.path)
          reimported_design = Design.import(design_file.path, 
            "My Re-Imported Design",  
            @design.updated_by
          )
        end
      end

      # it "doesn't blow up" do
      #   # refactoring peek
      #   expect(reimported_design).to eq "something"
      # end

      it "has the same elements" do
        expect(reimported_design.elements.pluck(:name).sort).to eq @design.
          elements.pluck(:name).sort
      end
      it "knows its images" do
        expect(reimported_design.images).to include("newsletter_header.png")
      end
      it "knows its stylesheet" do
        expect(reimported_design.stylesheet_text).to eq @design.stylesheet_text
      end
      
    end
    
  end
end
