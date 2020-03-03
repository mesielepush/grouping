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

    def post_params
        params.require(:post).permit(:content)
      end
      def index
        @demands = Vote.all
      end
end
