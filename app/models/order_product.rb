class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum making_status: { not_started: 0, waiting: 1, make: 2, completion: 3 }
  # 0: 着手不可, 1:制作待ち, 2: 製作中, 3: 制作完了
end
