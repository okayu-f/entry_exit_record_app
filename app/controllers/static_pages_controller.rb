class StaticPagesController < ApplicationController
  def home
    @records_in_room = Record.where(exit_at: nil)
    @users = User.all
  end

  def help
  end

  def test
  end
end
