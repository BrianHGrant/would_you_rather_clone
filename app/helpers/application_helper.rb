module ApplicationHelper
  def vote_percentage(x, y)
    if x == 0
      0
    else
      vote_float = ( x / (x + y) ) *100
      vote_float.round
    end
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == params[:sort] && params[:direction] == "ASC" ?
    "DESC" : "ASC"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
end
