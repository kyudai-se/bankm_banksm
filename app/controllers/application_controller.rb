class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def default_bank_param_keys
    %w(bank_j_search per_bank_j_search, bank_cd_search per_bank_cd_search)
  end

  def bank_params(*param_keys)
    overwrites = param_keys.extract_options!
    param_keys = default_bank_param_keys if param_keys.blank?
    params.dup.extract!(*param_keys).update(overwrites)
  end
  helper_method :bank_params
end
