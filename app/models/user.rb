class User < ActiveRecord::Base
  has_one :license, dependent: :destroy
  accepts_nested_attributes_for :license

  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/ }, presence: true
  validates :name, presence: true

  def email=(value)
    value = value.downcase.strip
    write_attribute :email, value
  end
end
