class ReviewersController < ApplicationController
	before_filter :get_city

	def get_city
    @city = City.find(params[:city_id])
  end

  # GET /reviewers
  # GET /reviewers.json
  def index
    @reviewers = @city.reviewers

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviewers }
    end
  end

  # GET /reviewers/1
  # GET /reviewers/1.json
  def show
    @reviewer = @city.reviewers.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reviewer }
    end
  end

  # GET /reviewers/new
  # GET /reviewers/new.json
  def new
    @reviewer = Reviewer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reviewer }
    end
  end

  # GET /reviewers/1/edit
  def edit
    @reviewer = Reviewer.find(params[:id])
  end

  # POST /reviewers
  # POST /reviewers.json
  def create
    @reviewer = @city.reviewers.new(params[:reviewer])

    respond_to do |format|
      if @reviewer.save
        format.html { redirect_to [@city, @reviewer], notice: 'Reviewer was successfully created.' }
        format.json { render json: [@city, @reviewer], status: :created, location: [@city, @reviewer] }
      else
        format.html { render action: "new" }
        format.json { render json: @reviewer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reviewers/1
  # PUT /reviewers/1.json
  def update
    @reviewer = Reviewer.find(params[:id])

    respond_to do |format|
      if @reviewer.update_attributes(params[:reviewer])
        format.html { redirect_to [@city, @reviewer], notice: 'Reviewer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reviewer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviewers/1
  # DELETE /reviewers/1.json
  def destroy
    @reviewer = Reviewer.find(params[:id])
    @reviewer.destroy

    respond_to do |format|
      format.html { redirect_to reviewers_url }
      format.json { head :no_content }
    end
  end
end
