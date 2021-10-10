class SchedulesController < ApplicationController
  
  def index
    #@schedules = Schedule.all
    @q = Schedule.ransack(params[:q]) #ransackを導入してソート機能を実装
    @schedules = @q.result
  end
  
  def new
    @schedule = Schedule.new
  end
  
  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start, :end, :all_day, :memo))
    if @schedule.save
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to schedules_path
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
    if @schedule.update(params.require(:schedule).permit(:title, :start, :end, :all_day, :memo))
      flash[:notice] = "ID:#{@schedule.id} のスケジュールを更新しました"
      redirect_to schedules_path
    else
      render "edit"
    end
  end
  
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to schedules_path
  end
  
end
