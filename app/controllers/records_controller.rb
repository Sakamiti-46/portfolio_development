class RecordsController < ApplicationController
before_action :authenticate_user!

  def index
    @q = current_user.records.ransack(params[:q])
    @search_records = @q.result(distinct: true).includes(:practices).page(params[:page]).per(8)
  end

  def show
    @record = Record.find(params[:id])
  end

  def new
    @record = Record.new
    output = @record.outputs.build
    practice = @record.practices.build
    task = @record.tasks.build
    @item_array = ["サーブ練習","フットワーク", "３球目攻撃","台上処理","多球練習","オール"]
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
    @item_array = ["サーブ練習","フットワーク", "３球目攻撃","台上処理","多球練習","オール"]
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
  @label = ["3球目攻撃", "多球練習", "サーブ練習", "フットワーク","オール","台上処理"]
  gon.label = @label
  @record = current_user.records.includes(:practices).select(:practice_time).group(:practice_item).sum(:practice_time)
  logger.info "test #{@record.inspect}"
  gon.data = @record.values
  end

  private

  def set_user
    @user = current_user || User.new
  end

  def record_params
    params.require(:record).permit(:record_id, :training_date, :learning_point, outputs_attributes:[:output_name, :id, :_destroy], practices_attributes:[:practice_item, :practice_time, :id, :_destroy], tasks_attributes:[:task_name, :id, :_destroy]).merge(user_id: current_user.id)
  end
end