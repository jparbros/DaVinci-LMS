module ApplicationHelper

  def breadcrumb(*argv) 
    list_items = argv.collect { |item| "<li>#{item}</li>" }
    divider = "<li><span class='divider'> ></span></li>"
    html = "<ul class='breadcrumb'>#{list_items.join(divider)}</ul>".html_safe
  end

end
