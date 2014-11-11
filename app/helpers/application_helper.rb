module ApplicationHelper
  def flash_class(name)
    alert_type = case name.to_s
      when 'notice'  then 'success'
      when 'error'   then 'alert'
      when 'alert'   then 'alert'
      when 'info'    then 'info'
      when 'warning' then 'warning'
      else 'secondary'
    end
    alert_type
  end
end
