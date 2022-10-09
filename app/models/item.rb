class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_cost_id, presence: true
  validates :shipping_area_id, presence: true
  validates :shipping_days_id, presence: true
  validates :price, format: { with: /\A[0-9]+\z/ },numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, presence: true
  validates :category_id, :condition_id, :shipping_cost_id, :shipping_area_id, :shipping_days_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_area
  belongs_to :shipping_cost
  belongs_to :shipping_days
  belongs_to :user
  has_one_attached :image
end
