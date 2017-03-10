module ApplicationHelper # :nodoc:
  def flash_messages
    flash.each do |key, msg|
      content_tag(:div, msg, class: key)
    end
  end

  def flash_notice
    html = ''
    flash.each do |_name, msg|
      html += content_tag :div, msg, class: 'alert alert-warning alert-dismissible fade in' do
      end
    end
    flash.clear
    html.safe_join
  end

  def label_status(status)
    content_tag(:small, status, class: ['label', status_class(status)])
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
    content_tag(:small, priority, class: ['label', priority_class(priority)])
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
