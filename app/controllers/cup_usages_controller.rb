class CupUsagesController < ApplicationController
  skip_authorization_check

  # GET /cup_usages
  # GET /cup_usages.json
  def index
    @cup_usages = CupUsage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cup_usages }
    end
  end

  # GET /cup_usages/1
  # GET /cup_usages/1.json
  def show
    @cup_usage = CupUsage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cup_usage }
    end
  end

  # GET /cup_usages/new
  # GET /cup_usages/new.json
  def new
    @cup_usage = CupUsage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cup_usage }
    end
  end

  # GET /cup_usages/1/edit
  def edit
    @cup_usage = CupUsage.find(params[:id])
  end

  # POST /cup_usages
  # POST /cup_usages.json
  def create
    @cup_usage = CupUsage.new(params[:cup_usage])
    @cup_usage.user_id = current_user.id

    respond_to do |format|
      if @cup_usage.save
        format.html { redirect_to dashboard_path(user_id: current_user.id), notice: 'Cup usage was successfully created.' }
        format.json { render json: @cup_usage, status: :created, location: @cup_usage }
      else
        format.html { render action: "new" }
        format.json { render json: @cup_usage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cup_usages/1
  # PUT /cup_usages/1.json
  def update
    @cup_usage = CupUsage.find(params[:id])

    respond_to do |format|
      if @cup_usage.update_attributes(params[:cup_usage])
        format.html { redirect_to @cup_usage, notice: 'Cup usage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cup_usage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cup_usages/1
  # DELETE /cup_usages/1.json
  def destroy
    @cup_usage = CupUsage.find(params[:id])
    @cup_usage.destroy

    respond_to do |format|
      format.html { redirect_to cup_usages_url }
      format.json { head :no_content }
    end
  end
end
