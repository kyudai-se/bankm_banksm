module ApplicationHelper
  def bank_params_hidden_field_tags
    tags = bank_params.map do |value|
      hidden_field_tag(value)
    end
    tags.join.html_safe
  end
end
