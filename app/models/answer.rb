class Answer < ApplicationRecord
belongs_to :question
belongs_to :user

validates :description, length: { minimum: 50 }
end
