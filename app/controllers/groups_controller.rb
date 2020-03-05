class GroupsController < ApplicationController
    before_action :authenticate_user!
    def index
        @groups = Group.all
    end
    def show
        @group  = Group.find_by_id(params[:id])
    end
    def new
        @group = Group.new()
    end
    def create
        @group = current_user.groups.create(group_params)  
        if @group.save
            redirect_to groups_path, notice: 'Post was successfully created.'
        else
            
            render :index, alert: 'Post was not created.'
        end
    
    end
    private
    def group_params
        params.require(:group).permit(:name, :description, :imagen_url)
    end
end
