class Schedule < ApplicationRecord
  validates :title, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validate :start_end_check



  private
    # 開始日と終了日の逆転を許可しない
    def start_end_check
      if self.start.present? && self.end.present?
        errors.add(:end, "は開始日より前に設定できません") unless self.start <= self.end
      end
    end


end
