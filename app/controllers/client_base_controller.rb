class ClientBaseController < ApplicationController
  around_filter :proc_in_client
  def proc_in_client
    client = Client.find(session[:client_id])
    client.proc_client do
      yield
    end
  end
end
