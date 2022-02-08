class RecordsController < ApplicationController
  def entry
    @user = User.find_by(name: params[:name])
    @record = @user.records.build()
    if @record.save
      flash[:success] = "入室時間が記録されました"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def exit
    @user = User.find_by(name: params[:name])
    @record = Record.where(exit_at: nil).find_by(user_id:@user.id)
    @record.exit_at = DateTime.now
    if @record.save
      flash[:success] = "退室時間が記録されました"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def index
    @records = Record.all
  end

end
