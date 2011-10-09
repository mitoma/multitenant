class DummyController < ClientBaseController
  def index
    @dummies = DummyTable.all
  end
end
