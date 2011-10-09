class ClientBaseController < ApplicationController
  around_filter :proc_in_client
  def proc_in_client
    client_id = params[:client_id]
    client_id ||= 1
    client = System::Client.find(client_id)
    client.proc_client do
      yield
    end
  end
end
