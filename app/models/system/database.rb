class System::Database < ActiveRecord::Base
  validates :name, :presence => true, :length => {:maximum => 30}
  validates :hostname, :presence => true, :length => {:maximum => 30}
  validates :port, :presence => true
  validates :username, :presence => true, :format => /\A[a-z]{4,12}\Z/

  def create_database(database_name)
    proc_database do
      self.class.connection.create_database database_name
    end
  end

  def drop_database(database_name)
    proc_database do
      self.class.connection.drop_database database_name
    end
  end

  def migrate_database(database_name, target_version = nil)
    proc_database(database_name) do
      ActiveRecord::Migrator.migrate("db/client_migrate", target_version)
    end
  end

  def proc_database(database_name = 'template1', &block)
    ActiveRecord::Base.establish_connection({:adapter => 'postgresql',
                                              :encoding => 'unicode',
                                              :database => database_name,
                                              :hostname => hostname,
                                              :port => port,
                                              :username => username,
                                              :password => password
                                            })
    yield
  ensure
    ActiveRecord::Base.establish_connection
  end
end
