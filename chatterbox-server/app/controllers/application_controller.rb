class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get '/messages' do
    # returns an array of all messages 
    # ordered by created_at in ascending order.
    Message.order(:created_at).to_json
    # binding.pry
    # as JSON, 
  end

  post '/messages' do
    # POST /messages: creates a new message with a body and username from params, 
    # and returns the newly created post as JSON.
    Message.create(body: params["body"], username: params["username"]).to_json
  end
  
  patch '/messages/:id' do
    # PATCH /messages/:id: updates the body of the message using params, and returns the updated message as JSON.
    # binding.pry
    # Message.create(body: params["body"], username: params["username"]).to_json
    # Message. .find(:id?) update(body: params["body"], username: params["username"]).to_json
    Message.find(params[:id]).update(body: params[:body]).to_json
  end
  


  
end
