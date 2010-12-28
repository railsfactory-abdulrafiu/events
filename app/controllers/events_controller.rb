class EventsController < ApplicationController
  def index
	  if $glo != 0 then
		  
	  else
		  render :controller => "user",:action=> "new"
	  end
  end

  def show_group
	  
	  if $glo != 0 then
		@a=params[:a].to_i
		if @a !=0 then
			@groups=Group.new(params[:data])
			@groups.save
			@groups=Group.find:all
		else
			@groups=Group.find:all
		end
	  else
		  redirect_to('/login', :notice => "You have been logged out.")
	  end
  end
  
  def add_group
	  if $glo != 0 then
		 
	  else
		  redirect_to('/login', :notice => "You have been logged out.")
	  end 
  end
  
  def view_events
	  if $glo != 0 then
		@group = Group.find(params[:id])
		$gru = @group.id
		@events = @group.events
		@user = User.find($glo)
		@users = @group.users
		@group1 = @user.groups
		@a=[]
		@group1.each {|t| @a<< t.id }
		if @a.include?(@group.id) then	
			
		else
			redirect_to('/view1_events')
		end
	  else
		  redirect_to('/login')
	  end
  end

  def view1_events
	if $glo != 0 then
	  	@group = Group.find($gru)
		@events = @group.events
		@users = @group.users
		@user = User.find($glo)
	else
		  redirect_to('/login')
	end
  end
  def join_group
	  if $glo != 0 then
		@group = Group.find($gru)
		@events = @group.events
		@user = User.find($glo)
		@usergroup = Usergroup.new
		@usergroup.user_id=@user.id
		@usergroup.group_id=@group.id
		@usergroup.save
		@user1 = @group.users	
	  else
		redirect_to('/login')
	end
  end
  def write_events
        if $glo != 0 then
		@group = Group.find($gru)
		@events = @group.events
		@user = User.find($glo)
		@users = @group.users
	else
		redirect_to('/login')
	end
  end
  def save
        if $glo != 0 then
		@group=Group.find(params[:id])
		@events=Event.new(params[:data])
		@events.group_id=params[:id]
		@events.save 
	else
		redirect_to('/login')
	end
  end
end
