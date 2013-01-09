class BlueprintsController < ApplicationController
  before_filter :get_project
  
  load_and_authorize_resource


  def get_project
    @project = Project.find(params[:project_id])
  end
  # GET /blueprints
  # GET /blueprints.json
  def index
		if params[:tag]    
			@blueprints = @project.blueprints.tagged_with(params[:tag])
		else
    @blueprints = @project.blueprints
		end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blueprints }
    end
  end

  # GET /blueprints/1
  # GET /blueprints/1.json
  def show
    @blueprint = @project.blueprints.find(params[:id])
		
		@notes = @blueprint.notes.order("position")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @blueprint }
    end
  end

  # GET /blueprints/new
  # GET /blueprints/new.json
  def new
    @blueprint = Blueprint.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @blueprint }
    end
  end

  # GET /blueprints/1/edit
  def edit
    @blueprint = Blueprint.find(params[:id])
  end

  # POST /blueprints
  # POST /blueprints.json
  def create
    @blueprint = @project.blueprints.new(params[:blueprint])

    respond_to do |format|
      if @blueprint.save
        format.html { redirect_to [@project], notice: 'Blueprint was successfully created.' }
        format.json { render json: [@project, @blueprint], status: :created,
				 location: [@project, @blueprint] }
      else
        format.html { render action: "new" }
        format.json { render json: @blueprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /blueprints/1
  # PUT /blueprints/1.json
  def update
    @blueprint = Blueprint.find(params[:id])

    respond_to do |format|
      if @blueprint.update_attributes(params[:blueprint])
        format.html { redirect_to [@project, @blueprint], notice: 'Blueprint was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blueprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blueprints/1
  # DELETE /blueprints/1.json
  def destroy
    @blueprint = @project.blueprints.find(params[:id])
    @blueprint.destroy

    respond_to do |format|
      format.html { redirect_to project_blueprints_url }
      format.json { head :no_content }
    end
  end

	def sort
		params[:blueprint].each_with_index do |id, index|
			@project.blueprints.update_all({position: index+1}, {id: id})
		end
		render nothing: true
	end
end
