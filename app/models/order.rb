class Order < ApplicationRecord
  enum method_of_payment: { credit_card: 0, transfer: 1 }
  enum status: { waiting: 0, paid_up: 1, make: 2, preparing: 3, shipped: 4 }
  # 0: 入金待ち, 1:入金確認, 2: 製作中, 3: 発送準備中, 4: 発送済み
  belongs_to :customer
  has_many :order_products
end
