class MyVotesController < ApplicationController
    before_action :authenticate_user!
    def create
        @my_vote = current_user.my_votes.new(post_params)

        if @my_vote.save
            
            render :index, alert: 'Your Vote was successfully created.'
        else
            
            render :index, alert: 'Vote was not created.'
        end
    end

    def show_group
        @group = Group.find_by_id(params[:group_id])
    end
    def show
        
        @votes = Vote.find_by_id(params[:vote_id])
    end
    def index
        
    end
    
    
end
