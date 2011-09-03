class System::Client < ActiveRecord::Base
  validates :name, :presence => true, :length => {:maximum => 30}
  validates :domain, :presence => true, :length => {:minimum => 4, :maximum => 12}, :format => /\A[a-z]{4,12}\Z/
  validates :status, :presence => true

  belongs_to :database

  def initialize(*args)
    super *args
    self.status = 'initial'
  end

  def create_database
    return unless %w(initial dropped).include? self.status
    database.create_database database_name
    self.status = 'created'
    save
  end

  def migrate_database
    return unless %w(created migrated).include? self.status
    database.migrate_database database_name
    self.status = 'migrated'
    save
  end

  def drop_database
    return unless %w(created migrated).include? self.status
    database.drop_database database_name
    self.status = 'dropped'
    save
  end

  def database_name
    "#{self.connection.current_database}_#{domain}"
  end

  def proc_client(&block)
    System::ClientBase.establish_connection({:adapter => 'postgresql',
                                              :encoding => 'unicode',
                                              :database => database_name,
                                              :hostname => hostname,
                                              :port => port,
                                              :username => username,
                                              :password => password
                                            })
    yield
  ensure
    System::ClientBase.establish_connection
  end
end
