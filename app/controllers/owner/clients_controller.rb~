class Owner::ClientsController < ApplicationController
  # GET /owner/clients
  # GET /owner/clients.xml
  def index
    @owner_clients = Owner::Client.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @owner_clients }
    end
  end

  # GET /owner/clients/1
  # GET /owner/clients/1.xml
  def show
    @owner_client = Owner::Client.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @owner_client }
    end
  end

  # GET /owner/clients/new
  # GET /owner/clients/new.xml
  def new
    @owner_client = Owner::Client.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @owner_client }
    end
  end

  # GET /owner/clients/1/edit
  def edit
    @owner_client = Owner::Client.find(params[:id])
  end

  # POST /owner/clients
  # POST /owner/clients.xml
  def create
    @owner_client = Owner::Client.new(params[:owner_client])

    respond_to do |format|
      if @owner_client.save
        format.html { redirect_to(@owner_client, :notice => 'Client was successfully created.') }
        format.xml  { render :xml => @owner_client, :status => :created, :location => @owner_client }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @owner_client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /owner/clients/1
  # PUT /owner/clients/1.xml
  def update
    @owner_client = Owner::Client.find(params[:id])

    respond_to do |format|
      if @owner_client.update_attributes(params[:owner_client])
        format.html { redirect_to(@owner_client, :notice => 'Client was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @owner_client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /owner/clients/1
  # DELETE /owner/clients/1.xml
  def destroy
    @owner_client = Owner::Client.find(params[:id])
    @owner_client.destroy

    respond_to do |format|
      format.html { redirect_to(owner_clients_url) }
      format.xml  { head :ok }
    end
  end
end
