class Task < ApplicationRecord
  belongs_to :user

  validate :title, presence: true
end
