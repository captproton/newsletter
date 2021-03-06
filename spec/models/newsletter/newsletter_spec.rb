require 'rails_helper'

module Newsletter
  RSpec.describe Newsletter, type: :model do
    pending "add some examples to (or delete) #{__FILE__}"

    include Capybara::DSL
    before(:each) do
      # company_name ||=  FFaker::Company.name
      design_name  =    "My Design"
      file ||= File.join(gem_root,'..','designs','exports','example-export.yaml')
      @design = Design.import(filename,design_name, FactoryBot.build(:user))
      @newsletter = FactoryBot.create(:newsletter, design: @design, updated_by: FactoryBot.build(:user))
      @newsletter = Newsletter::Newsletter.find(@newsletter.id)
    end

    # we need a real web server running ... easy way to do it js: true
    context "when generating newsletters for emails", js: true do
      before(:each) do
        visit "/newsletters/#{@newsletter.id}/public" 
      end
      pending it "contains its pieces" do
        @newsletter.pieces.each do |piece|
          piece.fields.each do |field|
            expect(@newsletter.generate(:email)).to include(field.get_value(piece)) 
          end
        end
      end

      pending it "doesn't contain javascript" do
        expect(@newsletter.generate(:email)).not_to include('<script>')
      end

      pending it "contains its stylesheet" do
        expect(@newsletter.generate(:email)).to match %r|<style>\s+#{@design.stylesheet_text}\s+</style>|
      end

      pending it "can generate an email_html" do
        email_html = @newsletter.email_html
        expect(email_html.strip).not_to eq ''
        expect(email_html).to eq @newsletter.generate('email') 
      end

  # FIX_ME uncomment expectation
  #     pending it "can generate an email_text, with a header pointing at the newsletter url" do
  #       email_text = @newsletter.email_text
  #       expect(email_text.strip).not_to eq ''
  #       expect(remove_file_links_from_text(email_text)).to eq remove_file_links_from_text(<<EOT)
  # Get the new Newsletter from here: http://newsletter.lvh.me:4447/newsletters/#{@newsletter.id}
  # ------------------------------

  # #{@newsletter.generate_plain_text('email')}
  # EOT
  #     end
    end

    context "regarding headlines" do 
      pending it "returns no pieces if there are none" do
        expect(@newsletter.headlines).to eq []
      end 
      pending it "returns the pieces if there are some" do
        area = @newsletter.areas.detect{|a| a.name.eql?("right_column")}
        element = area.elements.detect{|e| e.name.eql?("Right Column Headline")}
        piece = @newsletter.pieces.create(
          area_id: area.id,
          element_id: element.id,
          field_values_attributes: {
            element.fields.first.id => {
              text: "My Headline"
            }
          }
        )
        expect(@newsletter.headlines).to eq [piece]
      end 
    end

    context "regarding publishing to the archive" do
      pending it "returns false for published? if it has not published_at" do
        expect(@newsletter.published?).to be false
      end
      pending it "returns tru for published? if it has a published_at" do
        @newsletter.publish
        expect(@newsletter.published?).to be true
      end
      pending it "sets published_at when 'publish' called" do
        @newsletter.publish
        expect(@newsletter.published_at).not_to be nil
        expect(@newsletter.published_at.to_i).to be_within(5).of Time.now.to_i
      end
      pending it "has a scope that returns published newsletters" do
        expect(Newsletter::Newsletter.published.count).to eq 0
        @newsletter.publish
        expect(Newsletter::Newsletter.published.count).to eq 1
      end
      pending it "clears published_at when 'unpublish' called" do
        @newsletter.publish
        expect(@newsletter.published_at).not_to be nil
        @newsletter.unpublish
        expect(@newsletter.published_at).to be nil
      end
    end

    pending it "contains its stylesheet for public generation", js: true do
      visit '/newsletters/archive'
      expect(@newsletter.generate(:public)).to \
        match %r|<link.*/newsletters/#{@newsletter.id}/stylesheet.css|
    end

    pending it "returns its stylesheet from the public url: /newsletters/:id/stylesheet.css" do
      visit "/newsletters/#{@newsletter.id}/stylesheet.css"
      expect(page.body.strip).to eq @newsletter.design.stylesheet_text.strip
    end

    pending it "contains its stylesheet for editor generation", js: true do
      visit '/newsletters/archive'
      expect(@newsletter.generate(:editor)).to \
        match %r|<link.*/newsletters/#{@newsletter.id}/stylesheet.css|
    end

    context "regarding its public url" do
       pending it "goes to the default without any mode" do
        expect(@newsletter.public_url).to eq \
          "#{::Newsletter.site_url}/newsletters/#{@newsletter.id}"
      end
      pending it "goes to the editor with the editor mode" do
        expect(@newsletter.public_url('editor')).to eq \
          "#{::Newsletter.site_url}/newsletters/#{@newsletter.id}/editor"
      end
    end

    pending it "can pull an area by name" do
      area = @newsletter.areas.detect{|a| a.name.eql?('left_column')}
      expect(@newsletter.area('left_column')).to eq area
    end

    pending it "doesn't blow up when asking for a bad area name" do
      expect(@newsletter.area('blah')).to eq nil
    end

    pending it "retrieves a set of areas and returns them by names in a hash of symbols" do
      locals = @newsletter.locals
      expect(locals[:left_column]).to eq @newsletter.area('left_column')
      expect(locals[:right_column]).to eq @newsletter.area('right_column')
    end

    pending it "knows its areas(through design)" do
      expect(@newsletter.areas.sort).to eq @design.areas.sort
    end

    protected

    def remove_file_links_from_text(text)
      text.gsub(%r#file://.*$#m,'')
    end
  end
end