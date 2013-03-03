class KeystrokesController < ApplicationController
  # GET /keystrokes
  # GET /keystrokes.json
  def index
    @keystrokes = Keystroke.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @keystrokes }
    end
  end

  # GET /keystrokes/1
  # GET /keystrokes/1.json
  def show
    @keystroke = Keystroke.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @keystroke }
    end
  end

  # GET /keystrokes/new
  # GET /keystrokes/new.json
  def new
    @keystroke = Keystroke.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @keystroke }
    end
  end

  # GET /keystrokes/1/edit
  def edit
    @keystroke = Keystroke.find(params[:id])
  end

  # POST /keystrokes
  # POST /keystrokes.json
  def create
    @keystroke = Keystroke.new(params[:keystroke])

    respond_to do |format|
      if @keystroke.save
        format.html { redirect_to @keystroke, notice: 'Keystroke was successfully created.' }
        format.json { render json: @keystroke, status: :created, location: @keystroke }
      else
        format.html { render action: "new" }
        format.json { render json: @keystroke.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /keystrokes/1
  # PUT /keystrokes/1.json
  def update
    @keystroke = Keystroke.find(params[:id])

    respond_to do |format|
      if @keystroke.update_attributes(params[:keystroke])
        format.html { redirect_to @keystroke, notice: 'Keystroke was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @keystroke.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /keystrokes/1
  # DELETE /keystrokes/1.json
  def destroy
    @keystroke = Keystroke.find(params[:id])
    @keystroke.destroy

    respond_to do |format|
      format.html { redirect_to keystrokes_url }
      format.json { head :no_content }
    end
  end
end
