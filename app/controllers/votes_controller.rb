class VotesController < ApplicationController
    def create
        @vote = current_user.votes.new(post_params)

        if @vote.save
            redirect_to '/vote', notice: 'Vote was successfully created.'
        else
            
            render :index, alert: 'Vote was not created.'
        end
    end
    def show
        @vote = Vote.find(params[:id])
    end

    def index
        @demands = Vote.all
    end
    
    def update
        puts '###############'
        puts params
        puts '###############'
        puts votes = Vote.find_by_id(params[:vote_id])
        puts '###############'
        puts votes
        puts '###############'

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
        redirect_to vote_url(id: votes.id)
        
    end


end
