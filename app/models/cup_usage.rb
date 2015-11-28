class CupUsage
  include Mongoid::Document

  field :date, :type => Time
  field :reusable_cups, :type => Integer
  field :disposable_cups, :type => Integer

  belongs_to :user
end
