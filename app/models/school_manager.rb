class SchoolManager < ActiveRecord::Base
  belongs_to :user
  belongs_to :school

  has_many :tasking_plans, as: :target, dependent: :destroy
  has_many :taskings, as: :taskee, dependent: :destroy

  validates :user, presence: true
  validates :school, presence: true,
                     uniqueness: { scope: :user_id }
end
