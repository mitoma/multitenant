class Owner::Client < ActiveRecord::Base
  validates :name, :presence => true, :length => {:maximum => 30}
  validates :domain, :presence => true, :length => {:minimum => 4, :maximum => 12}, :format => /\A[a-z]{4,12}\Z/
  validates :status, :presence => true

  belongs_to :database

  def initialize(*args)
    super *args
    self.status = 'initial'
  end

  def create_database
    return if %w(created migrated).include? status
    logger.debug database_name
    database.create_database database_name
    self.status = 'created'
    save
  end

  def migrate_database
    return if %w(deleted initial).include? status
    database.migrate_database database_name
    self.status = 'migrated'
    save
  end

  def drop_database
    return if %w(initial dropped).include? status
    database.drop_database database_name
    self.status = 'dropped'
    save
  end

  def database_name
    "#{self.connection.current_database}_#{domain}"
  end

end
