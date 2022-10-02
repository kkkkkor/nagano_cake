class Admin < ApplicationRecord
  enum response_status: { true: 0, false: 1 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end