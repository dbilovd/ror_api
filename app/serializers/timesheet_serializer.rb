class TimesheetSerializer < ActiveModel::Serializer
  attributes :id, :company, :date, :start_time, :end_time
  has_one :employee

  def start_time
  	object.start_time.strftime("%H:%M")
  end

  def end_time
  	object.end_time.strftime("%H:%M")
  end
end
