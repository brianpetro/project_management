class ParticipantsController < ApplicationController
  before_filter :get_project

  load_and_authorize_resource

  def get_project
    @project = Project.find(params[:project_id])
  end

  # GET /participants
  # GET /participants.json
  def index
    @participants = @project.participants

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @participants }
    end
  end

  # GET /participants/1
  # GET /participants/1.json
  def show
    @participant = @project.participants.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @participant }
    end
  end

  # GET /participants/new
  # GET /participants/new.json
  def new
    @participant = Participant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @participant }
    end
  end

  # GET /participants/1/edit
  def edit
    @participant = Participant.find(params[:id])
  end

  # POST /participants
  # POST /participants.json
  def create
    @participant = @project.participants.new(params[:participant])

    respond_to do |format|
      if @participant.save
        format.html { redirect_to [@project, @participant], notice: 'Participant was successfully created.' }
        format.json { render json: [@project, @participant], status: :created, location: [@project, @participant] }
      else
        format.html { render action: "new" }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /participants/1
  # PUT /participants/1.json
  def update
    @participant = Participant.find(params[:id])

    respond_to do |format|
      if @participant.update_attributes(params[:participant])
        format.html { redirect_to [@project, @participant], notice: 'Participant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participants/1
  # DELETE /participants/1.json
  def destroy
    @participant = Participant.find(params[:id])
    @participant.destroy

    respond_to do |format|
      format.html { redirect_to project_participants_url }
      format.json { head :no_content }
    end
  end
end
