class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :grade
end
