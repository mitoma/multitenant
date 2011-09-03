class System::ClientsController < ApplicationController
  # GET /system/clients
  # GET /system/clients.xml
  def index
    @system_clients = System::Client.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @system_clients }
    end
  end

  # GET /system/clients/1
  # GET /system/clients/1.xml
  def show
    @system_client = System::Client.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @system_client }
    end
  end

  # GET /system/clients/new
  # GET /system/clients/new.xml
  def new
    @system_client = System::Client.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @system_client }
    end
  end

  # GET /system/clients/1/edit
  def edit
    @system_client = System::Client.find(params[:id])
  end

  # POST /system/clients
  # POST /system/clients.xml
  def create
    @system_client = System::Client.new(params[:system_client])

    respond_to do |format|
      if @system_client.save
        format.html { redirect_to(@system_client, :notice => 'Client was successfully created.') }
        format.xml  { render :xml => @system_client, :status => :created, :location => @system_client }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @system_client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /system/clients/1
  # PUT /system/clients/1.xml
  def update
    @system_client = System::Client.find(params[:id])

    respond_to do |format|
      if @system_client.update_attributes(params[:system_client])
        format.html { redirect_to(@system_client, :notice => 'Client was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @system_client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /system/clients/1
  # DELETE /system/clients/1.xml
  def destroy
    @system_client = System::Client.find(params[:id])
    @system_client.destroy

    respond_to do |format|
      format.html { redirect_to(system_clients_url) }
      format.xml  { head :ok }
    end
  end

  def create_database
    @system_client = System::Client.find(params[:id])

    respond_to do |format|
      if @system_client.create_database
        format.html { redirect_to(system_clients_url, :notice => 'Client Database was successfully created.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(system_clients_url, :notice => 'Client Database was already created.') }
        format.xml  { render :xml => @system_client.errors, :status => :unprocessable_entity }
      end
    end
  end

  def migrate_database
    @system_client = System::Client.find(params[:id])

    respond_to do |format|
      if @system_client.migrate_database
        format.html { redirect_to(system_clients_url, :notice => 'Client Database was successfully migrated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(system_clients_url, :notice => 'Client Database was already migrated.') }
        format.xml  { render :xml => @system_client.errors, :status => :unprocessable_entity }
      end
    end
  end

  def drop_database
    @system_client = System::Client.find(params[:id])

    respond_to do |format|
      if @system_client.drop_database
        format.html { redirect_to(system_clients_url, :notice => 'Client Database was successfully dropped.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(system_clients_url, :notice => 'Client Database was already dropped.') }
        format.xml  { render :xml => @system_client.errors, :status => :unprocessable_entity }
      end
    end
  end

end
