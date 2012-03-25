module JobsHelper
  def link_to_sortable(column, title = nil, cssclasses = nil)
    title ||= column.titleize
    direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
    link_to title, { :sort => column, :direction => direction }, :class => cssclasses
  end
end
