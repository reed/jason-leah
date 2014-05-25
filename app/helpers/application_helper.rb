module ApplicationHelper
  def p_space(content)
    "&nbsp;#{content}".html_safe
  end

  def a_space(content)
    "#{content}&nbsp;".html_safe
  end
end
