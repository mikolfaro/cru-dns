class RecordMxesController < ApplicationController
  before_action :set_current_record, except: [:new, :create]

  def new
    @record = Record::MX.new
  end

  def create
    @record = Record::MX.new(record_params)

    respond_to do |format|
      if @record.save
        format.html { redirect_to records_path, notice: 'Record created' }
        format.json { render :show, status: :created }
      else
        format.html { render "new_#{@record.type_s}" }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to records_path, notice: 'Record updated' }
        format.json { render :show, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to records_path, notice: 'Record deleted' }
      format.json { head :no_content }
    end
  end

  def set_current_record
    id = params[:id] || params[:record_id]
    @record = Record::MX.find(id)
  end

  def record_params
    params.require(:record_mx).permit(:name, :value, :ttl_seconds, :active, :priority)
  end
end
