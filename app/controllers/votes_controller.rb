# frozen_string_literal: true

class VotesController < ApplicationController
  def new
    @vote = Vote.new
    @group_id = params[:group_id]
  end

  def create
    @vote = current_user.votes.new(vote_params)

    if @vote.save

      redirect_to demand_url(votes_id: @vote.id), notice: 'Demand was successfully created.'
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

  # rubocop:disable Metrics/AbcSize
  def update
    votes = Vote.find_by_id(params[:votes_id])

    case params[:vote]
    when 'up'
      votes.counter += 1
      votes.save
      begin
        count = current_user.my_votes.where(votes_id: votes.id).last.counter
        current_user.my_votes.new(votes_id: votes.id, counter: count + 1).save
      rescue StandardError
        count = current_user.my_votes.where(votes_id: votes.id).last.counter
        current_user.my_votes.new(votes_id: votes.id, counter: count + 1).save
      end

    when 'down'
      votes.counter -= 1
      votes.save
      begin
        count = current_user.my_votes.where(votes_id: votes.id).last.counter
        current_user.my_votes.new(votes_id: votes.id, counter: count - 1).save
      rescue StandardError
        current_user.my_votes.where(votes_id: votes.id).last.nil?
        current_user.my_votes.new(votes_id: votes.id, counter: 1).save
      end
    end
    redirect_to vote_url(votes_id: votes.id)
  end
  # rubocop:enable Metrics/AbcSize

  private

  def vote_params
    params.require(:vote).permit(:name, :description, :gravatar_url, :group_id, :counter)
  end
end
