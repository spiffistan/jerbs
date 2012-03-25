module JobsHelper
  def link_to_sortable(column, title = nil, css_classes = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction} #{css_classes}" : nil
    direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"

    html_link = link_to title, { :sort => column, :direction => direction }, :class => css_class

    if column == sort_column and direction == 'asc'
      html_link = html_link + ' <i class="icon-chevron-up"></i>'.html_safe
    elsif column == sort_column and direction == 'desc'
      html_link = html_link + ' <i class="icon-chevron-down"></i>'.html_safe
    end

    return html_link
  end
end
