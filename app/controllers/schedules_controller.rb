class SchedulesController < ApplicationController
  protect_from_forgery :except => [:destroy]

  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      flash[:notice_success] = "スケジュールを新規登録しました"
      redirect_to :schedules
    else
      render "new"
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      flash[:notice_success] = "スケジュールを更新しました"
      redirect_to :schedules
    else
      render "edit"
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice_delete] = "スケジュールを削除しました"
    redirect_to :schedules
  end

  private
  def schedule_params
    params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :schedule_memo)
  end
end
