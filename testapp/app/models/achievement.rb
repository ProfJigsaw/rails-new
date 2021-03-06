# Achievement model class inheriting form application record
class Achievement < ApplicationRecord
  validates :title, presence: true

  enum privacy: %i[public_access private_access friends_access]
end
