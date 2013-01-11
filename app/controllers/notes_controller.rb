class NotesController < ApplicationController
  before_filter :get_project

  load_and_authorize_resource
  
  def get_project
    @project = Project.find(params[:project_id])
  end

  # GET /notes
  # GET /notes.json
  def index
		if params[:tag]    
			@notes = @project.notes.tagged_with(params[:tag])
		else
			@notes = @project.notes.order("position")
		end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notes }
    end
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    @note = @project.notes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @note }
    end
  end

  # GET /notes/new
  # GET /notes/new.json
  def new
    @note = Note.new
    blueprint = @note.coordinates.build
		@blueprint_id = params[:blueprint_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @note }
    end
  end

  # GET /notes/1/edit
  def edit
    @note = Note.find(params[:id])
		@blueprint_id = params[:blueprint_id]

  end

  # POST /notes
  # POST /notes.json
  def create
    @note = @project.notes.new(params[:note])
		
    respond_to do |format|
      if @note.save
        format.html { redirect_to [@project, @note], notice: 'Note was successfully created.' }
        format.json { render json: [@project, @note], status: :created,
			 location: [@project, @note] }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.json
  def update
    @note = Note.find(params[:id])


    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to [@project, @note], notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_url }
      format.json { head :no_content }
    end
  end

	def sort
		params[:note].each_with_index do |id, index|
			@project.notes.update_all({position: index+1}, {id: id})
		end
		render nothing: true
	end
end
