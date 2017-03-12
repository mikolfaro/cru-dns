class RecordsController < ApplicationController
  before_action :set_records

  def index
  end

  def new_a
    @record = Record::A.new
  end

  def new_mx
    @record = Record::MX.new
  end

  private

  def set_records
    @records = Record.all
  end
end
