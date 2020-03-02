class MyVotesController < ApplicationController
    def create
        @my_vote = current_user.my_votes.new(post_params)

        if @my_vote.save
            
            notice: 'Your Vote was successfully created.'
        else
            
            render :index, alert: 'Vote was not created.'
        end
    end
    def show
        @my_vote = Vote.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:content)
      end
end
