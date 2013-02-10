class DatafilesController < ApplicationController
  # GET /datafiles
  # GET /datafiles.json
  def index
    @datafiles = Datafile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @datafiles }
    end
  end

  # GET /datafiles/1
  # GET /datafiles/1.json
  def show
    @datafile = Datafile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @datafile }
    end
  end

  # GET /datafiles/new
  # GET /datafiles/new.json
  def new
    @datafile = Datafile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @datafile }
    end
  end

  # GET /datafiles/1/edit
  def edit
    @datafile = Datafile.find(params[:id])
  end

  # POST /datafiles
  # POST /datafiles.json
  def create
    @datafile = Datafile.new(params[:datafile])

    respond_to do |format|
      if @datafile.save
        format.html { redirect_to @datafile, notice: 'Datafile was successfully created.' }
        format.json { render json: @datafile, status: :created, location: @datafile }
      else
        format.html { render action: "new" }
        format.json { render json: @datafile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /datafiles/1
  # PUT /datafiles/1.json
  def update
    @datafile = Datafile.find(params[:id])

    respond_to do |format|
      if @datafile.update_attributes(params[:datafile])
        format.html { redirect_to @datafile, notice: 'Datafile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @datafile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /datafiles/1
  # DELETE /datafiles/1.json
  def destroy
    @datafile = Datafile.find(params[:id])
    @datafile.destroy

    respond_to do |format|
      format.html { redirect_to datafiles_url }
      format.json { head :no_content }
    end
  end
end
