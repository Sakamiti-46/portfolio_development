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
    @record = current_user.records
#@recordだが、中身がrecords（複数のレコードの集合）が入っている状態
    gon.data = @record.practices.group(:practice_item).sum(:practice_time)
    gon.data2 = @record.practices.where(practice_item: "サーブ練習")
    logger.info "practices.group #{gon.data}"
    logger.info "practices.group #{gon.data2}"
    logger.info "practices.group #{gon.data.inspect}"
    logger.info "practices.group #{gon.data2.inspect}"

    logger.info "practice_time #{params[:practice_time]}"
    logger.info "gon.data #{gon.data.inspect}"
    6.times do
      gon.data.to_a << rand(100.0)
    end
  end
    # .or(practice_item: "フットワーク").or(practice_item: "3球目攻撃")or(practice_item: "台上処理")or(practice_item: "多球練習")or(practice_item: "オール")


  # gon.data = Record.where(params[:practice_time])
  # paramsは、V

  # Parameters: {"id"=>"3"}を取得するのが、params[:id]
  # params


  private

  def set_user
    @user = current_user || User.new
  end

  def record_params
    params.require(:record).permit(:record_id, :training_date, :learning_point, outputs_attributes:[:output_name, :id, :_destroy], practices_attributes:[:practice_item, :practice_time, :id, :_destroy], tasks_attributes:[:task_name, :id, :_destroy]).merge(user_id: current_user.id)
  end
end