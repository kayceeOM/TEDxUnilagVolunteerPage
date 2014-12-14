class VolunteerApplication < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :course, presence: true
  validates :year, presence: true, numericality: {less_than: 6, greater_than: 0}
  validates :interest, presence: true
  validates :reason, presence: true

  paginates_per 5


  def accepted?
    self.accepted == 1
  end

  def self.accepted
    where accepted: 1
  end

  def accept!
    if not self.accepted?
      self.accepted = 1
    end
  end

  def revoke!
    if accepted?
      self.accepted = 0
    end
  end


  def self.search(query)
    where 'name LIKE ? OR interest LIKE ? OR course LIKE ?', "%#{query}%", "%#{query}%", "%#{query}%"
  end
end
