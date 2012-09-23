class User < ActiveRecord::Base

	before_validation :generate_password, :on => :create

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def generate_password
    o =  [('a'..'z'), ('A'..'Z'), (0..9)].map{|i| i.to_a}.flatten
    self.password = self.password_confirmation = (1..7).map{ o[rand(o.length)] }.join if self.password.blank?
  end

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :contact_no, :address, :password, :password_confirmation, :remember_me,
  								:confirmed_at, :avatar

  validates_presence_of :name, :contact_no, :address
  validates_uniqueness_of :name, :email, :case_sensitive => false

  has_attached_file :avatar,
                    :storage => :database,
                    :styles => { :thumb => "75x75>", :small => "150x150>" },
                    :url => '/:class/:id/:attachment?style=:style'

  has_many :items, dependent: :delete_all

  has_many :item_users, dependent: :delete_all
  has_many :items, through: :item_users

end
