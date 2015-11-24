class DailymailsController < ApplicationController
  before_action :set_dailymail, only: [:show, :edit, :update, :destroy]

  # GET /dailymails
  # GET /dailymails.json
  def index

    @dailymails = Dailymail.collection.aggregate([{ "$match" => { "clearprice" => { "$gt" => 0}}}, { "$group" => { "_id" => "$brandname", "revenue" => { "$sum" => "$clearprice"}, "brandname" => {"$first" => "$brandname"} }},
     { "$project"  => { "brandname" => 1, "revenue" => 1, "_id" => 0}}, { "$sort" => { "revenue"  => -1}}, { "$limit" => 10}])
     render :json => {:result => @dailymails :status => "200" }
  end

  # GET /dailymails/1
  # GET /dailymails/1.json
  def show
  end

  # GET /dailymails/new
  def new
    @dailymail = Dailymail.new
  end

  # GET /dailymails/1/edit
  def edit
  end

  # POST /dailymails
  # POST /dailymails.json
  def create
    @dailymail = Dailymail.new(dailymail_params)

    respond_to do |format|
      if @dailymail.save
        format.html { redirect_to @dailymail, notice: 'Dailymail was successfully created.' }
        format.json { render :show, status: :created, location: @dailymail }
      else
        format.html { render :new }
        format.json { render json: @dailymail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dailymails/1
  # PATCH/PUT /dailymails/1.json
  def update
    respond_to do |format|
      if @dailymail.update(dailymail_params)
        format.html { redirect_to @dailymail, notice: 'Dailymail was successfully updated.' }
        format.json { render :show, status: :ok, location: @dailymail }
      else
        format.html { render :edit }
        format.json { render json: @dailymail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dailymails/1
  # DELETE /dailymails/1.json
  def destroy
    @dailymail.destroy
    respond_to do |format|
      format.html { redirect_to dailymails_url, notice: 'Dailymail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dailymail
      @dailymail = Dailymail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dailymail_params
      params.require(:dailymail).permit(:type, :slotid, :siteid, :sitename, :pricelevel, :requestid, :adunit, :dealid, :domain, :country, :state, :dma, :connectionspeed, :os, :browser, :devicetype, :language, :dspname, :brandid, :brandname, :campaignid, :usermatchstatus, :timestamp, :winrate, :bidrate, :clearprice)
    end
end
