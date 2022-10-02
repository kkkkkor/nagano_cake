class Item < ApplicationRecord
  belongs_to :genre
  has_one_attached :image
  enum status: {
    on_sale:  0,   # 販売中
    sold_out: 1,   # 売り切れ
  }
end
