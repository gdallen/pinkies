class ShiftmapsController < ApplicationController
  # GET /shiftmaps
  # GET /shiftmaps.json
  def index
    @shiftmaps = Shiftmap.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shiftmaps }
    end
  end

  # GET /shiftmaps/1
  # GET /shiftmaps/1.json
  def show
    @shiftmap = Shiftmap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shiftmap }
    end
  end

  # GET /shiftmaps/new
  # GET /shiftmaps/new.json
  def new
    @shiftmap = Shiftmap.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shiftmap }
    end
  end

  # GET /shiftmaps/1/edit
  def edit
    @shiftmap = Shiftmap.find(params[:id])
  end

  # POST /shiftmaps
  # POST /shiftmaps.json
  def create
    @shiftmap = Shiftmap.new(params[:shiftmap])

    respond_to do |format|
      if @shiftmap.save
        format.html { redirect_to @shiftmap, notice: 'Shiftmap was successfully created.' }
        format.json { render json: @shiftmap, status: :created, location: @shiftmap }
      else
        format.html { render action: "new" }
        format.json { render json: @shiftmap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shiftmaps/1
  # PUT /shiftmaps/1.json
  def update
    @shiftmap = Shiftmap.find(params[:id])

    respond_to do |format|
      if @shiftmap.update_attributes(params[:shiftmap])
        format.html { redirect_to @shiftmap, notice: 'Shiftmap was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shiftmap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shiftmaps/1
  # DELETE /shiftmaps/1.json
  def destroy
    @shiftmap = Shiftmap.find(params[:id])
    @shiftmap.destroy

    respond_to do |format|
      format.html { redirect_to shiftmaps_url }
      format.json { head :no_content }
    end
  end
end
