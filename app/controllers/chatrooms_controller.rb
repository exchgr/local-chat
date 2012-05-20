class ChatroomsController < ApplicationController
  # GET /chatrooms
  # GET /chatrooms.json
  def index
    @user = User.find(session[:user_id])
    @chatrooms = Chatroom.findChatrooms(@user.lat, @user.long)
    #@chatrooms = Chatroom.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chatrooms }
    end
  end

  # GET /chatrooms/1
  # GET /chatrooms/1.json
  def show
    @chatroom = Chatroom.find(params[:id])
    @messages = @chatroom.messages.order("created_at DESC")
    @user = User.find(session[:user_id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chatroom }
    end
  end

  # GET /chatrooms/new
  # GET /chatrooms/new.json
  def new
    @chatroom = Chatroom.new
    @user = User.find(session[:user_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chatroom }
    end
  end

  # GET /chatrooms/1/edit
  def edit
    @chatroom = Chatroom.find(params[:id])
  end

  # POST /chatrooms
  # POST /chatrooms.json
  def create
    
    @chatroom = Chatroom.new(params[:chatroom])
    
    respond_to do |format|
      if @chatroom.save
        format.html { redirect_to @chatroom, notice: 'Chatroom was successfully created.' }
        format.json { render json: @chatroom, status: :created, location: @chatroom }
      else
        format.html { render action: "new" }
        format.json { render json: @chatroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chatrooms/1
  # PUT /chatrooms/1.json
  def update
    @chatroom = Chatroom.find(params[:id])

    respond_to do |format|
      if @chatroom.update_attributes(params[:chatroom])
        format.html { redirect_to @chatroom, notice: 'Chatroom was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chatroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chatrooms/1
  # DELETE /chatrooms/1.json
  def destroy
    @chatroom = Chatroom.find(params[:id])
    @chatroom.destroy

    respond_to do |format|
      format.html { redirect_to chatrooms_url }
      format.json { head :no_content }
    end
  end
  
  def ajax_update
  	  chatroom = Chatroom.find(params[:id])
  	  message = chatroom.messages.order("created_at DESC").first
  	  user = message.user
  	  count = chatroom.messages.count
  	  render :json => {message: message.message, count: count, username: user.name}
  end
  
  def ajax_send_message
  	  chatroom = Chatroom.find(params[:id])
  	  message_text = params[:message]
  	  user_id = params[:user_id]
	  chatroom.messages.create(message: message_text, user_id: user_id)
	  render :json => {message: "success"}
  end
  
end
