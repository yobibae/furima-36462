class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :item_shipping_fee_status
  belongs_to :prefecture
  belongs_to :item_scheduled_delivery

  belongs_to :user
  has_one_attached :image
  has_one :order

  validates :image, presence: true
  validates :name, presence: true
  validates :info, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :sales_status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_shipping_fee_status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_scheduled_delivery_id, numericality: { other_than: 1, message: "can't be blank" }
  VALID_PRICEL_REGEX = /\A[0-9]+\z/
  validates :price,
            presence: { message: "can't be blank" },
            format: { with: VALID_PRICEL_REGEX, allow_blank: true },
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 300,
              less_than_or_equal_to: 9_999_999,
              allow_blank: true
            }
end
