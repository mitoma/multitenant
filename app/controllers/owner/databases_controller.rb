class Owner::DatabasesController < ApplicationController
  # GET /owner/databases
  # GET /owner/databases.xml
  def index
    @owner_databases = Owner::Database.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @owner_databases }
    end
  end

  # GET /owner/databases/1
  # GET /owner/databases/1.xml
  def show
    @owner_database = Owner::Database.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @owner_database }
    end
  end

  # GET /owner/databases/new
  # GET /owner/databases/new.xml
  def new
    @owner_database = Owner::Database.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @owner_database }
    end
  end

  # GET /owner/databases/1/edit
  def edit
    @owner_database = Owner::Database.find(params[:id])
  end

  # POST /owner/databases
  # POST /owner/databases.xml
  def create
    @owner_database = Owner::Database.new(params[:owner_database])

    respond_to do |format|
      if @owner_database.save
        format.html { redirect_to(@owner_database, :notice => 'Database was successfully created.') }
        format.xml  { render :xml => @owner_database, :status => :created, :location => @owner_database }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @owner_database.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /owner/databases/1
  # PUT /owner/databases/1.xml
  def update
    @owner_database = Owner::Database.find(params[:id])

    respond_to do |format|
      if @owner_database.update_attributes(params[:owner_database])
        format.html { redirect_to(@owner_database, :notice => 'Database was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @owner_database.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /owner/databases/1
  # DELETE /owner/databases/1.xml
  def destroy
    @owner_database = Owner::Database.find(params[:id])
    @owner_database.destroy

    respond_to do |format|
      format.html { redirect_to(owner_databases_url) }
      format.xml  { head :ok }
    end
  end
end
