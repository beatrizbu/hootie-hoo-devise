class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @venues = Venue.all
    respond_with(@venues)
  end

  def show

    puts "I see this"
    current_user.update_column(:venue_id, @venue.id)
    @users = User.where(venue_id: @venue.id)
    puts current_user.inspect
    puts User.all.inspect
    set_venue
    respond_with(@venue)



    chatroom
  end

  def new
    @venue = Venue.new
    respond_with(@venue)
  end

  def edit
    @venue = Venue.find params[:id]
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.save
    respond_with(@venue)
  end

  def chatroom
    @place_name = params[:place_name]
    # @venue = Venue.where(name: @place_name).first_or_initialize
    # @venue.save
    # current_user.update_column(:venue_id, @venue.id)
    # @users = User.where(venue_id: @venue.id)
    @conversations = Conversation.new

    # render :json => { "response" => "OK" }
    # redirect_to conversation_path if @place_name
    puts @place_name.inspect
    puts "hereeeeee"
    puts "please"
    puts @venue.inspect
  end

  def update
    @venue.update(venue_params)
    respond_with(@venue)
  end

  def destroy
    @venue.destroy
    respond_with(@venue)
  end

  private
    def set_venue
      @venue = Venue.first
    end

    def venue_params
      params[:venue]
    end
end
