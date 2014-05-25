class Rsvp < ActiveRecord::Base

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attr_accessor :guest_list

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :guests, presence: true

  def guest_list=(list)
    list = list.split(',').map(&:strip) unless list.is_a? Array
    self.guests = list
  end

  def self.guest_count
    pluck(:guests).flatten.count
  end
end
