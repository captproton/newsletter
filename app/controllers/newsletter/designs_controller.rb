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

    def create
      @design = Design.new(params[:design])
      @design.updated_by = current_user

      if @design.save
        flash[:notice] = 'Design was successfully created.'
        redirect_to(edit_design_path(@design))
      else
          render :action => "new"
      end
    end

    def update
      if @design.update_attributes(params[:design])
        flash[:notice] = 'Design was successfully updated.'
        redirect_to(edit_design_path(@design))
      else
        render :action => "edit"
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
      params.require(:design).permit(:name,:description, newsletters_attributes: [:design_id, :name, :description])
    end

  end
end
