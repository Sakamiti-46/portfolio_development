class RecordsController < ApplicationController
  before_action :set_user

  def index
    @records = Record.all.order(created_at: 'desc')
    # @q = Record.ransack(params[:q])
    # @records = @q.result(distinct: true)
    # ransackで検索機能実装予定
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
    output = @record.outputs.build
    practice = @record.practices.build
    task = @record.tasks.build

    logger.info "###### #{@record.inspect}"
    if @record.save
      redirect_to records_url, notice: "練習内容の登録が完了しました。"
    else
      flash[:alert] = "登録に失敗しました。"
      render :new
    end
  end

  def edit
    @records = Record.all
  end

  def destroy
    record = Record.find(params[:id])
    record.destroy
    redirect_to root_to_path, notice: "練習記録を削除しました。"
  end


  private

  def set_user
    @user = current_user || User.new
  end

  def record_params
    params.require(:record).permit(:training_date, :learning_point)
  end

end
