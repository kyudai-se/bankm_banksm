class SelectController < ApplicationController
  def select_page
    @master_id = MasterId.new
  end
end
