module ApplicationHelper
  def bootstrap_class_for flash_type
      { success: "alert-success", error: "alert-error", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible", role:'alert') do
        concat(content_tag(:button, class: "close", data: { dismiss: 'alert', aria: { label:'Close' } }) do
          concat(content_tag(:span, raw('&times;'), aria: { hidden: 'true'}))
        end)
        concat message
      end)
    end
    nil
  end
end

# <div class="alert alert-warning alert-dismissible" role="alert">
#   <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
#   <strong>Warning!</strong> Better check yourself, you're not looking too good.
# </div>