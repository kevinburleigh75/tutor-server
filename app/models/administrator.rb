class Administrator < ActiveRecord::Base
  belongs_to :user, inverse_of: :administrator

  has_many :tasking_plans, as: :target, dependent: :destroy
  has_many :taskings, as: :taskee, dependent: :destroy

  validates :user, presence: true, uniqueness: true
end
