class RecordsController < ApplicationController
  def entry
    @user = User.find_by(name: params[:name])
    if @user
      @record = Record.where(exit_at: nil).find_by(user_id: @user.id)
      if @record
        flash[:success] = 'ユーザーはすでに入室しています。'
        redirect_to root_url
      else
        @record = @user.records.build()
        if @record.save
          flash[:success] = '入室時間が記録されました'
          redirect_to root_url
        else
          render 'static_pages/home'
        end
      end
    else
      flash[:success] = 'ユーザーが見つかりませんでした'
      redirect_to root_url
    end
  end

  def exit
    @user = User.find_by(name: params[:name])
    if @user
      @record = Record.where(exit_at: nil).find_by(user_id:@user.id)
      if @record
        @record.exit_at = DateTime.now
        if @record.save
          flash[:success] = '退室時間が記録されました'
          redirect_to root_url
        else
          render 'static_pages/home'
        end
      else
        flash[:danger] = 'ユーザーは入室していません'
        redirect_to root_url
      end
    else
      flash[:danger] = 'ユーザーが見つかりませんでした'
      redirect_to root_url
    end
  end

# ユーザーが居るかいないか判定リファクタリングできる

  def index
    @records = Record.all
  end
end
