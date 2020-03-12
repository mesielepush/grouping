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
        vote = params[:votes_id]

        raw_data = {}

        votes = MyVote.where(votes_id: vote)
        collaborators = {}
        votes.each do |vote|
            collaborators[vote.user_id] = []
        end

        collaborators.each do     |key,value|
            my_votes = votes.where(user_id: key)
            my_votes = my_votes.order(:created_at)
            my_votes.each do |vote|
                collaborators[key] << vote.counter
            end
        end
        min_len = []
        collaborators.each do |key,value|
            min_len << collaborators[key][value].lenght
        end
        min_len = min_len.min

        

        

    end

    def show_group
        @group = Group.find_by_id(params[:group_id])
    end

    def show_group_freq
        if params[:group_id]
           @group = Group.find_by_id(params[:group_id])
           @bar_data = [ ['Demand', 'Votes'] ]
           organinzer = {} 
           
           @group.votes.each do |vote|
             organinzer[vote.name] = vote.counter
            end
           organinzer = organinzer.sort_by {|k, v| v}

           organinzer.each do |name,votes|
            begin
                @bar_data << [name[0..15]+'...',votes]
            rescue
                @bar_data << [name,votes]
            end
           end
           
           return @bar_data
           
        end
    end

    def index
        
    end
    
    
end
