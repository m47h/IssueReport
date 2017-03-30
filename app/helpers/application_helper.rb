module ApplicationHelper # :nodoc:
  def label_status(status)
    content_tag(:span, status, class: ['label', status_class(status)])
  end

  def status_class(status)
    case status
    when 'Open'
      'label-default'
    when 'Pending'
      'label-warning'
    when 'Closed'
      'label-success'
    end
  end

  def label_priority(priority)
    content_tag(:span, priority, class: ['label', priority_class(priority)])
  end

  def priority_class(priority)
    case priority
    when 'Low'
      'label-primary'
    when 'Normal'
      'label-warning'
    when 'High'
      'label-danger'
    end
  end
end
