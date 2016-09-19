class Question < ActiveRecord::Base
  validates_presence_of :a_answer
  validates_presence_of :b_answer
  validates_presence_of :a_votes
  validates_presence_of :b_votes
  belongs_to :user
end
