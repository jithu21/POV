class DailymailsController < ApplicationController
  before_action :set_dailymail, only: [:show, :edit, :update, :destroy]

  # GET /dailymails
  # GET /dailymails.json
  def index

    @dailymails = Dailymail.collection.aggregate([{ "$match" => { "clearprice" => { "$gt" => 0}}}, { "$group" => { "_id" => "$brandname", "revenue" => { "$sum" => "$clearprice"}, "brandname" => {"$first" => "$brandname"} }},
     { "$project"  => { "brandname" => 1, "revenue" => 1, "_id" => 0}}, { "$sort" => { "revenue"  => -1}}, { "$limit" => 15}])
     render :json => {:result => @dailymails.to_json , status => "200" }
  end

  # GET /dailymails/1
  # GET /dailymails/1.json
  def show
  end


 def displayallBids
   @allbids = Dailymail.collection.aggregate([{ "$match" => { "clearprice" => { "$gt" => 0}, "timeStamp" => { "$gt" => "2015-11-16 16:48:17" , "$lt" => "2015-11-16 23:48:17" }}},
   { "$group" => { "_id" => { "timeStamp" => "$timeStamp","brandname" => "$brandname" } ,"NoOfBids" => { "$sum" => 1}, "Clearprice" => { "$sum" => "$clearprice"}}},
   {"$project" => { "NoOfBids" => 1,"Clearprice" => 1,"_id" => 0}},{"$sort" => {"Clearprice" => -1}}],{ :allowDiskUse => "true"})
   render :json => @allbids.to_json
 end

  def displayallrecords
     @dailymailall=Dailymail.collection.aggregate([{"$match" => {"timeStamp" => {"$gt" =>"2015-11-16 16:48:17", "$lt" =>"2015-11-16 20:48:17"}, "clearprice" =>{"$gt" => 0}}},
     {"$project" => {"_id" => 0 , "type" => 1 , "slotid" => 1, "siteid" => 1, "pricelevel" => 1,"requestid" => 1,"adunit" => 1,"dealid" => 1, "domain" => 1, "country" => 1, "state" => 1,"dma" => 1, "connectionspeed" => 1,"os" => 1,"browser" => 1,"device type" => 1, "language" => 1,"dspname" => 1,"brandid" => 1,"brandname" => 1, "campaignid" => 1,"usermatchstatatus" => 1, "timeStamp" => 1, "winrate" => 1, "bidrate" => 1,"clearprice" => 1}}])
      render :json => @dailymailall.to_json
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
