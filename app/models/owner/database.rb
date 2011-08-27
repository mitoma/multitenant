class Owner::Database < ActiveRecord::Base
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

  def proc_database(&block)
    self.class.establish_connection({:adapter => 'postgresql',
                                      :encoding => 'unicode',
                                      :database => 'template1',
                                      :hostname => hostname,
                                      :port => port,
                                      :username => username,
                                      :password => password
                                    })
    yield
  ensure
    self.class.establish_connection
  end
end
