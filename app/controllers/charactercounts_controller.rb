class CharactercountsController < ApplicationController
  def index
    @charactercounts = Charactercounts.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @charactercounts }
    end
  end
end
