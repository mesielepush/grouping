class VotesController < ApplicationController
    def new
        @vote = Vote.new()
        @group_id = params[:group_id]
    end
    def create
        @vote = current_user.votes.new(vote_params)
       
        if @vote.save
           
            redirect_to demand_url(id: @vote.id), notice: 'Demand was successfully created.'
        else
            
            render :show, alert: 'demand was not created.'
        end
    end
    def show
        @vote = Vote.find(params[:votes_id])
    end

    def index
        @demands = Vote.all
    end
    
    def update
        
        votes = Vote.find_by_id(params[:votes_id])
        
        if params[:vote] == 'up'
            votes.counter += 1
            votes.save
            if current_user.my_votes.where(votes_id: votes.id).last == nil
                current_user.my_votes.new(votes_id: votes.id, counter: 1).save
            else
                count = current_user.my_votes.where(votes_id: votes.id).last.counter
                current_user.my_votes.new(votes_id: votes.id, counter: count+1).save
            end
        elsif params[:vote]== 'down'
            votes.counter -= 1
            votes.save
            if current_user.my_votes.where(votes_id: votes.id).last == nil
                current_user.my_votes.new(votes_id: votes.id, counter:1).save
            else
                count = current_user.my_votes.where(votes_id: votes.id).last.counter
                current_user.my_votes.new(votes_id: votes.id, counter: count-1).save
            end
        end
        redirect_to vote_url(votes_id: votes.id)
        
    end
    private
    def vote_params
        params.require(:vote).permit(:name, :description, :gravatar_url,:group_id,:counter)
    end

end
