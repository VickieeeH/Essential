class RecordsController < ApplicationController
  before_action :authenticate_user!

  def show
    @record = Record.find(params[:id])
  end

  def new
    @record = Record.new
  end

  def index
    @records = Record.all
  end

  def create
    @record = current_user.records.build(record_params)
    if @record.save
      redirect_to records_path
    else
    render action: "new"
    end
  end

  def update
    @record = Record.find(params[:id])
    if @record.update_attributes(record_params)
      flash[:success] = "Profile updated"
      redirect_to records_path
    else
      render 'edit'
    end
  end

  private

  def record_params
    params.require(:record).permit(:title, :content, :frequency, :due_date, :category_id)
  end
end
