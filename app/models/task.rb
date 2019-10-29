class Task < ApplicationRecord
  belongs_to :usr
  validates :name, presence: true
  validates :content, presence: true
  validates :content, length: {minimum: 2, maximum: 20}
  validates_presence_of :usr_id
  # validate :start_datetime_cannot_be_later_than_end_datetime
  enum priority: [:low, :medium, :hight]
  has_many :tasks_labels
has_many :labels, :through => :tasks_labels
accepts_nested_attributes_for :tasks_labels, :reject_if => proc { |a|
   a['label_id'].blank? }
accepts_nested_attributes_for :labels
  # private
  # def start_datetime_cannot_be_later_than_end_datetime
  #   if start_date > end_date
  #     errors.add(:start_datetime, "Can not be set after the end date and time")
  #   end
 
  # end
  paginates_per 3

  def self.search(terms)
    if terms
      where('name LIKE ?, "#%{terms}"')
    else
      order('id desc')
  end
  end 
end
