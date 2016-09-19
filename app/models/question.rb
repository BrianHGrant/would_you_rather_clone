class Question < ActiveRecord::Base
  validates_presence_of :content
  validates_presence_of :a_answer
  validates_presence_of :b_answer
  validates_presence_of :a_votes, :default 0
  validates_presence_of :b_votes, :default 0
  belongs_to :user

end
