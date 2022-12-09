class UserRecruitment <  ApplicationRecord
    belongs_to :recruitment
    belongs_to :user
    validates_uniqueness_of :recruitment_id, scope: :user_id

end