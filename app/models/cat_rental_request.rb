class CatRentalRequest < ActiveRecord::Base
  attr_accessible :cat_id, :start_date, :end_date, :status
  validates :cat_id, :start_date, :end_date, :status, :presence => true
  validates :status, inclusion: { in: %w{APPROVED DENIED PENDING},
            message: "%{value} is not a valid status" }
  validate :no_approved_overlapping_cat_requests

  belongs_to :cat, :dependent => :destroy

  before_validation :set_initial_status


  def approve!
    ActiveRecord::Base.transaction do
      self.status = "APPROVED" if self.status == "PENDING"
      self.save!
      overlapping_pending_requests.each do |request|
        request.deny!
      end
    end
  end

  def deny!
    self.status = "DENIED"
    self.save!
  end

  private

  def set_initial_status
    @status ||= "PENDING"
  end

  def no_approved_overlapping_cat_requests
    unless self.status == "DENIED"
      unless overlapping_approved_requests.empty?
        errors[:base] << "There's already an approved request during those dates."
      end
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

  def overlapping_pending_requests
    overlapping_requests.each_with_object([]) do |request, approved|
      approved << request if request.status == "PENDING"
    end
  end

end