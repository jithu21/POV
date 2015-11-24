class ConnectorDetailsController < ApplicationController
  before_action :set_connector_detail, only: [:show, :edit, :update, :destroy]

  # GET /connector_details
  # GET /connector_details.json
  def index
    @connector_details = ConnectorDetail.all
    render :json => { :results => @connector_details.as_json, :status =>"200" }
  end

  # GET /connector_details/1
  # GET /connector_details/1.json
  def show
  end

  # GET /connector_details/new
  def new
    @connector_detail = ConnectorDetail.new
  end

  # GET /connector_details/1/edit
  def edit
  end

  # POST /connector_details
  # POST /connector_details.json
  def create
    isError=unique_mapping_fields
    binding.pry
    if !isError
      @connector_detail = ConnectorDetail.new(connector_detail_params)
      respond_to do |format|
        if @connector_detail.save
          format.html { redirect_to @connector_detail, notice: 'Connector detail was successfully created.' }
          format.json { render :show, status: :created, location: @connector_detail }
        else
          format.html { render :new }
          format.json { render json: @connector_detail.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /connector_details/1
  # PATCH/PUT /connector_details/1.json
  def update
    respond_to do |format|
      if @connector_detail.update(connector_detail_params)
        format.html { redirect_to @connector_detail, notice: 'Connector detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @connector_detail }
      else
        format.html { render :edit }
        format.json { render json: @connector_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /connector_details/1
  # DELETE /connector_details/1.json
  def destroy
    @connector_detail.destroy
    respond_to do |format|
      format.html { redirect_to connector_details_url, notice: 'Connector detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_connector_detail
      @connector_detail = ConnectorDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def connector_detail_params
      hash ={}
      hash[:projectname]= params[:projectname]
      hash[:filetype]= params[:filetype]
      hash[:connectorname]= params[:connectorname]
      hash[:datasource]= params[:datasource]
      hash[:credentials]= params[:credentials]
      hash[:mapping]= params[:mapping]
      hash[:cronexpression]= params[:cronexpression]
      hash
    end
     def unique_mapping_fields
        all_errors=[];
        error=false;
        params[:mapping].each do |x|
          if x[:source] != x[:target]
            begin
              raise "Wrong Mapping found #{x}"
             rescue Exception =>e
               all_errors.push(e.message)
             end
          end
        end
        if all_errors.length >0
          render :json => { :errors => all_errors}
          error=true;
          return error
        end
        error
      end
end
