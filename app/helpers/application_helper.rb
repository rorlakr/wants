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

  def employee_status(value)
    ret = [ ['IT 개발업체 재직 중...', '1'], ['프리랜서','2'],['타직종에서 재직 중...','3'],['취업 준비 중...','4'],['기타','9']].select { | emp | emp[1] == value }
    if ret.size > 0
      ret[0][0]
    else
      "N/A"
    end
  end

end