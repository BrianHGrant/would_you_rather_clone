module ApplicationHelper
  def vote_percentage(x, y)
    vote_float = ( x / (x + y) ) * 100
    vote_float.round
  end
end
