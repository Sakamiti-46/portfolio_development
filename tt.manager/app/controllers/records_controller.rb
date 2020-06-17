class RecordsController < ApplicationController
before_action :authenticate_user!

  def index
    @records = current_user.records.includes(:practices).page(params[:page]).per(8)
    # total_practice_time = Record.includes(:practices)
    #   total_practice_time.each do |total|
    #     total.sum(:practice_time)
    #   end
    @q = Record.ransack(params[:q])
    @search_records = @q.result(distinct: true)
  end

  def show
    @record = Record.find(params[:id])
  end

  def new
    @record = Record.new
    output = @record.outputs.build
    practice = @record.practices.build
    task = @record.tasks.build
  end

  def create
    @record = Record.new(record_params)
    logger.info "###### #{@record.inspect}"
    if @record.save
      flash[:success] = "練習内容の登録が完了しました。"
      redirect_to records_url
    else
      flash[:alert] = "登録に失敗しました。"
      render :new
    end
  end

  def edit
    @record = Record.find_by(id: params[:id])
  end

  def update
    @record = Record.find_by(id: params[:id])
    if @record.update(record_params)
        flash[:success] = "練習内容の更新が完了しました。"
        redirect_to records_url
      else
        flash[:alert] = "更新に失敗しました。"
        render :edit
      end
  end

  def destroy
    record = Record.find_by(id:params[:id])
    record.destroy

    redirect_to root_path, notice: "練習記録を削除しました。"
  end

  def aggregate_result
    @record = Record.find(params[:id])
    gon.data = Record.where(params[:practice_time])
    6.times do
      # gon.data << rand(100.0)
    end
  end

  private

  def set_user
    @user = current_user || User.new
  end

  def record_params
    params.require(:record).permit(:record_id, :training_date, :learning_point, outputs_attributes:[:output_name, :id, :_destroy], practices_attributes:[:practice_item, :practice_time, :id, :_destroy], tasks_attributes:[:task_name, :id, :_destroy]).merge(user_id: current_user.id)
  end
end