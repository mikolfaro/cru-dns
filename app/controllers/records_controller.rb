class RecordsController < ApplicationController
  before_action :set_records
  before_action :set_current_record, only: :update

  def index
  end

  [Record::A, Record::MX].each do |record_class|
    type = record_class.type_s.downcase
    define_method "new_#{type}" do
      @record = record_class.new
    end
  end

  def create
    @record = record_class.new record_params

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

  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to records_path, notice: 'Record update' }
        format.json { render :show, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def record_class
    return Record::MX if params.has_key? :record_mx
    Record::A
  end

  def record_params
    record_class.check(params)
  end

  def set_records
    @records = Record.all
  end

  def set_current_record
    @record = Record.find(params[:id])
  end
end
