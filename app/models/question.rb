class Question < ApplicationRecord
belongs_to :user
has_many :answers
validates :title, length: { minimum: 20 }
validates :description, length: { minimum: 50 }
# validates :user_id, presence: { message: "Please sign in to ask a question." }

end
