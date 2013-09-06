module ApplicationHelper

  def full_title(page_title)
    base_title = 'davetoxa.info'
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def flash_class(level)
    case level
      when :notice then 'alert-success'
      when :alert then 'alert-error'
    end
  end

end
