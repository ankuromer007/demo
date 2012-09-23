class Item < ActiveRecord::Base

  attr_accessible :name, :description, :image, :base_price, :deadline, :status

  validates :name, :base_price, :deadline, presence: true
  validates :base_price, numericality: true

  belongs_to :user
  validates :user, presence: true

  has_many :item_users, dependent: :delete_all
  has_many :users, through: :item_users

  has_attached_file :image,
                    :storage => :database,
                    :styles => { :thumb => "75x75>", :small => "150x150>" },
                    :url => '/:class/:id/:attachment?style=:style'

  self.per_page = 10
end
