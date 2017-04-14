class User < ApplicationRecord
has_many :questions
has_many :answers, through: :questions

validates :username, presence: true
end
