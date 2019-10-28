class Task < ApplicationRecord
  belongs_to :usr
  validates :name, presence: true
  validates :content, presence: true
  validates :content, length: {minimum: 2, maximum: 20}
  validates_presence_of :usr_id
  # validate :start_datetime_cannot_be_later_than_end_datetime
  enum priority: [:low, :medium, :hight]
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
