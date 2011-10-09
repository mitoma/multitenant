require 'test_helper'

class System::DatabaseTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "DBcreate and drop" do
    @system_database = system_databases(:one)
    @system_database.create_database "testdb"
    @system_database.drop_database "testdb"
  end
end
