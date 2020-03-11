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
        if params[:group_id]
           @group = Group.find_by_id(params[:group_id])
           @bar_data = [ ['Demand', 'Votes'] ]
           organinzer = {} 
           
           @group.votes.each do |vote|
             organinzer[vote.name] = vote.counter
            end
           organinzer = organinzer.sort_by {|k, v| v}

           organinzer.each do |name,votes|
            @bar_data << [name,votes]
           end
           
           return @bar_data
           
        end
    end
    def index
        
    end
    
    
end
