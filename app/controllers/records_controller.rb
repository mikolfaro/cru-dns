class RecordsController < ApplicationController
  before_action :set_records

  def index
  end

  private

  def set_records
    @records = Record::A.all + Record::MX.all
  end
end
