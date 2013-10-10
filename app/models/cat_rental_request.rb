class CatRentalRequest < ActiveRecord::Base
  attr_accessible :cat_id, :start_date, :end_date, :status
  validates :cat_id, :start_date, :end_date, :status, :presence => true
  validates :status, inclusion: { in: %w{APPROVED DENIED PENDING},
            message: "%{value} is not a valid status" }
  validate :no_approved_overlapping_cat_requests

  belongs_to :cat, :dependent => :destroy

  before_validation :set_initial_status

  private

  def set_initial_status
    @status ||= "PENDING"
  end

  def no_approved_overlapping_cat_requests
    unless overlapping_approved_requests.empty?
      errors[:base] << "There's already an approved request during those dates."
    end
  end

  def overlapping_requests
    CatRentalRequest.where("cat_id = ? AND ((start_date BETWEEN ? AND ?) OR (end_date BETWEEN ? AND ?))", self.cat_id, self.start_date, self.end_date, self.start_date, self.end_date)
  end

  def overlapping_approved_requests
    overlapping_requests.each_with_object([]) do |request, approved|
      approved << request if request.status == "APPROVED"
    end
  end

end