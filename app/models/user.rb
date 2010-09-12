require "digest"
 
class User < ActiveRecord::Base
  has_many :task_lists
  
  validates_uniqueness_of :username
  validates_presence_of :username, :password
  validates_confirmation_of :password
 
  # Encrypt password before save
  def before_save
    self.salt = random_numbers(5) if self.salt.nil?
    self.password = Digest::MD5.hexdigest(self.salt + self.password)
  end
 
  # Verify password matches before login
  def password_matches?(password_to_match)
    self.password == Digest::MD5.hexdigest(self.salt + password_to_match)
  end
 
  private
 
  def random_numbers(len)
    numbers = ("0".."9").to_a
    newrand = ""
    1.upto(len) { |i| newrand << numbers[rand(numbers.size - 1)] }
    return newrand
  end 
end