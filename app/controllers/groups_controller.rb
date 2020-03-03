class GroupsController < ApplicationController
    def index
        @groups = Group.all
    end
    def show
        puts '"""""""""""""""""""""""""""""""""""""""""""'
        @group  = Group.find_by_id(params[:id])
        puts @group.name
        puts '################################'
        
    end
end
