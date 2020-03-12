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
    vote = params[:votes_id]
    @data = {}
    raw_data = {}

    votes = MyVote.where(votes_id: vote)
    collaborators = {}
    coll_ids = []
    votes.each do |vote|
      collaborators[vote.user_id] = []
    end

    collaborators.each do |key, _value|
      coll_ids.push(User.find_by_id(key).name)
      my_votes = votes.where(user_id: key)
      my_votes = my_votes.order(:created_at)
      my_votes.each do |vote|
        collaborators[key] << vote.counter
      end
    end
    max_len = []
    collaborators.each do |key, _value|
      max_len << collaborators[key].length
    end
    max_len = max_len.max

    collaborators.each do |key, _value|
      next unless collaborators[key].length < max_len

      (max_len - collaborators[key].length).times do
        collaborators[key] << collaborators[key].last
      end
    end
    cum_data = []
    (1..max_len - 1).each do |index|
      row = []
      row << index
      input = []
      collaborators.each do |key, _value|
        input.push(collaborators[key][index])
      end
      input.each do |datum|
        row.push(datum)
      end

      cum_data.push(row)
    end

    @data[:data] = cum_data
    @data[:coll_ids] = coll_ids
    @data[:title] = Vote.find_by_id(vote).name
    @data[:votes_id] = vote
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
