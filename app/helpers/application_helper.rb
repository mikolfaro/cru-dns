module ApplicationHelper
  def pretty_bool(bool)
    bool ? '✔' : '✘'
  end

  def error_block(model, field)
    errors = model.errors[field]
    return '' if errors.empty?

    p_tags = errors.full_messages.map do |msg|
      content_tag p, msg, class: 'help-block'
    end

    p_tags.join
  end
end
