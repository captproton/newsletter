require "deleteable"

module Newsletter
  class DesignsController < ApplicationController
    before_action :find_design, :except => [:new, :create, :index]

    include DeleteableActions

    def index
      @designs = Design.order(:name).paginate(page: (params[:page] || 1), 
        per_page: (params[:per_page] || 30))
    end

    def show
      @areas = @design.areas.active
    end

    def new
      @design = Design.new
    end

    def edit
    end

    # POST /designs
    def create
      @design = Design.new(design_params)
      @design.updated_by = current_user

      if @design.save
        redirect_to edit_design_path(@design), notice: "Design was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /designs/1
    def update
      if @design.update(design_params)
        redirect_to edit_design_path(@design), notice: "Design was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @design.delete
      redirect_to(designs_url)
    end
    
    protected
    
    def find_design
      @design = Design.find(params[:id])
    end

    def design_params
      params.require(:design).permit(:name,:description, :stylesheet_text, :html_text, newsletters_attributes: [:design_id, :name, :description])
    end

  end
end
