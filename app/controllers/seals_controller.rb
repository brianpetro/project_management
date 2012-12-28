class SealsController < ApplicationController
  # GET /seals
  # GET /seals.json
  def index
    @seals = Seal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @seals }
    end
  end

  # GET /seals/1
  # GET /seals/1.json
  def show
    @seal = Seal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @seal }
    end
  end

  # GET /seals/new
  # GET /seals/new.json
  def new
    @seal = Seal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @seal }
    end
  end

  # GET /seals/1/edit
  def edit
    @seal = Seal.find(params[:id])
  end

  # POST /seals
  # POST /seals.json
  def create
    @seal = Seal.new(params[:seal])

    respond_to do |format|
      if @seal.save
        format.html { redirect_to @seal, notice: 'Seal was successfully created.' }
        format.json { render json: @seal, status: :created, location: @seal }
      else
        format.html { render action: "new" }
        format.json { render json: @seal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /seals/1
  # PUT /seals/1.json
  def update
    @seal = Seal.find(params[:id])

    respond_to do |format|
      if @seal.update_attributes(params[:seal])
        format.html { redirect_to @seal, notice: 'Seal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @seal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seals/1
  # DELETE /seals/1.json
  def destroy
    @seal = Seal.find(params[:id])
    @seal.destroy

    respond_to do |format|
      format.html { redirect_to seals_url }
      format.json { head :no_content }
    end
  end
end