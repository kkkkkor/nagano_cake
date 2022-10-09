class Address < ApplicationRecord
    has_many :customers
    def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
    end
end