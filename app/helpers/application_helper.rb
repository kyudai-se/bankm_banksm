module ApplicationHelper
  def bank_params_hidden_field_tags(*param_keys)
    tags = bank_params(*param_keys).map do |key, value|
      hidden_field_tag(key, value)
    end
    tags.join.html_safe
  end
end
