class ApplicationController < ActionController::Base
  @records_in_room = Record.where(exit_at: nil)
end
