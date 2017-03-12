class RecordsController < ApplicationController
  def index
    @records = Record.all
  end

  def new_a
    @record = Record::A.new
    index
  end
end
