module Newsletter
  class ElementsController < ::Newsletter::ApplicationController
    before_action :authenticate_user!
    before_action :find_element, :except => [:new,:create,:index]
    before_action :find_design
    before_action :find_fields, :except => [:new,:create,:index]
    before_action :find_field_types, :only => [:new,:create,:edit,:update]
    
    # include DeleteableActions  

    def index
      @elements = @design.elements#.by_design(@design).paginate(:page => params[:page])
    end

    def new
      @element = @design.elements.build
      @fields = [Field.new]
    end

    def edit
    end

    def create
      @element            = @design.elements.build(element_params)
      @element.updated_by = current_user

      respond_to do |format|
        if @element.save  
          format.html { redirect_to design_elements_path(@design), notice: 'Design element was successfully created.' }
          # format.json { render :show, status: :created, location: @element }
        else
          format.html { render :new, status: :unprocessable_entity }
          # format.json { render json: @element.errors, status: :unprocessable_entity }
        end
      end      
    end
    
    def update
      respond_to do |format|
        if @element.update_attributes(params[:element])
          flash[:notice] = 'Element was successfully updated.'
          format.html { redirect_to(design_elements_path(@design)) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @element.errors, :status => :unprocessable_entity }
        end
      end
    end

    def destroy
      @element.destroy
      redirect_to(design_elements_path(@design))
    end
  
    protected
    def find_element
      @element ||= Element.find_by(id: params[:id])
    end
  
    def find_design
      return @design ||= @element.design if @element && @element.design.present?
      @design ||= Design.find_by(id: params[:design_id])
    end
  
    def find_fields
      return @fields ||= @element.fields if @element && @element.fields.present?
      @fields ||= [Field.new]
    end
  
    def find_field_types
      @field_types ||= Field.valid_types
    end

    private
    # Never trust parameters from the scary internet, only allow the white list through.
    def element_params
      params.require(:element).permit(:name, :description, :html_design, :deleted_at, :design_id)
    end

  end
end
