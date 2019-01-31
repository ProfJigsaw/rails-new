# Achievement model class inheriting form application record
class Achievement < ApplicationRecord
  enum privacy: %i[public_access private_access friends_access]
end
