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
    def show
        if params[:group_id] != nil
            return @group = Group.find_by_id(params[:group_id])
        else
            return @vote = Vote.find_by_id(params[:vote_id])
        end

    end

    def index
        
    end
    
    
end
