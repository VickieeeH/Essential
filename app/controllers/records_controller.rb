class RecordsController < ApplicationController
  before_action :authenticate_user!

  def show
    @record = current_user.records.find(params[:id])
  end

  def new
    @record = current_user.records.new
  end

  def index
    @records = current_user.records.all
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
    @record = current_user.records.find(params[:id])
    if @record.update_attributes(record_params)
      flash[:success] = "Record updated"
      redirect_to records_path
    else
      render 'edit'
    end
  end

  def destroy
    respond_to do |format|
      format.html { redirect_to records_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_status
    @record = current_user.records.find(params[:id])
    return if @record.status == 3
    if @record.update_attributes({status: (@record.status + 1)})
      flash[:success] = "Record updated"
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
