class GroupsController < ApplicationController
    before_action :authenticate_user!
    def index
        @groups = Group.all
    end
    def show
        @group  = Group.find_by_id(params[:id])
    end
    def new
        
    end
    def create
        @group = Group.new(params)
        
        if @group.save
            redirect_to group_path, notice: 'Post was successfully created.'
        else
            
            render :index, alert: 'Post was not created.'
        end
    
    end
end
