class System::DatabasesController < ApplicationController
  # GET /system/databases
  # GET /system/databases.xml
  def index
    @system_databases = System::Database.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @system_databases }
    end
  end

  # GET /system/databases/1
  # GET /system/databases/1.xml
  def show
    @system_database = System::Database.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @system_database }
    end
  end

  # GET /system/databases/new
  # GET /system/databases/new.xml
  def new
    @system_database = System::Database.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @system_database }
    end
  end

  # GET /system/databases/1/edit
  def edit
    @system_database = System::Database.find(params[:id])
  end

  # POST /system/databases
  # POST /system/databases.xml
  def create
    @system_database = System::Database.new(params[:system_database])

    respond_to do |format|
      if @system_database.save
        format.html { redirect_to(@system_database, :notice => 'Database was successfully created.') }
        format.xml  { render :xml => @system_database, :status => :created, :location => @system_database }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @system_database.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /system/databases/1
  # PUT /system/databases/1.xml
  def update
    @system_database = System::Database.find(params[:id])

    respond_to do |format|
      if @system_database.update_attributes(params[:system_database])
        format.html { redirect_to(@system_database, :notice => 'Database was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @system_database.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /system/databases/1
  # DELETE /system/databases/1.xml
  def destroy
    @system_database = System::Database.find(params[:id])
    @system_database.destroy

    respond_to do |format|
      format.html { redirect_to(system_databases_url) }
      format.xml  { head :ok }
    end
  end
end
