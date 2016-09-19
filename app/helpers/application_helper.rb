module ApplicationHelper
  def vote_percentage(x, y)
    if x == 0
      0
    else
      vote_float = ( x / (x + y) ) * 100
      vote_float.round
    end
  end
end
