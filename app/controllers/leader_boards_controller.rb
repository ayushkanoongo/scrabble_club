class LeaderBoardsController < ApplicationController

  def index
    member_ids = Member.joins(:participants).group('members.id').having("count(participants.id)>=10")
    # @members = Member.where(id: member_ids).includes(:participants).order('avg(participants.score) desc')#.limit(10)
    # puts @members.length

    @members = Member.where(id: member_ids).joins(:participants)
      .select("members.id, members.first_name, members.last_name, avg(participants.score) as average_score, count(participants.id) as number_of_matches")
      .group("members.id")
      .order("average_score DESC")
      .limit(10)
  end
end
