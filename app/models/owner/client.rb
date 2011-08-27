class Owner::Client < ActiveRecord::Base
  validates :name, :presence => true, :length => {:maximum => 30}
  validates :domain, :presence => true, :length => {:minimum => 4, :maximum => 12}, :format => /\A[a-z]{4,12}\Z/
  validates :status, :presence => true

  belongs_to :database

  def initialize(*args)
    super *args
    self.status = 'blank'
  end

  def create_database
    return if %w(created migrated).include? status
    logger.debug database_name
    database.create_database database_name
    self.status = 'created'
    save
  end

  def drop_database
    return unless %w(created migrated).include? status
    database.drop_database database_name
    self.status = 'dropped'
    save
  end

  def database_name
    "#{self.connection.current_database}_#{domain}"
  end

end
