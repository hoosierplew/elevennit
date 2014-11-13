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

  def post_link(post)
    link_to post.title, post.link || post
  end

  def sidebar(sidebar_content)
    content_for(:sidebar) { sidebar_content }
  end

  def comment_link_text( comment_count )
    "#{comment_count} #{'comment'.pluralize(comment_count)}"
  end
end
