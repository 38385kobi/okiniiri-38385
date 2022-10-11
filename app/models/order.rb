class Order < ApplicationRecord
  class Order < ApplicationRecord
    belongs_to :user
    belongs_to :item
    has_one :destination
  end
end
