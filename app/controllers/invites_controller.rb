class InvitesController < ApplicationController

  skip_before_filter :authenticate

  #layout "product"
  # GET /invites
  # GET /invites.json
  def index
    @invites = Invite.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invites }
    end
  end

  # GET /invites/1
  # GET /invites/1.json
  def show
    @invite = Invite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invite }
    end
  end

  # GET /invites/new
  # GET /invites/new.json
  def new
    @invite = Invite.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invite }
    end
  end

  # GET /invites/1/edit
  def edit
    @invite = Invite.find(params[:id])
  end

  # POST /invites
  # POST /invites.json
  def create
    @invite = Invite.new(params[:invite])

    respond_to do |format|
      if @invite.save
        format.html { redirect_to :thanks }
        #format.js { render :action => 'create_success' }
        format.json { render json: @invite, status: :created, location: @invite }
      else
        format.html { render action: "new" } #redirect_to new_invite_path if you want to return to the form submission page on error
        #format.js { render :action => 'create_fail' }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

def thanks
  #@invite = Invite.find(params[:id])
      @invite = Invite.find_by_email(params[:email])

    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @invite }
    # end
end

  # PUT /invites/1
  # PUT /invites/1.json
  def update
    @invite = Invite.find(params[:id])

    respond_to do |format|
      if @invite.update_attributes(params[:invite])
        format.html { redirect_to @invite, notice: 'Invite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invites/1
  # DELETE /invites/1.json
  def destroy
    @invite = Invite.find(params[:id])
    @invite.destroy

    respond_to do |format|
      format.html { redirect_to invites_url }
      format.json { head :no_content }
    end
  end
end
