class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  belongs_to :user
  has_one_attached :image
  # has_one :order

  validates :image, presence: true
  validates :name, presence: true
  validates :info, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sales_status_id, presence: true
  validates :item_shipping_fee_status_id, presence: true
  validates :prefecture_id, presence: true
  validates :item_scheduled_delivery_id, presence: true
end
