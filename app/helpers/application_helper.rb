# encoding: utf-8
module ApplicationHelper

  def breadcrumb(*argv)
    list_items = argv.collect { |item| "<li>#{item}</li>" }
    divider = "<li><span class='divider'> ></span></li>"
    html = "<ul class='breadcrumb'>#{list_items.join(divider)}</ul>".html_safe
  end

  def display_alert(message)
    if message
      <<-html
        <div class='hide alert alert-#{message[:type]}'>
          #{message[:message]}
        </div>
        <script type="text/javascript">
          $(document).ready( function(){
              $(".alert").fadeIn('fast');
          });
        </script>
      html
    end
  end

  def alert_message(type = :info, message)
    @message = {type: type, message: message}
  end

end
