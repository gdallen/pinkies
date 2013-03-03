class CharmapsController < ApplicationController
  # GET /charmaps
  # GET /charmaps.json
  def index
    @charmaps = Charmap.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @charmaps }
    end
  end

  # GET /charmaps/1
  # GET /charmaps/1.json
  def show
    @charmap = Charmap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @charmap }
    end
  end

  # GET /charmaps/new
  # GET /charmaps/new.json
  def new
    @charmap = Charmap.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @charmap }
    end
  end

  # GET /charmaps/1/edit
  def edit
    @charmap = Charmap.find(params[:id])
  end

  # POST /charmaps
  # POST /charmaps.json
  def create
    @charmap = Charmap.new(params[:charmap])

    respond_to do |format|
      if @charmap.save
        format.html { redirect_to @charmap, notice: 'Charmap was successfully created.' }
        format.json { render json: @charmap, status: :created, location: @charmap }
      else
        format.html { render action: "new" }
        format.json { render json: @charmap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /charmaps/1
  # PUT /charmaps/1.json
  def update
    @charmap = Charmap.find(params[:id])

    respond_to do |format|
      if @charmap.update_attributes(params[:charmap])
        format.html { redirect_to @charmap, notice: 'Charmap was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @charmap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charmaps/1
  # DELETE /charmaps/1.json
  def destroy
    @charmap = Charmap.find(params[:id])
    @charmap.destroy

    respond_to do |format|
      format.html { redirect_to charmaps_url }
      format.json { head :no_content }
    end
  end
end
