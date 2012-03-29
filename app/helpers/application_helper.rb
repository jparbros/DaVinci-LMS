# encoding: utf-8
module ApplicationHelper

  def breadcrumb(*argv) 
    list_items = argv.collect { |item| "<li>#{item}</li>" }
    divider = "<li><span class='divider'> ></span></li>"
    html = "<ul class='breadcrumb'>#{list_items.join(divider)}</ul>".html_safe
  end
  
  def info_message(message)
    if message      
      <<-html
        <div class='alert alert-info'>
          #{message}
        </div>
      html
    end
  end

end
