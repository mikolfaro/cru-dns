module ApplicationHelper
  def pretty_bool(bool)
    bool ? '✔' : '✘'
  end

  def error_block(model, field)
    messages = model.errors.full_messages_for(field)

    p_tags = messages.map do |msg|
      content_tag :p, class: 'help-block' do
        msg.capitalize
      end
    end

    p_tags.join.html_safe
  end
end
