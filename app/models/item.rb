class Item < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shippong_cost_id, presence: true
  validates :shippong_area_id, presence: true
  validates :shippong_days_id, presence: true
  validates_format_of :price, with: /\A[0-9]+\z/, numericality: { in: 300..9,999,999 }, presence: true
  validates category_id:, condition_id:, shippong_cost_id:, shippong_area_id:, shippong_days_id:, numericality: { other_than: 1, message: "can't be blank" } 
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shippong_area
  belongs_to :shippong_cost
  belongs_to :shippong_days
  belongs_to :user
  has_one_attached :image

end
