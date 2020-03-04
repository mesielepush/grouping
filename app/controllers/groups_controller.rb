class GroupsController < ApplicationController
    before_action :authenticate_user!
    def index
        @groups = Group.all
    end
    def show
        @group  = Group.find_by_id(params[:id])
        
        
    end
end
