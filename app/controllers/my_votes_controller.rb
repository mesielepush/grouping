# frozen_string_literal: true

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
    
    @data = helpers.get_data(params[:votes_id])
    @data
  end

  def show_group
    @group = Group.find_by_id(params[:group_id])
  end

  def show_group_freq
    if params[:group_id]
      @group = Group.find_by_id(params[:group_id])
      @bar_data = [%w[Demand Votes]]
      organizer = {}

      @group.votes.each do |vote|
        organizer[vote.name] = vote.counter
      end
      organizer = organizer.sort_by { |_k, v| v }

      organizer.each do |name, votes|
        @bar_data << [name[0..15] + '...', votes]
      rescue StandardError
        @bar_data << [name, votes]
      end

      @bar_data

    end
  end

  def index; end
end
